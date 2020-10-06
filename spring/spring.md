1. @Autowired可以注解在构造函数上 属性上(常用)  setter方法上

   1. 注解在构造函数上

      ```
      @Service
      public class FooService {
          private final FooRepository repository;
          @Autowired
          public FooService(FooRepository repository) {
              this.repository = repository
          }
      }
      ```

   2. spring 4.3之后，引入了一个新特性：当构造方法的参数为单个构造参数时，可以不使用@Autowired进行注解

2. LambdaSafe.callbacks