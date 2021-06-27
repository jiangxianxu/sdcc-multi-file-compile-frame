本工程是使用SDCC作为编译工具时进行多文件编译的编译框架，可用于多人共同合作开发不同模块的大型工程编译


1、工程目录和源码目录分开，其中codebase目录为源码目录，project目录为工程目录

2、codebase/include为整个工程的公共头文件目录

3、codebase/source为模块源码目录，将模块命名子目录用于放置对应的模块源码及模块头文件

4、由于受sdcc工具一次只能编译一个c文件的限制，所以每个模块只能由一个c文件组成

5、codebase/source/main为工程入口，这个目录必须有，需要注意


6、project/main为main函数模块编译工程，必须要有

7、project/app为最终将所有模块的rel文件编译成可执行文件的编译工程，必须要有

8、project/app中编译可执行文件的时候默认系统中有main模块，所以在编译多个rel文件时将main.rel放在第一个，因此生成可执行的文件为main.ihx

9、project/app最终会将main.ihx文件整合成xxx.bin文件，bin文件的命名由project/app/Makefile中的APP_NAME变量决定

10、其它模块的MODULE_NAME要与模块的c文件名要相同(MODULE_NAME名字与c文件去掉.c时相同)

11、新增模块需要在project目录中增加对应模块名的目录，并参照main等工程编写Makefile

12、新增模块后需要将新增的模块中间文件要参照原有模块加入project/app/Makefile中链接到可执行文件


13、在project目录中执行make命令可对整个工程所有源码进行编译，最终生成可执行文件

14、执行make clean命令可对整个工程进行clean，删除所有的中间文件及可执行文件

15、工程可支持模块编译，可用于多人开发不同模块的场景，也可用于模块间开发人员有源码权限限制的开发场景，模块间开发人员只需发布中间文件(rel)即可。

16、执行make xxx即可完成xxx模块的编译

17、执行make xxx_clean即可完成对模块xxx的clean

18、执行完模块编译后还需要执行make app命令完成将所有模块的中间文件编译链接成可执行文件的操作


19、project/build/lib目录用于存放所有模块的中间文件，可执行bin文件放置于project/build目录中

