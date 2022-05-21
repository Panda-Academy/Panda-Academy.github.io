---
title: Linux 简介
typora-root-url: ../..
---

Linux 大家或多或少都听过，通常 Linux 可以理解为与 Windows、macOS 等价的另一种操作系统，但更细节点它还有很多概念：Linux 内核、Linux 发行版、GUN/Linux 等等，这篇文章对这些概念以及 Linux 的特点、历史做个简介。



## Linux 是什么

大家日常谈论的 Linux 其全称应该为 Linux 发行版（Distribution/Distro），譬如 Ubuntu、Debian、Red Hat、CentOS 等等。真正的 Linux 其实是指 Linux 内核，用下边的示意图来说明：Linux 内核包含**内核和系统调用**两层，对内（硬件）实现设备驱动、进程/内存/IO管理，对外提供系统调用接口；Linux 发行版则是在内核上又增加了**应用程序**。

![linux](/images/2022-06-03-linux_introduce/linux.png)

从个人用户使用角度上说，Linux 发行版对标 Windows、macOS，其有鲜明的特点和缺点：

- 免费的“正版”系统

  不像 Windows 需要激活密钥、macOS 需要购买昂贵的机器才能使用，使用 Linux 不需要支付任何费用，而且大多数 Linux 的软件也是免费的。由于 Linux 自由开源的特点，Linux 系统不存在所谓的盗版问题。

- 真正的多用户支持

  Linux 系统管理的软硬件资源可以“同时”被不同用户登录和使用，每个用户对自己的资源有特定的权限，互不影响。

- 良好的可移植性

  Linux 系统经常被应用在嵌入式设备上，像电视、机顶盒、手机、移动设备、路由器等。

- 专业软件支持不足

  虽然很多专业软件在 Linux 系统上都有对应开源的替代软件，譬如 Matlab 的替代 GNU Octave，但这无疑增加了用户的学习成本。

- 游戏支持不足

  不得不承认 Linux 上的大型游戏不如 Windows，但随着 2022 年 5 月 11 日 NVIDIA 宣布以 GPL/MIT 双重许可正式开源其 Linux GPU 内核模块，或许 Linux 上大型游戏的缺失能有所改善，但有没有游戏也不太重要。

  ![linus_nvidia](/images/2022-06-03-linux_introduce/linus_nvidia.jpg)



## Unix/Linux 历史

Linux 的诞生离不开 Unix 操作系统、GNU 计划，它的壮大则离不开 POSIX 标准和 Internet。



### 1. Unix

Unix 前身是贝尔实验室 Ken Thompson 用汇编语言写的 Unics，1971-1973 年 Unics 被 Dennis Ritchie 用 C 语言重写后便称为 Unix。



#### 1969 年之前：Multics 系统

早期的计算机大多用于军事领域或者学术研究，并不像现在的个人计算机这样普遍，并且由于操作系统的限制，当有多人想同时使用同一部主机时，就需要排队等待。为了解决多人同时使用的问题，1960 年代初 MIT 开发了划时代的兼容分时系统 CTSS（Compatible Time-Sharing System），让大型主机可以通过终端机（Terminal）联机的方式使用。 

CTSS 解决了多人同时使用的问题，但当时先进的主机最多也只能供 30 个终端机同时接入。为了进一步利用大型主机的资源，1965 年左右贝尔实验室、MIT 和 GE 共同发起了 Multics（Multiplexed Information and Computing System）计划，目的是让大型主机可以同时供 300 个以上的终端机接入。 但到 1969 年前后，由于计划进度落后、资金短缺，贝尔实验室判断 Multics 项目不可能取得成功，选择退出了该计划。



#### 1969 年：Unics 系统

贝尔实验室虽然退出了 Multics 计划，但参其中的工程师却从该计划中获得了一些灵感，Ken Thompson 就是其中一位。1969 年 8 月左右，Thompson 为了移植自己编写的太空旅游（Space Travel）游戏，用汇编语言写了一个内核、一些内核工具程序，以及一个小的文件系统。

