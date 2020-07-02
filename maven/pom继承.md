# pom

#### scope impoet

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

   

2. 会继承父pom和父父pom的<dependencyManagement>

3. 会继承<properties>

4. 个人建议import的父pom不再有父pom（混乱）

#### springboot插件

```xml
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
```

1. 插件作用是打包的jar含有lib

