### Transaction事务代理生成

1. 不论是AutoConfiguration还是@EnableTransactionManagement入口最终都是@EnableTransactionManagement
2. AOP实现有两种PROXY和ASPECTJ
   - PROXY CGLIB和JDK生成两种 运行时生成 简单
   - ASPECTJ 通过打包或者加载时候生成 效率比PROXY高 但是相对复杂 同类调用生效
3. @Import注解结合ImportSelector可以实现通过@EnableXXX此类注解的属性初始化不同的Bean
4. @EnableTransactionManagement最终初始化了两个Bean 一个是AutoProxyRegistrar 一个是ProxyTransactionManagementConfiguration
5. AutoProxyRegistrar大概是生成代理类 顺序
   - AbstractAutoProxyCreator.wrapIfNecessary()
   - AbstractAdvisorAutoProxyCreator.getAdvicesAndAdvisorsForBean()获取Advisor的Bean
   - AbstractAdvisorAutoProxyCreator.findAdvisorsThatCanApply()获取需要生成的Advisor
   - AopUtils.canApply()判断能否生成代理 判断依据是Advisor里的Pointcut对象
6. 两个Advisor可以参考下TransactionAttributeSourceAdvisor和DynamicDataSourceAnnotationAdvisor
7. Advisor主要两部组成 一个PointCut 一个是advice
   - PointCut决定生不生代理类
   - advice决定功能 advice分两类 一类是before/after/round 一类是Interceptor  不过最终都是Interceptor
8. ProxyTransactionManagementConfiguration就是创建事务Advisor的Bean的
9. spring相关类
   - Advisor类->BeanFactoryTransactionAttributeSourceAdvisor  
   - PointCut->TransactionAttributeSourcePointcut  
   - Advice->TransactionInterceptor 
   - TransactionAttributeSource这个类重要方法是getTransactionAttribute() 在pointCut和Advice的invoke都会用到

### DataSourceTransactionManager事务传递测试

1. REQUIRED(默认)
   - case1 里报错 外try     整个回滚 因为事务已经标记成rollback only
   - case2 里报错 外正常  整个回滚
   - case3 里正常 外报错  整个回滚
2. REQUIRES_NEW-里外事务不一样
   - case1 里报错 外try     里面回滚 外面提交
   - case2 里报错 外正常  整个回滚
   - case3 里正常 外报错  里面提交 外面回滚
3. NESTED-里外事务一样
   - case1 里报错 外try     里面回滚 外面提交
   - case2 里报错 外正常  整个回滚
   - case3 里正常 外报错  整个回滚
4. 总结
   1. rollback是切面上面设置的
   2. NESTED在mysql上利用了savepoint特性 还是慎用

### DataSourceTransactionManager流程

### Mybatis和Spring开启事务流程

1. AbstractPlatformTransactionManager.startTransaction 切面开启事务
   1. startTransaction->DataSourceTransactionManager.doBegin
      1. doBegin->txObject.getConnectionHolder().getConnection() 获取数据库连接
      2. doBegin->TransactionSynchronizationManager.bindResource(a,b)) 把连接保存在resources(ThreadLocal) key是数据源
   2. startTransaction->AbstractPlatformTransactionManager.prepareSynchronization 初始化synchronizations(ThreadLocal) 用于后面判断是否开启了事务
2. SqlSessionTemplate.SqlSessionInterceptor.invoke() 
3. SqlSessionUtils.getSqlSession 获取session
   1. TransactionSynchronizationManager.getResource(sessionFactory) 从resources(ThreadLocal)获取mybatis's holder 然后再获取session key是mybatis's sessionFactory
      1. 如果获取不到session 创建一个session和holder 然后放到resources(ThreadLocal)中
      2. 如果获取得到就返回
4. DataSourceUtils.doGetConnection 获取数据源对应的连接 有事务的从事务holder中获取 没有的从dataSource中get一个

### 多线程下编程式事务管理

1. transactionManager.getTransaction(def) 手动开启事务 返回对象DefaultTransactionStatus
2. DefaultTransactionStatus里面包含了本次事务用到的数据库连接
3. 情景
   1. Main线程开启AB两个线程 AB线程开启事务 并且DefaultTransactionStatus 保存到Main线程
   2. 执行后 Main线程commit AB线程的DefaultTransactionStatus
4. 针对情景3 有下面的分析
   1. AB的数据是可以提交的 因为DefaultTransactionStatus包含了数据库conn conn.commit不受影响
   2. 假设A线程执行sql后报错 那么上面的情景数据还是会被提交的 因为没有把rollback信息写到DefaultTransactionStatus
   3. 即使正常使用的情况下 假如报错没有经过切面 其实也是可以提交成功 一样的道理
   4. Main线程下 A事务commit后 B其实commit不到的 Main线程commit也是失败的 因为commit后会clean掉执行commit的线程的ThreadLocal变量
   5. 这些ThreadLocal是aop上面控制事务情况的 如果AB线程开启事务 但是却在Main线程提交 会造成DefaultTransactionStatus和ThreadLocal变量不一致 从而引发各种奇怪问题