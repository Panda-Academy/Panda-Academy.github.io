---
title: 树莓派第三方操作系统
typora-root-url: ../..
---

树莓派除了官方 Raspberry Pi OS，还可以安装各种各样第三方操作系统（不同的 Linux Distro，[DistroWatch](https://distrowatch.com) 上可以查看各发行版的单日点击率），可选的 OS 详见 [Awesome Raspberry Pi OS Images](https://github.com/thibmaek/awesome-raspberry-pi#os-images)，这些第三方操作系统可以分为两大类：**通用型和专用型**，通用型是像 Windows/macOS 一样供用户日常使用的系统，专用型则有点像现代电视机里的系统（没错，现代电视机里是有操作系统的，大部分应该都是基于 Android 魔改的），它基于 Linux 但是裁剪了很多功能，只专注于某项特定的功能，譬如视频播放。



## 通用第三方操作系统

[Arch Linux ARM](https://archlinuxarm.org/)、[CentOS](https://wiki.centos.org/SpecialInterestGroup/AltArch/Arm32/RaspberryPi3)、[Fedora](https://fedoraproject.org/wiki/Raspberry_Pi#Preparing_the_SD_card)、[FreeBSD](https://wiki.freebsd.org/FreeBSD/arm/Raspberry Pi)、[Gentoo](https://wiki.gentoo.org/wiki/Raspberry_Pi) 等等，都是通用的第三方操作系统，其功能各有千秋，这里只介绍两款：[Ubuntu](https://ubuntu.com) 和 [Manjaro](https://manjaro.org)。



### 1. Ubuntu

桌面版下载地址：[Ubuntu Desktop](https://ubuntu.com/download/raspberry-pi)，安装方法不用再赘述了。

> [What’s new for Raspberry Pi with Ubuntu 22.04 LTS?](https://ubuntu.com/blog/whats-new-for-raspberry-pi-ubuntu-22-04-lts)
>
> ...
>
> Ubuntu 22.04 LTS is the first time Ubuntu Desktop has also been certified for the Raspberry Pi 4.
>
> ...
>
> Ubuntu Desktop is faster than ever on the Pi thanks to numerous optimisations to the GNOME Desktop environment (which is now running GNOME 42), delivering up to twice the frame rate when navigating your desktop compared to Ubuntu 21.10.
>
> ...

Ubuntu 22.04 LTS (Long Term Support) (codename: Jammy Jellyfish) 是树莓派的第一个长期支持版本，官方声称其桌面环境帧率是 21.10 版本的两倍，并且鉴于 Ubuntu 近些年来非常高的社区活跃度及用户使用率，很有必要尝试下树莓派上的 Ubuntu。有一点需要注意，GNOME 相对树莓派来说还是比较重的，启动就吃了 1GB 往上的内存，因此低于 2GB 内存的树莓派请不要尝试了。

下边是登陆后和打开文件系统、LibreOffice的截图，色彩和使用体验都很不错。

![ubuntu_desktop_1](/images/2022-05-04-raspberry_pi_3_party_os/ubuntu_desktop_1.jpg)

![ubuntu_desktop_2](/images/2022-05-04-raspberry_pi_3_party_os/ubuntu_desktop_2.jpg)



### 2. Manjaro

Linux 发行版的发行方式有**标准发行和滚动发行**的区分，很多常见的发行版都是标准发行，其在发行时会向大众说明当前发行的版本是多少，如果用户想要安装新版本来代替之前的旧版本，通常需要重新安装（当然也有的有在线升级的功能），相对应的滚动发行版就不存在重新安装的问题，用户可以方便的进行小而频繁的更新（通常只需要一条简单的更新命令），永远拥有最新版本的发行版，但随之而来的是系统有滚挂的风险，[Arch Linux](https://archlinux.org) 是典型的滚动式发行。

滚动发行让系统时常处在最新状态，这种模式吸引了大批用户，但是 Arch Linux 的高上手门槛又让很多人望而却步，这时 Manjaro 站了出来。Manjaro Linux（简称 Manjaro）是基于 Arch Linux 的 Linux 发行版，也采用滚动更新的方式，它的目标是让强大的 Arch Linux 更方便用户使用，同时也更加稳定（相对新手来说不容易滚挂）。

Manjaro 在树莓派上有几种不同的桌面环境：Gnome、KED Plasma、MATE、XFCE、Sway、其中：Gnome 和 KED Plasma 是比较重的桌面环境，启动后会占用较多的系统资源，使用时界面比较炫；MATE 和 XFCE 是轻量的桌面环境，占用系统资源少，使用时界面很丝滑；Sway 是轻量的**平铺式桌面**（Tiling Window），所谓平铺是指桌面上的窗口都是平铺的**不会产生堆叠**（浮窗除外），每新开一个窗口桌面就会被重新分割一次以让每个窗口都占有一定比例。下图是示例，左上、右上和下边是三个不同窗口，没有堆叠。

![manjaro_sway](/images/2022-05-04-raspberry_pi_3_party_os/manjaro_sway.png)

Manjaro Sway 的下载地址：[Raspberry Pi 4 Sway](https://manjaro.org/download/#raspberry-pi-4-sway)，对于只使用过一种操作系统的同学，Sway 是非常新颖的桌面管理方式，他山之石，值得一试。Mac 下也有类似的平铺式桌面工具：[yabai](https://github.com/koekeishiya/yabai)，感兴趣的同学也可以试试。

Sway 不单占用资源少可以高效的管理桌面空间，它还有另一个大杀器：keyboard controlled workflow（直译：键盘控制工作流？），用白话解释：用户可以使用键盘控制窗口（应用）的打开、关闭、移动，做到几乎不用鼠标。下边视频里的用户做了探索性的展示：

<iframe src="//player.bilibili.com/player.html?aid=596224178&bvid=BV1zB4y117Q2&cid=590361596&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>

我也做了个 gif：左边 **The Matrix** 所谓选择，都是虚幻；右上牛说唐诗宋词；右下监控系统状态。一顿操作猛如虎，定睛一看原地杵，虽然没什么生产力，但是又酷又秀，骚包到没朋友。

![sway_demo](/images/2022-05-04-raspberry_pi_3_party_os/sway_demo.gif)

树莓派安装好 Manjaro Sway，启动后的桌面是一个黑色调的壁纸带一个顶部状态栏，不熟悉的用户一开始是找不到文件管理器或者我的电脑这些东西的，而且 Sway 也没有这些东西。可以点击的地方是右上角一个 **?** 的标识，会弹出 Readme 文件，简短的说明应该怎么用键盘操作 Sway，部分内容如下。



#### 基础

默认的修饰键 (**$mod**) 一般是 (**Windows** / Pi / Pine) 键。

有两种模式的移动键：

- VIM 模式: **h** / **j** / **k** / **l**
- 方向键模式: **left** / **down** / **up** / **right**

Sway 有多达十个不同的工作区，可以在可用的显示器上自由排列。



#### 打开/关闭应用

- 打开新的终端: **$mod** + **Enter**
- 打开应用程序启动器: **$mod** + **Space**
- 终止应用程序: **$mod** + **Shift** + **q**



#### 使用工作区

- 切换工作区: **$mod** + **0**-**9** (工作区编号)
- 移动应用程序到另一个工作区 : **$mod** + **Shift** + **0**-**9** (工作区编号)



#### 更改窗口

- 为当前应用程序窗口切换全屏: **$mod** + **f**
- 垂直拆分当前应用程序窗口: **$mod** + **v**
- 水平拆分当前应用程序窗口: **$mod** + **b**



#### 浮窗

- 为当前应用程序窗口切换浮动模式: **$alt** + **Shift** + **Space**
- 在浮动应用程序窗口和平铺应用程序窗口之间切换: **$alt** + **Space**
- 移动浮动应用程序窗口: **$mod** + **Shift** + **\<movement-key\>** (见[基础](#基础))



#### 截屏

- 进入截屏: **$mod** + **Shift** + **s**
- 复制整个屏幕的截图: **f**
- 保存整个屏幕的截图: **Shift** + **f**
- 复制应用程序窗口的截图: **w**
- 保存应用程序窗口的截图: **Shift** + **w**
- 复制屏幕特定区域的截图: **r**
- 保存屏幕特定区域的截图: **Shift** + **r**
- 退出调整大小模式: **Enter** or **ESC**



#### 录屏

- 进入录屏: **$mod** + **Shift** + **r**
- 录制整个屏幕: **f**
- 录制整个屏幕及录音: **Shift** + **f**
- 录制屏幕的某个区域: **r**
- 录制屏幕的某个区域及录音: **Shift** + **r**
- 退出调整大小模式: **Enter** or **ESC**



#### 重启/退出

- 重载 Sway 配置: **$mod** + **Shift** + **c**
- 退出 Sway 会话: **$mod** + **Shift** + **e**



## 专用第三方操作系统

专用的第三方操作系统有很多有趣的东西可以玩，像影视、音乐、游戏甚至路由器，下面对这四类系统做简介。



### 1. 影视 - LibreELEC

[LibreELEC](https://libreelec.tv) -- Just enough OS for KODI

LibreELEC 的系统镜像非常小，只有 100 多 MB，一如其 slogan 它是专为 Kodi 打造的轻量级 "Just enough OS" Linux 发行版。

[Kodi](https://kodi.tv) 则是由 XBMC 基金会开发的开源媒体播放器，可以让用户播放本地或网络存储设备中的大多数视频、音乐、播客及各种常见数位媒体文件。

简单来说，LibreELEC = 裁剪版 Linux 系统 + Kodi 软件，安装到树莓派上可以当做媒体中心使用，具体安装步骤如下。

a. 启动时，语言选择 English，没有中文可选。

![libreelec_language](/images/2022-05-04-raspberry_pi_3_party_os/libreelec_language.jpg)

b. 设定 Hostname，没有特别要求保持默认即可。

![libreelec_hostname](/images/2022-05-04-raspberry_pi_3_party_os/libreelec_hostname.jpg)

c. 连接网络。

![libreelec_network](/images/2022-05-04-raspberry_pi_3_party_os/libreelec_network.jpg)

d. 打开 SSH，Samba 默认已打开。

![libreelec_ssh](/images/2022-05-04-raspberry_pi_3_party_os/libreelec_ssh.jpg)

e. 初始化完成进入主界面。

![libreelec_main](/images/2022-05-04-raspberry_pi_3_party_os/libreelec_main.jpg)

f. 设定中文，Interface 中 Skin -> Fonts 选择 Arial based，再去 Regional -> Language 选择中文。

![libreelec_interface](/images/2022-05-04-raspberry_pi_3_party_os/libreelec_interface.jpg)

![libreelec_font](/images/2022-05-04-raspberry_pi_3_party_os/libreelec_font.jpg)

![libreelec_arial_based](/images/2022-05-04-raspberry_pi_3_party_os/libreelec_arial_based.jpg)

![libreelec_chinese](/images/2022-05-04-raspberry_pi_3_party_os/libreelec_chinese.jpg)

g. 完成设定，系统信息。

![libreelec_system_info](/images/2022-05-04-raspberry_pi_3_party_os/libreelec_system_info.jpg)

看剧时，通过连接 **NAS** (Network Attached Storage 网络附接存储)、**外接硬盘**、**Samba** 存入等方式载入剧集。



### 2. 音乐 - Volumio

[Volumio](https://volumio.com/en/) -- STREAM ALL YOUR MUSIC IN THE BEST QUALITY

Volumio 本质上也是一个定制的 Linux 系统，默认没有图形界面（可以配置），播放和控制主要通过 WEB 界面实现，当前支持树莓派、PC (X86/X64) 和华硕的 [Tinker Board](https://www.asus.com.cn/Networking-IoT-Servers/AIoT-Industrial-Solutions/Tinker-Board-Series/Tinker-Board/)。Volumio 除了界面精美，它还有几项高级功能，用在树莓派上是小成本玩 Hi-Fi 的典范。

- 支持内置存储、外接硬盘、NAS 存储播放
- 支持 DLNA 以及 AirPlay 无线音乐传输
- 支持外接 DAC

Volumio 安装非常简单，烧好镜像启动即可，启动前不需要额外的配置，全部都可以在启动后配置，包括 Wi-Fi。

Volumio 第一次启动时，会开启一个以 Volumio 开头的热点，用手机或电脑连上热点，然后浏览器访问 **http://volumio.local** 开始初始化配置。

a. 选择语言

![volumio_language](/images/2022-05-04-raspberry_pi_3_party_os/volumio_language.jpg)

b. 播放器名称，如果更改，后续访问是要使用新的地址：http://名称.local

![volumio_hostname](/images/2022-05-04-raspberry_pi_3_party_os/volumio_hostname.jpg)

c. 输出设备：选择 DAC 或者 Headphones，其中 DAC 也有官方合作的产品，[IQaudio DAC+](https://www.raspberrypi.com/products/iqaudio-dac-plus/)、[IQaudio DAC Pro](https://www.raspberrypi.com/products/iqaudio-dac-pro/)、[IQaudio DigiAMP+](https://www.raspberrypi.com/products/iqaudio-digiamp-plus/)

![volumio_output_dac](/images/2022-05-04-raspberry_pi_3_party_os/volumio_output_dac.jpg)

![volumio_output_no_dac](/images/2022-05-04-raspberry_pi_3_party_os/volumio_output_no_dac.jpg)

d. 连接 Wi-Fi，Wi-Fi 连接好之后，下次 Volumio 启动会自动关闭热点。

![volumio_network](/images/2022-05-04-raspberry_pi_3_party_os/volumio_network.jpg)

e. 最后初始化完成。

![volumio_donate](/images/2022-05-04-raspberry_pi_3_party_os/volumio_donate.jpg)

初始化完成后，用浏览器访问：http://名称.local，默认：http://volumio.local，UI 非常漂亮，给我一种北欧神化的感觉。

**主界面**

![volumio_main](/images/2022-05-04-raspberry_pi_3_party_os/volumio_main.jpg)

**手机端主界面**

![volumio_main_phone](/images/2022-05-04-raspberry_pi_3_party_os/volumio_main_phone.jpg)

**播放界面**

![volumio_play](/images/2022-05-04-raspberry_pi_3_party_os/volumio_play.jpg)

**添加音乐界面**，添加音乐文件（连接 NAS、插入硬盘或者拷入）后点击重新扫描进行更新（注意：内置存储的音乐要放在 **/mnt/INTERNAL**，否则扫描不出来）

![volumio_scan](/images/2022-05-04-raspberry_pi_3_party_os/volumio_scan.jpg)

**手机 Airplay**

![volumio_airplay](/images/2022-05-04-raspberry_pi_3_party_os/volumio_airplay.jpg)



### 3. 游戏 - Lakka、RetroPie

[Lakka](http://www.lakka.tv) -- The open source game console

Lakka 是基于 LibreELEC 和 RetroArch 的轻量 Linux 系统，支持的模拟器列表：[Hardware support](http://www.lakka.tv/doc/Hardware-support/)，其界面像 PSP，可以流畅的模拟 GBA、FC（NES）游戏，也支持街机（Arcade）、PSP等模拟器。

![lakka](/images/2022-05-04-raspberry_pi_3_party_os/lakka.png)

Lakka 安装和使用比较简单，按照官方指导：**烧录 -> 启动 -> Samba 拷入 rom -> 开始游戏**。

[RetroPie](https://retropie.org.uk) -- 基于 Raspberry Pi OS 的复古游戏机，可以在现有 [Raspberry Pi OS 上安装](https://retropie.org.uk/docs/Manual-Installation/)，也可以直接用[官方镜像](https://retropie.org.uk/download/)安装。由于其系统仍然是 Raspberry Pi OS，所以情怀上来时，可以当游戏机玩，情怀退却之后还可以当微型 Server 用，最大化的利用树莓派。官方有段视频演示如何一步步安装。

<iframe src="//player.bilibili.com/player.html?aid=468866788&bvid=BV1L5411d7AB&cid=712329950&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>



### 4. 路由器 - OpenWrt

[OpenWrt](https://openwrt.org) 是适合嵌入式设备的 Linux 发行版，默认使用 LuCI 作为 WEB 交互界面，其支持的设备列表：[Table of Hardware](https://openwrt.org/toh/views/toh_fwdownload) 非常多。

刷 OpenWrt 的路由器相对原厂系统路由器，最大优势是能够**安装非常多的插件**，而刷了 OpenWrt 的树莓派则可以当做一款 CPU 和内存都比较强的路由器，不仅可以安装海量插件，在 docker 的帮助下可以开辟更多玩法。常见的插件有：广告屏蔽大师 Plus +、上网时间控制、网络唤醒等等。

推荐使用 [OpenWrt-Rpi](https://github.com/SuLingGG/OpenWrt-Rpi) 安装，它是利用 Github Action 的编译工程，每天编译一次，编译好的固件中预置了丰富插件，下载、安装参考文档：https://doc.openwrt.cc，内置功能如下：

![openwrt](/images/2022-05-04-raspberry_pi_3_party_os/openwrt.jpeg)

最后提点 OpenWrt 的历史，从这个故事可以看出商业上使用正确开源许可的重要性。

> Cisco/Linksys 在 2003 年发布了 WRT54G 这款无线路由器，有人发现它是基于 Linux 开发的，而 Linux 是**基于 GPL 许可证发布**的，按照该许可证 Cisco 应该把 WRT54G 的**源代码公开**。
>
> 2003 年 3 月， **Cisco 迫于公众压力公开了 WRT54G 的源代码**，此后在很多独立开发者的努力下，就出现了一系列基于 Cisco 源码的第三方路由器固件，OpenWrt 就是其中之一。独立开发者们将该系统移植到各种不同厂家的芯片组和设备类型上，更新内核模块添加软件包，使今日的 OpenWrt 日趋完善和强大。

