1. pipeline script有两种
   - 一种是Declarative结构化 简单但是灵活较低 没有if else 这种
   - 一种是Scripted Groovy脚本 拓展较好
2. 参数化构建插件[active choices]可以根据上一个参数的变化动态执行groovy脚本
3. pipeline gdsl是封装好的方法可以直接用 下面介绍部分常用的 
   - parallel多线程
   - build 构建job ex:build(job: 'DEV101-center-test1')
   - git co代码 git branch: branch, credentialsId: '', url: git_url
   - dir dir(path){} 代表在path目录下操作
4.  [一些例子](https://www.jenkins.io/doc/pipeline/examples/)

