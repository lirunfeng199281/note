# pom

#### scope impoet

1. 会继承父pom和父父pom的<dependencyManagement>
2. 会继承<properties>
3. 个人建议import的父pom不再有父pom（混乱）

#### springboot插件

```
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
```

1. 插件作用是打包的jar含有lib

