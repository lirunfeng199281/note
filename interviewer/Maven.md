1. <parent>和<modules>两个标签的联系
   - 两者没有必然的联系 可以独立存在
   - <Parent>是抽象出元素 方便继承 避免重复声明
   - <modules>更多是操作上关联 例如构建上
2. <dependencyManagement>是否会真正引入
   - 不会真正引入 一般用作统一的版本控制
3. Liftcycle声明周期 package install deploy区别
   - package只会打成jar包 install会把jar包复制到本地仓库 deploy会同步到Nexus
4. snapshot和release在发布上有什么区别
5. <parent>只能继承一个 有没有别的方式可以继承多个 有的话两种继承有什么区别
   - <scope>import</scope>可以支持多继承 但是只能继承
   - 区别在于只能继承部分元素 例如<dependencyMannagement>可以但是<dependencies>不可以继承
6. 以前公共jar包有没有做版本管理
   - 假如有批量修改 可以用插件 插件可以支持提交scm
7. maven传递性依赖非常方便 但是会有版本不一致 怎么选择
   - 路径最短
   - 谁先声明
8. 假如让你为整个技术团队设计父pom 有什么想法 具体的设计
   - 版本统一控制
   - 分层标准
   - 多继承实现部分依赖引入 比如说DB