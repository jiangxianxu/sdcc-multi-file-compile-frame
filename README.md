本工程是使用SDCC作为编译工具时进行多文件编译的编译框架，可用于多人共同合作开发不同模块的大型工程编译  
- 工程目录和源码目录分开，其中codebase目录为源码目录，project目录为工程目录
- codebase/include为整个工程的公共头文件目录
- codebase/source为模块源码目录，将模块命名子目录用于放置对应的模块源码及模块头文件
- 各模块或者APP都可以由多个文件组成，编译结果为模块生成一个库文件，APP编译自己的源文件后再链接模块的库文件而成
- 可以同时编译多个不同逻辑的可执行文件，不同的逻辑可以是不同的app文件完成，它可以调用其它的模块实现的功能
- 进入顶层目录后直接make即可完成编译
- 编译结果位于顶层目录的build目录中
- 添加模块或者APP可以仿造project目录中已有的app-timer和module-isr增加，当前app-timer会调用module-isr的功能完成自己的逻辑
- 当不希望对所有源码进行一次全编译时，可以在project目录中进行单个模块和单个app的编译或者clean，如执行make module_isr/make module_isr_clean/make app-timer/make app-timer_clean命令等