Thompson 将 Multics 复杂的系统进行了简化，因此同实验室的同事称这个系统为 Unics，其文件系统有两个重要思想：

- 所有的程序或系统设备都是文件
- 不管建构编辑器还是附属文件，程序只有一个目的，就是要有效的完成目标。

这就是著名的 KISS（Keep It Simple, Stupid）原则。



#### 1973 年：Unix 内核

Thompson 写的 Unics 操作系统因为非常好用，在贝尔实验室内部广为流传，并且经过多次改版。但因其是用汇编语言写的，高度依赖硬件，加上当时的计算机架构都不太相同，所以每次要安装到不同的机器都要重新编写汇编语言，很不方便。

后来 Thompson 与 Dennis Ritchie 便合作想将 Unics 改用更高级的程序语言来编写，从而提高可移植性。 他们先选择了 BCPL（简称 B 语言），然后又尝试 PASCAL，发现编译出来的内核性能都不是很好，因为这些语言都不太贴近硬件操作。 于是，两人（主要是 Ritchie）决定自己开发一套新的语言：C 语言。 Ritchie 将 B 语言重新改写成 C 语言，再用 C 语言重新改写并编译 Unics 内核，发行出 Unix 的正式版本。



#### 1977 年：BSD 分支

Unix 用 C 语言重写后，可移植性非常好，只要获得其源码，再针对大型主机的特性加以修改就可以将 Unix 移植到另一部不同的主机上。1973 年以后，Unix 开始与学术界合作开发，最重要的就是与加州大学伯克利分校（Berkeley）的合作。 伯克利大学的 Bill Joy 在取得 Unix 内核源码后，修改成了适合自己机器的版本，并增加了很多工具软件与编译程序，最终将它命名为 Berkeley Software Distribution（BSD）。

BSD 是 Unix 很重要的一个分支，Bill Joy 也是 Sun 公司的创办者，Sun 公司即是以 BSD 发展的内核进行自己的商业 Unix 版本的开发，后来可以安装在 x86 硬件架构上的 FreeBSD 也是从 BSD 改版而来。



#### 1979 年：System V 第七版 Unix

早年的 Unix 只能安装在服务器或者大型工作站上。 直到 1979 年，AT&T 推出了 System V 第七版 Unix，这一版最重要的特色是可以支持 x86 架构的个人计算机，也就是说 System V 可以在个人计算机上面安装与运行了。不过 AT&T 出于商业考虑，想将 Unix 的版权收回去，AT&T 在 1979 年发行的第七版 Unix 中，特别提出了不可对学生提供源码的严格限制。

目前被称为纯种 Unix 的就是 System V 和 BSD 这两套系统。



### 2. Linux

由于 Unix 的商业化，Andrew Tannebaum 教授为了能给教学科研提供一个操作系统，开发了 Minix 操作系统以便不受 AT&T 许可协议的约束。Linus Torvalds 则在 Minx 之上进行了深入学习，开发出了 Linux 内核。



#### 1984 年：Minix 系统

AT&T 在第七版 Unix 中的版权声明严重影响了学校教 Unix 内核源码的教授，导致课程无法开展。 从 1984 年开始，Andrew Tanenbaum 教授为了教学目的，决定自己写一个和 Unix 兼容的 Unix Like 内核，为了避免版权纠纷，Tanenbaum 完全不看 Unix 内核源码，因其是一个 Mini 版的 Unix 系统，所以称为 Minix。直到 1986 年 Minix 编写完成。

Minix 必须通过磁盘磁带购买，但售价便宜，随磁盘还会附上 Minix 源码，这样用户可以学习 Minix 的内核程序设计概念。Minix 受到了用户的欢迎，很多用户强烈要求 Tanenbaum 教授对 Minix 持续改进，但是Tanenbaum 教授只把 Minix 定位在教育用途上面，所以无心对 Minix 持续开发。无奈之下，芬兰赫尔辛基大学的学生 Linus Torvalds 在对 Minix 进行研究学习后，开发了日后改变全世界的 Linux 内核。



