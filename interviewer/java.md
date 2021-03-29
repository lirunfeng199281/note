### java基础

1. 对象比较 
   1. 字符串比较
   2. 对象比较 重写equal和hashcode方法
   3. Integer a = null ；1 == a
   4. BigDecimal比较
2. 对象复制
3. 集合
   1. 两种List 1）为什么经常插入新增不用ArrayList 2）遍历过程中要删掉元素怎么操作 3）Arrays.asList后可以add吗
   2. Set
   3. 两种Map 1）HashMap key value都可以null ? 2）知道size 怎么创建HashMap
4. 设计模式 单例（写个双重检查） 策略（项目中具体使用 需要有类型）
5. 泛型 1）方法和类怎么声明 2）(--)泛型擦除了解
6. Exception和RuntimeException哪个需要try catch或者throws才能编译通过
7. (--)线程和线程池
8. (--)进程锁

### spring

1. 声明@Service @Controller作用是什么 加载到Spring容器 给其他bean使用
2. @Transactional注解里面的属性
   1. rollbackFor 一般怎么设置
   2. (--)说下事务传播或者说下有没有业务场景用到了非默认的传播性
3. 怎么开启异步执行
   1. @Async 
   2. (--)@Async的value属性了解过  用于指定线程池 有什么场景需要这样做
4. AOP
   1. 基于什么设计模式
   2. 举个项目中使用的例子
   3. 什么情况会失效
      1. 同类 private
      2. (--)为什么

### springMVC

1. 默认返回json是用哪种框架转 jackson?fastjson?
2. get post区别 长度必须要有
3. request session作用域?
4. 浏览器怎么保存session的?  cookie
5. cookie一些属性
   1. domain 跨域可以问问
   2. max-age 结合框架可以问问
   3. http-only 安全可以问问
   4. same-size 新属性可以问问

### springBoot

1. 简单说下自动加载
2. ConditionalOnBean这些注解问下
3. 要做个starter怎么做
   1. spring.factories
   2. (--)假如不用spring.factories怎么做
4. (--)springboot默认扫包路径是什么

### 散装

1. maven
   1. 几个声明周期 complie install deploy
   2. (--)pom
2. git
   1. 冲突怎么处理
3. linux
   1. 考几条命令

### 中间件

1. redis在项目中有哪些应用场景
   1. 缓存
      1. 击穿应用场景是什么 怎么处理
      2. 雪崩应用场景是什么 怎么处理
   2. 锁 描述下关键点 
      1. 原子性   (--)为什么
      2. 超时 (--)为什么
      3. 唯一标识 (--)为什么
2. mq在项目中有哪些应用场景
   1. 削峰填谷 怎么削法
   2. 解耦  怎么解法 这样做业务需要改变什么
   3. 最终一致性  延伸分布式事务
      1. 刚性 没啥好问
      2. 柔性 怎么处理 加状态? 加几个? 超时怎么处理
3. mysql
   1. 索引失效场景
      1. 函数 回归面试题
      2. 类型转换
      3. like
      4. not in
   2. (--)锁
   3. (--)MVVC
   4. (--)大表线上DDL

### 项目经验自由发挥...

### 开放性题目

1. 线上一条非常复杂的慢SQL处理 怎么解决
   1. 应急方案 加索引 旧数据迁移
   2. 短期方案 优化sql
   3. 长期方案 沟通业务 了解业务 分析业务 能删的删 能拆的拆
   4. ....
2. 高并发扣库存怎么解决
3. 遇到问题百度无法解决
   1. google
   2. git issue
   3. 问其他人
   4. 总结 归纳 分享







