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

### DataSourceTransactionManager流程