#### 1984年：GNU 计划

在 Tanenbaum 教授开始编写 Minix 的同年，Richard Stallman 发起了 GNU 计划，旨在建立一个自由开放的Unix 操作系统（FreeUnix）。 GNU 计划领导了计算机产业轰轰烈烈的自由软件运动，实现了 Unix 下绝大部分的开源工具软件集合和函数库，为开源世界做出了卓越的贡献。但是 GNU 计划一直缺少一个真正自由的 Unix 内核，虽然 GNU 计划也有自己的内核项目 hurd，但由于开发人员对 hurd 要求过于严苛，导致其迟迟无法推出。 直到 1991 年 Linus Torvalds 编写的 Linux 内核出现才弥补了这一空白。



#### 1984 年：X Window System

除了 Minix 和 GNU 计划，用户对图形用户界面（Graphical User Interface, GUI）的需求， 促使 MIT 与其他第三方于 1984 年首次发布了 X Window System，为日后 Linux 图形界面的发展奠定了基础。4 年后的 1988 年，MIT 成立非营利性组织 XFree86（X Window System + Free + x86 的简写），XFree86 图形界面于 1994 年整合进Linux 内核 1.0 版。



#### 1991 年：Linux 内核

Linus Torvalds 于 1991 年在 BBS 上发布了一则消息，说以 bash、gcc 等 GNU 工具编写了一个内核，可以在 386 机器上运行。下边是他的原文：

```
Hello everybody out there using minix -

I'm doing a (free) operating system (just a hobby, won't be big and
professional like gnu) for 386(486) AT clones.  This has been brewing
since april, and is starting to get ready.  I'd like any feedback on
things people like/dislike in minix, as my OS resembles it somewhat
(same physical layout of the file-system (due to practical reasons)
among other things).

I've currently ported bash(1.08) and gcc(1.40), and things seem to work.
This implies that I'll get something practical within a few months, and
I'd like to know what features most people would want.  Any suggestions
are welcome, but I won't promise I'll implement them :-)
```

之后 Linus Torvalds 开始把一些 Unix 上的软件放在 Linux 上跑，但很多软件无法运行。这种情况下，一个办法是修改软件，让它们可以在 Linux 上跑；另一个则是修改 Linux，让 Linux 符合软件运行的规范。Linus Torvalds 希望 Linux 希望能够兼容 Unix，于是选择了参考 POSIX 标准去修改 Linux。

POSIX 是可携式操作系统接口（Portable Operating System Interface），其规范了内核与应用程序之间的接口，按 POSIX 标准设计的内核是可以直接运行按 POSIX 标准开发的软件的。Linux 的发展依据了 POSIX 标准，同时 Unix 上的软件也是遵循这个标准开发的，因比 Linux 很容易就与 Unix 共享软件了。

因为 Linux 放在网上供大家下载，越来越多的用户开始使用并参与改进，这又进一步促进了 Linux 的发展。下边是整个 Unix/Linux 的发展年表。

![unix_timeline](/images/2022-06-03-linux_introduce/unix_timeline.svg)



## Linux 学习

如果你因为科研、学习、工作或者纯粹出于兴趣的原因要学习 Linux，有一个很好的系列教程以及一本书可以做为入门首选：

- [鸟哥的 Linux 私房菜](https://linux.vbird.org/linux_basic/centos7/)
- [The Linux Command Line](https://www.linuxcommand.org/tlcl.php)

就像 Linux 是自由开源的一样，这些优秀的教程和书籍也是免费的。不喜欢看繁体字和英文的同学，可以看网友整理好的简体中文版：

- [鸟哥的Linux私房菜：基础学习篇 第四版](https://wizardforcel.gitbooks.io/vbird-linux-basic-4e/content/index.html)
- [快乐的 Linux 命令行](http://billie66.github.io/TLCL/)

至于 Linux 环境，最方便的是用虚拟机安装自己中意的发行版，搭建方便，即便学习过程中搞坏了也不用担心。