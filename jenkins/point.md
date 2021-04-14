1. pipeline script有两种
   - 一种是Declarative结构化 简单但是灵活较低 没有if else 这种
   - 一种是Scripted Groovy脚本 拓展较好
   
2. 参数化构建插件[active choices]可以根据上一个参数的变化动态执行groovy脚本

3. pipeline gdsl是封装好的方法可以直接用 下面介绍部分常用的 
   - parallel多线程
   - build 构建job ex:build(job: 'DEV101-center-test1')
   - git co代码 git branch: branch, credentialsId: '', url: git_url
   - dir dir(path){} 代表在path目录下操作
   
4. [一些例子](https://www.jenkins.io/doc/pipeline/examples/)

5. groovy不支持执行shell脚本 要设置系统参数才可以

   ```
   解决方法：
   打开Jenkins界面
   打开系统管理
   点击 脚本命令行 Script Console
   在命令行窗口输入 
   System.setProperty("hudson.model.DirectoryBrowserSupport.CSP","sandbox allow-scripts; default-src 'none'; img-src 'self' data: ; style-src 'self' 'unsafe-inline' data: ; script-src 'self' 'unsafe-inline' 'unsafe-eval' ;")
   ， 然后点击执行
   ```

   