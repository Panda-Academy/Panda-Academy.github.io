---
title: 树莓派编程语言环境搭建
typora-root-url: ../..
---

作为微型单板计算机，树莓派可以做很多事情，我们也可以用它来学习很多东西：

- 编程语言学习
- Linux 系统学习
- Linux 软件学习
- 各种服务搭建
- 硬件学习

如果你已经有了一台计算机（台式机或者笔记本），那上边列出的内容，除了硬件学习需要一台类似树莓派的单板机外，其余的并不需要树莓派，完全可以在自己的计算机上安装虚拟机来搭建出一全新的系统，虚拟机内的系统跟本机环境隔离，不用担心自己原本的系统被搞乱。免费的虚拟机软件有：[VirtualBox](https://www.virtualbox.org)、[VMware Fusion Player](https://customerconnect.vmware.com/web/vmware/evalcenter?p=fusion-player-personal)，VirtualBox 是使用 GPL 许可的开源软件，完全免费；VMware 只要注册就提供免费个人使用许可。当然，如果你是用来培养小朋友的计算机兴趣，但又不希望小家伙弄乱你的电脑，可以考虑用树莓派这类的单板机，但是随着全球芯片供应的短缺（2020 年开始，2022 年依旧），树莓派价格水涨船高，溢价太多不推荐入手。



## 编程语言

提到编程语言，大家最先想到的可能是近些年人工智能领域大热的 [Python](https://www.python.org)、互联网行业经久不衰的 [Java](https://www.java.com/en/)、系统层/嵌入式开发的 C 语言或者各大语言排行榜：[TIOBE](https://www.tiobe.com/tiobe-index/)。

程序员有时喜欢讨论和对比不同的编程语言，但在人类社会第一台通用计算机 ENIAC 问世时，并没有编程语言供人们使用，那时的“程序员”还是体力劳动者，需要根据不同的计算场景给计算机接线（类似电影《模仿游戏》中图灵破解德国 Enigma 机的接线），后来人们改进了输入方式，把接线改成了由打孔的纸带输入，接线和纸带都可以理解为计算机直接运行的机器语言（0 和 1），再后来人们发明了汇编语言，用助记符代替机器语言中的操作码，用地址符号或标号代替指令或操作数地址，这样人们不再需要用 0/1 和计算机直接沟通了。到了 20 世纪 70 年代，C 语言的诞生为操作系统及其应用程序的开发奠定了基础，人们能够使用更偏向人类的语言进行编程，程序员这个工种也慢慢的从体力劳动者转向了脑力劳动者。来到 20 世纪 90 年代，更多更人类化的语言被创造出来，譬如 Python、Ruby、Java、JavaScript 等等，大大降低了编程难度，不过很遗憾的是中国迄今也没有国产的编程语言，得益于软件领域自由和开源的风潮，这并不是一个大问题，但它多少能从侧面反映国内软件行业的问题，太多的同学投入到了消费、娱乐等领域的开发导致内卷，而基础的操作系统领域却缺乏人才。

编程语言按照其是否需要被编译，可以分为三类：

- 编译型

  程序在编写完成后执行前，需要经过编译等步骤**生成机器可以直接执行的程序**的语言被称为编译型语言，典型的编译型语言有：C、Go，其从代码到执行的过程如下：

  **代码** ----> 编译器/链接器等工具链 ----> **可执行程序** ----> 机器执行

- 解释型

  程序在编写完成后可以**由解释器直接执行**的语言被称为解释型语言，典型的有：Python、Ruby，其从代码到执行的过程如下：

  **代码** ----> 解释器 ----> **机器码** ----> 机器执行

- 半编译型（或者半解释型）

  程序在编写完成后执行前，需要**先经过编译等步骤生成中间产物**（譬如字节码），**再由解释器执行**（譬如 JVM）的语言被称为半编译型语言，典型的有：Java、Groovy，其从代码到执行的过程如下：

  **代码** ----> 编译器 ----> **字节码** ----> 解释器 ----> **机器码** ----> 机器执行

通常来说，**编译型语言的执行效率高于解释型**，因为编译型语言的可执行程序已提前编译好，机器直接读到内存里就可以运行，而解释型语言的解释器则是通过“同声传译”的方式将代码转译给机器的；相对的，**解释型语言的跨平台特性要好于编译型**，相同的代码只需要在不同的平台（Linux、macOS、Window）安装对应的解释器就能执行，而编译型语言需要编译不同的平台版本才能实现跨平台，甚至有时还需要微调代码才能兼容各平台。



## 开发环境

以 Go、Python、Java 这三个具有代表性的编程语言说明下如何搭建开发环境，都是两步：安装语言本身 + 安装 IDE 或者编辑器。

macOS 和 Windows 不用赘述，无论编程语言还是 IDE，到官网下载安装包再一路按安装指导点鼠标就行了（macOS 使用 [Homebrew](https://brew.sh) 安装会更方便）。

官网及 IDE：

[Go](https://go.dev) -- [GoLand](https://www.jetbrains.com/go/) 目前没有免费版，但学生、教师、开源项目的开发人员可以免费使用。

[Python](https://www.python.org) -- [PyCharm](https://www.jetbrains.com/pycharm/) 社区版免费

[Java](https://www.java.com/en/) --[IntelliJ IDEA](https://www.jetbrains.com/idea/) 社区版免费

此外，还有微软出品的通用编辑器 [Visual Studio Code](https://code.visualstudio.com) 对很多编程语言都适用，有非常多的插件。

下边用安装 Manjaro 系统的树莓派 4B 示例 Linux 上如何搭建开发环境，不同的发行版除了包管理器不同，其它路数都一样。



### 1. Go

**安装语言**

```shell
$ sudo pacman -S go
# 检查是否安装成功
$ go version
go version go1.18.1 linux/arm64
```

**更新源**

```shell
$ go env -w GO111MODULE=on
# 七牛
$ go env -w GOPROXY=https://goproxy.cn,direct
```

**编辑器**：树莓派上安装不了专用的 IDE，只能选择 Visual Studio Code 或者 Vim 这类通用编辑器。

```shell
# Visual Studio Code
$ sudo pacman -S code
# Vim
$ sudo pacman -S vim
```

**编辑器插件**：主要有语法高亮、错误检查、自动提示等，帮助开发人员快速书写代码。

Visual Studio Code：[go](https://marketplace.visualstudio.com/search?term=go&target=VSCode&category=Programming%20Languages&sortBy=Relevance)

Vim 要先安装插件管理器，再安装插件，需要能访问 Github。

```shell
# 安装插件管理器 Vundle，也可以选择其它的
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# 新建 ~/.vimrc 文件，添加以下插件配置内容
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on

# 安装插件
$ vim +PluginInstall +qall
```



### 2. Python

**安装语言**

```shell
# 安装 python
$ sudo pacman -S python
# 安装库管理器
$ sudo pacman -S python-pip

# 检查是否安装成功
$ python --version
Python 3.10.4
$ pip --version
pip 21.0 from /usr/lib/python3.10/site-packages/pip (python 3.10)
```

**更新源**

```shell
$ pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
Writing to /home/panda/.config/pip/pip.conf
```

**编辑器**：Visual Studio Code 或者 Vim，具体安装参见 Go 部分的说明。

**编辑器插件**：Visual Studio Code --[python](https://marketplace.visualstudio.com/search?term=python&target=VSCode&category=Programming%20Languages&sortBy=Relevance)；Vim -- `Plugin 'davidhalter/jedi-vim'`，具体安装参见 Go 部分的说明。



### 3. Java

**安装 JDK**

```shell
# jdk17 是 LTS （Long Term Supported，长期支持版本）
$ sudo pacman -S jdk17-openjdk
# 检查是否安装成功
$ java --version
openjdk 17.0.3 2022-04-19
OpenJDK Runtime Environment (build 17.0.3+7)
OpenJDK 64-Bit Server VM (build 17.0.3+7, mixed mode)
```

**更新源**：jdk 或者 jre 没有源的概念，不需要更新，但如果开发用到了 maven/gradle（一般都会用到），还是需要更新它们的源。

**编辑器**：Visual Studio Code 或者 Vim（不推荐），具体安装参见 Go 部分的说明。

**编辑器插件**：Visual Studio Code -- [java](https://marketplace.visualstudio.com/search?term=java&target=VSCode&category=Programming%20Languages&sortBy=Relevance)，具体安装参见 Go 部分的说明。



## Hello World

环境搭建好之后的第一步就是跑个 Hello World 了，下边三种语言分别各出一个命令行版（cmd）和一个网页版（web）。



### 1. Go

```shell
# 创建文件夹
$ mkdir go && cd go
```



#### 命令行版

新建 **hello.go** 文件，输入以下内容。

```go
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
```

```shell
# 直接运行
$ go run hello.go
Hello, World!

# 或者编译后运行
$ go build hello.go && ./hello
Hello, World!
```



#### 网页版

新建 **hello_server.go** 文件，输入以下内容。

```go
package main

import (
    "fmt"
    "net/http"
)

func main() {
    http.HandleFunc("/", HelloServer)
    http.ListenAndServe(":8080", nil)
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello, %s!", r.URL.Path[1:])
}
```

```shell
# 直接运行，再在浏览器中访问：http://127.0.0.1:8080/World
$ go run hello_server.go

# 或者编译后运行，再在浏览器中访问：http://127.0.0.1:8080/World
$ go build hello_server.go && ./hello_server
```

![hello_world](/images/2022-05-27-raspberry_pi_code_env/hello_world.jpg)



### 2. Pyhon

```shell
# 创建文件夹
$ mkdir python && cd python
```



#### 命令行版

新建 **hello.py** 文件，输入以下内容。

```python
print("Hello, World!")
```

```shell
# 运行
$ python hello.py
Hello, World!
```



#### 网页版

新建 **hello_server.py** 文件，输入以下内容。

```python
import http.server
import socketserver
from http import HTTPStatus


class Handler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(HTTPStatus.OK)
        self.end_headers()
        self.wfile.write(b'Hello, World!')


httpd = socketserver.TCPServer(('', 8080), Handler)
httpd.serve_forever()
```

```shell
# 运行，在浏览器中访问：http://127.0.0.1:8080
$ python hello_server.py
```



### 3. Java

```shell
# 创建文件夹
$ mkdir java && cd java
```



#### 命令行版

新建 **HelloWorld.py** 文件，输入以下内容。

```java
class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!"); 
    }
}
```

```shell
# 编译字节码
$ javac HelloWorld.java
# 运行
$ java HelloWorld
Hello, World!
```



#### 网页版

纯手写有一点麻烦，用在线的 [Spring Initializr](https://start.spring.io) 生成一个，Dependencies 添加 **Spring Web** 依赖后点击 **Genrate** 下载，下载文件为 **demo.zip**。

![spring_initialize](/images/2022-05-27-raspberry_pi_code_env/spring_initialize.jpg)

```shell
# 拷贝 demo.zip 到 java 目录
$ cp ~/Downloads/demo.zip ./
# 解压
$ unzip demo.zip && cd demo
```

更改文件夹中 **src/main/java/com/example/demo/DemoApplication.java** 为如下内容：

```java
package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @GetMapping("/")
    public String hello(@RequestParam(value = "name", defaultValue = "World") String name) {
        return String.format("Hello, %s!", name);
    }
}
```

运行也有点麻烦，需要提前安装 Maven 并更换为国内源：

```shell
# 安装 maven
$ sudo pacman -S maven
# 拷贝配置文件到用户目录
$ cp /opt/maven/conf/settings.xml ~/.m2/
```

在 **~/.m2/settings.xml** 文件 mirrors 部分添加以下内容：

```xml
<mirror>
    <id>aliyunmaven</id>
    <mirrorOf>*</mirrorOf>
    <name>阿里云公共仓库</name>
    <url>https://maven.aliyun.com/repository/public</url>
</mirror>
```

最后执行命令 `mvn spring-boot:run` 启动，第一次启动时 maven 会下载很多依赖，因此比较慢。启动日志如下，在浏览器中访问：http://127.0.0.1:8080 就可以收到 `Hello, World!` 了。

```

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::                (v2.6.7)

2022-05-19 20:56:50.286  INFO 51175 --- [           main] com.example.demo.DemoApplication         : xxx
2022-05-19 20:56:50.295  INFO 51175 --- [           main] com.example.demo.DemoApplication         : xxx
2022-05-19 20:56:52.859  INFO 51175 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : xxx
...
2022-05-19 20:56:54.069  INFO 51175 --- [           main] com.example.demo.DemoApplication         : Started DemoApplication

```



## BrainFuck

最后介绍一个很有意思的编程语言 BrainFuck。

BrainFuck 是一种极小化的计算机语言，由 Urban Müller 在 1993 年创建。该语言仅由**八个简单命令和一个指令指针**组成，但是它是**图灵完备**的。

这篇回答：[什么是图灵完备](https://www.zhihu.com/question/20115374/answer/288346717)，简单解释了图灵机、图灵完备的概念。概括点说的话，图灵完备的语言对计算机来说是等价的，也就是说从计算机的角度看 BrainFuck 能完成跟其它图灵完备编程语言（Go、Python、Java）一样的事情。

先看看它仅有的语法：

##### `+` : 递增当前指针指向单元格的值

##### `-` : 递减当前指针指向单元格的值

##### `>` : 右移指针

##### `<` : 左移指针

##### `.` : 输出当前指针所指向的单元格值(ASCII)

##### `,` : 输入一个值存储在当前指针所指向的单元格

##### `[` : 如果当前指针所指向的单元格值**为** 0，则跳转到与之对应的 `]`

##### `]` : 如果当前指针所指向的单元格值**不为** 0，则跳转到与之对应的 `[`

再看看它的 Hello World 代码，确实挺 "fuck" 的：

```
++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.
```

最后运行起来，在 macOS 下运行它：

```shell
# 安装用 C 语言写的解释器
$ brew install brainfuck
# 把 Hello World 的代码写到一个文件中，譬如 hello.bf
# 用解释器 brainfuck 运行
$ brainfuck hello.bf
Hello World!
```



最后的最后，如果你不是计算机行业从业人员，没有必要非常系统的学习一门编程语言，只需要了解如何快速搭建好环境，看一些快速入门的书籍就可以了，当需要用程序帮助你完成重复、计算、自动化等工作时，再充分利用好搜索引擎就行。

编程语言终归只是工具，学会使用工具不是目的，利用工具服务好我们的科研、工程、教育，为祖国的复兴事业添砖加瓦、为人类社会的文明贡献力量亦或是探寻宇宙和生命的意义才是目的。
