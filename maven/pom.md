# pom

#### scope import

1. ```xml
   		<dependencies>
      			<dependency>
      				<groupId>com.lee</groupId>
      				<artifactId>db</artifactId>
      				<version>1.0.0</version>
      				<type>pom</type>
      				<scope>import</scope>
      			</dependency>
      		</dependencies>
   ```

   

2. 个人建议import的pom不没父pom（混乱）

3. 本pom<dependencyManagement>有效

4. pom多继承的<dependencyManagement>有效

5. pom多继承回来的<dependencyManagement>pom中 引入的<dependencies>是无效的

6. pom多继承回来的<dependencyManagement>pom中 <distributionManagement>和<repositories>是无效的

7. pom被引用 此pom的父pom的<dependencyManagement>可用

8. pom被引用 此pom的子pom或者引用的pom的<dependencyManagement>不可用

#### springboot插件

```xml
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
```

1. 插件作用是打包的jar含有lib

#### <parent>和scope import区别

- parent
  - <dependencies> 中的 <dependency> 子pom无条件继承 子pom不需要再次声明
  - <dependencyManagement> 中的 <dependencies> 子pom使用需要 groupId和artifactId 
- scope
  - <dependencies> 中的 <dependency> 子pom不能继承
  - <dependencyMannagement>中的<dependencies> 和parent一样

#### <optional>和scope provided的理解

- optional=true不会发生依赖传递
- scope provided依赖需要外部提供
- 用法上 可选的用optional 必须用到的用provided 见名思意

#### <artifactId>spring-boot-starter-test</artifactId>

​	junit的引入要<scope>test</scope> 可以节省12MB