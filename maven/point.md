1. <modules>标签可以用..相对路径来引入文件夹外的子模块
2. 插件maven-release-plugin可以修改本pom和子模块的pom并且可以提交git 但是不支持多个git
3. spring-boot-maven-plugin要放在打成启动jar的pom 因为要选择Main Class 放在父pom是没有用的
4. springboot的父pom实际上包含了很多东西 各种Build和properties