---
title: 树莓派介绍
typora-root-url: ../..
---

**[树莓派](https://www.raspberrypi.com)**（**Raspberry Pi**）是英国树莓派基金会开发的**微型单板计算机**，目的是以低价**硬件**及**自由软件**促进学校的基本计算机科学教育。

![Raspberry Pi 4](/images/2022-04-22-raspberry_pi_introduce/raspberry_pi_4.png)



在开始树莓派的介绍前，先简单解释两个名词：

- **单板计算机**、**单板机**、**单板电脑**（SBC, Single Board Computer）：是电脑的一种形式，它将**计算机的各个部分都组装在一块电路板上**，包括微处理器、存储器、输入输出接口等。简单的类比就是：单板计算机相当于不带显示器和键鼠的台式机主机，给它加上显示器、键鼠并安装好操作系统，就可以当电脑使用了，甚至不用显示器、键鼠，仅仅安装好操作系统也可以当微型服务器使用。

- **自由软件**（Free Software）：是一类可以**不受限制地自由使用、复制、研究、修改和分发的，尊重用户自由**的软件。自由软件不等同于免费软件，同时它本身也并不抵制商业化。自由软件受到选定的”自由软件许可协议协议“保护而发布，其发布以源代码为主。举几个自由软件的例子：GNU/Linux、git、OpenCV、Python等等。常见的[自由软件许可证](https://opensource.org/licenses/alphabetical)有：
  - [2-clause BSD License (BSD-2-Clause)](https://opensource.org/licenses/BSD-2-Clause)
  - [3-clause BSD License (BSD-3-Clause)](https://opensource.org/licenses/BSD-3-Clause)
  - [Apache License 2.0 (Apache-2.0)](https://opensource.org/licenses/Apache-2.0)

  - [GNU General Public License version 2 (GPL-2.0)](https://opensource.org/licenses/GPL-2.0)
  - [GNU General Public License version 3 (GPL-3.0)](https://opensource.org/licenses/GPL-3.0)
  - [GNU Lesser General Public License version 2.1 (LGPL-2.1)](https://opensource.org/licenses/LGPL-2.1)
  - [GNU Lesser General Public License version 3 (LGPL-3.0)](https://opensource.org/licenses/LGPL-3.0)
  - [MIT License (MIT)](https://opensource.org/licenses/MIT)



通俗点来说，树莓派是一块电路板，上面焊接好了微处理器（博通 Broadcom）、内存、输入输出接口（USB、Ethernet、HDMI等），在操作系统和自由软件的加持下以微型电脑的形式供人们学习和使用。



## 型号及规格

树莓派官网上列有很多不同的[型号](https://www.raspberrypi.com/products/)，其中 [Raspberry Pi 4](https://www.raspberrypi.com/products/raspberry-pi-4-model-b)、[Raspberry Pi 400](https://www.raspberrypi.com/products/)、[Raspberry Pi Pico](https://www.raspberrypi.com/products/raspberry-pi-pico/)、[Raspberry Pi Zero 2 W](https://www.raspberrypi.com/products/raspberry-pi-zero-2-w/) 是最新的四款，分别发布于2019年6月、2020年11月、2021年1月、2021年10月。

不同型号的使用场景不同：

- Pi 4：通用型，可以用来当日常桌面系统、服务器、媒体中心等使用。

- Pi 400：Pi 4 的变种，把 Pi 4 集成到了一个键盘里以方便人们日常使用，下边图里那个小白键盘就是 Pi 400，连接电源、显示器和鼠标就可以用了。

  ![Raspberry Pi 400](/images/2022-04-22-raspberry_pi_introduce/raspberry_pi_400.jpg)

- Pi Pico：搭载了树莓派基金会自研 32 位 ARM 芯片 [RP2040](https://www.raspberrypi.com/products/rp2040/) 的小板（51 mm x 21 mm），带 264KB 片上 RAM 和 2MB 板载 Flash，其价格低廉只需要 $4 ，主要用于嵌入式开发。

  ![Raspberry Pi Pico](/images/2022-04-22-raspberry_pi_introduce/raspberry_pi_pico.jpg)

- Pi Zero 2 W：板载 RP3A0（4 核 64 位 ARM Cortex- A53 1GHz），价格 $15，比 Pico 性能强，比 Pi 4 尺寸小（65mm × 30mm），还带 2.4G 无线、蓝牙 4.2、H.264 编解码器，是开发物联网应用的不二之选。

  ![Raspberry Pi Zero 2 W](/images/2022-04-22-raspberry_pi_introduce/raspberry_pi_zero_2_w.jpg)



### Raspberry Pi 4 规格

| **配置**     | **树莓派 4B**                                                |
| :----------- | :----------------------------------------------------------- |
| **处理器**   | Broadcom BCM2711（1.5G 4核 64 位 Cortex A-72 ARM v8）        |
| **内存**     | 1GB、2GB、4GB、8GB 可选  LPDDR4-3200                         |
| **网络**     | 2.4G/5G 802.11 ac 无线、千兆以太网、蓝牙 5.0、低功耗蓝牙（BLE） |
| **接口**     | 2 x USB 3.0、2 x USB 2.0；Micro-SD 卡槽；40 x GPIO；DSI、CSI； |
| **音视频**   | 2 x Micro-HDMI（最高支持 4kp60 + 1080p 或 2 x 4kp30）；3.5mm |
| **编解码器** | H.265（4kp60 解码）、H.264（1080p60 解码，1080p30 编码）     |
| **供电端口** | USB Type-C（5V x 3A）                                        |
| **尺寸**     | 85mm x 56mm                                                  |



### Raspberry Pi Zero 2 W 规格

| **配置**     | **树莓派 Zero 2 W**                                         |
| :----------- | :---------------------------------------------------------- |
| **处理器**   | Broadcom BCM2710A1（1G 4核 64 位 Cortex-A53）               |
| **内存**     | 512MB LPDDR2                                                |
| **网络**     | 2.4GHz 802.11 b/g/n 无线、蓝牙 4.2、低功耗蓝牙（BLE）       |
| **接口**     | Micro USB On-The-Go (OTG) ；Micro-SD 卡槽；40 x GPIO；CSI； |
| **音视频**   | Mini-HDMI                                                   |
| **编解码器** | H.264（MPEG-4 1080p30 解码）、H.264（1080p30 编码）         |
| **供电端口** | Micro USB（5V x 2.5A）                                      |
| **尺寸**     | 65mm x 30mm                                                 |



## 安装和使用

以树莓派 4B 为例，其不带存储设备和外设，因此全新的树莓派买回来后不能直接使用，还需要以下硬件和步骤：

- Mirco-SD 卡，用于安装操作系统
- 键盘、鼠标、显示器（或者电视）



### 操作系统

个人电脑上的操作系统，宽泛的来说可以分为三大阵营：Mac OS、Windows、Linux。

- Mac OS 是苹果公司开发的，专用在 iMac、MacBook 等产品上的操作系统。
- Windows 是微软开发的，用在 PC 上的操作系统，包含从 Windows 95 到 Windows 11 等一系列版本。
- Linux 相对于前两种操作系统来说它并不属于某个公司或个人，而是一种自由和开放源码的类 UNIX 操作系统。其**内核**由林纳斯·托瓦兹在 1991 年 10 月 5 日首次发布，在**加上用户空间的应用程序**之后，成为 Linux 操作系统。**Linux 发行版（Distributions）**就是通常所说的“Linux操作系统”，它一般是由一些组织、团体、公司或者个人制作并发行的，像树莓派有针对不同使用场景的型号一样，Linux 发行版也有侧重不同使用目的的版本，较为知名的有 [Debian](https://zh.wikipedia.org/wiki/Debian)、[Ubuntu](https://zh.wikipedia.org/wiki/Ubuntu)、[Fedora](https://zh.wikipedia.org/wiki/Fedora_(作業系統))、[CentOS](https://zh.wikipedia.org/wiki/CentOS)、[Arch Linux](https://zh.wikipedia.org/wiki/Arch_Linux) 和 [openSUSE](https://zh.wikipedia.org/wiki/OpenSUSE) 等。

树莓派官方操作系统 **[Raspberry Pi OS](https://www.raspberrypi.com/software/operating-systems/)**（原为 Raspbian）就是 Linux 的一个发行版，基于 Debian 开发。从 2015 年起，树莓派基金会正式将其作为树莓派的官方操作系统。



### 系统安装

系统安装本质是把系统文件拷贝到 SD 卡中，使树莓派可以从 SD 卡中读取引导、加载内核，进而启动。以下是安装步骤。



#### 1. 下载系统

官网提供了不同版本系统的下载选项：[Raspberry Pi OS](https://www.raspberrypi.com/software/operating-systems/)。32 位版本有：非桌面版、桌面版、桌面加推荐软件版；64 位版本当前只有：非桌面版、桌面版。

如果由于国内防火墙的原因，从官网下载速度较慢或者无法访问，可以从高校镜像站下载，譬如清华镜像站：

- 32 位：[非桌面版](https://mirrors.tuna.tsinghua.edu.cn/raspberry-pi-os-images/raspios_lite_armhf/images/)、[桌面版](https://mirrors.tuna.tsinghua.edu.cn/raspberry-pi-os-images/raspios_armhf/images/)、[推荐软件版](https://mirrors.tuna.tsinghua.edu.cn/raspberry-pi-os-images/raspios_full_armhf/images/)
- 64 位：[非桌面版](https://mirrors.tuna.tsinghua.edu.cn/raspberry-pi-os-images/raspios_lite_arm64/images/)、[桌面版](https://mirrors.tuna.tsinghua.edu.cn/raspberry-pi-os-images/raspios_arm64/images/)

对于第一次使用的用户，推荐安装**桌面加推荐软件版**。



#### 2. 烧录 SD 卡

下载好的系统文件是 xz 文件，它是一种使用 LZMA/LZMA2 压缩算法的无损数据压缩文件格式。[Raspberry Pi Imager](https://www.raspberrypi.com/software/)、[Etcher](https://www.balena.io/etcher/)、命令行工具 [dd](https://www.runoob.com/linux/linux-comm-dd.html) 都可以把 xz 文件写到 SD 卡中。



##### 2.1 Raspberry Pi Imager

**CHOOSE OS** 选择下载的系统文件，**CHOOSE STORAGE** 选择 SD 卡，最后点击 **WRITE** 等待完成即可。

![Raspberry Pi Imager](/images/2022-04-22-raspberry_pi_introduce/raspberry_pi_imager.png)



##### 2.2 Etcher

**Select image** 选择下载的系统文件，**Select drive** 选择 SD 卡，最后点击 **Flash** 等待完成即可。

![Etcher](/images/2022-04-22-raspberry_pi_introduce/etcher.gif)



##### 2.3 dd

对于有洁癖不想安装新软件，或者没有桌面环境的用户，dd 命令行工具是个好选择，但只能在 Mac OS 或者 Linux 下使用。Mac OS 的 Terminal 中输入以下命令：

```shell
# 0. 解压 xz
$ gunzip xxx.img.xz
# 1. 查看 SD 卡，/dev/disk2 就是 SD 卡
$ diskutil list
...
/dev/disk2 (external, physical):
    #:                       TYPE NAME                    SIZE       IDENTIFIER
    0:                       FDisk_partition_scheme       *15.9 GB    disk2
    1:                       Windows_FAT_32 boot          268.4 MB   disk2s1
    2:                       Linux                        15.7 GB    disk2s2
# 2. 卸载 SD 卡，把 diskN 换成相应的硬盘编号（disk2）
$ diskutil unmountDisk /dev/diskN
# 3. dd 到 SD 卡，把 diskN 换成相应的硬盘编号（disk2）
##（一定注意不要看错，否则 dd 会覆盖 Mac OS 的硬盘）
##（注意使用 rdisk，'raw disk' 而不是 disk，可以加速写入）
$ sudo dd if=xxx.img of=/dev/rdiskN bs=4M conv=fsync
# 4. 推出 SD 卡
$ diskutil eject /dev/diskN
```



#### 3. 启动系统



##### 3.1 连接硬件

- 烧录好的 SD 卡插入卡槽

- 接入键盘、鼠标

- 接入显示器，注意树莓派 4B 是 Micro-HDMI，不是 Mini-HDMI，这两种接口尺寸不一样，不要买错了。

  ![HDMI Mini Micro](/images/2022-04-22-raspberry_pi_introduce/hdmi_mini_micro.jpg)

- 接入电源启动



##### 3.2 初始化系统

旧版系统带有一个默认的 “pi” 用户，但 2022 年 4 月 4 日及之后发布的系统里这个默认用户被删掉了，因此初始化系统的第一步是按照安装向导创建新用户。

[Configuration on First Boot](https://www.raspberrypi.com/documentation/computers/getting-started.html#configuration-on-first-boot) 里有详细的图示说明，如果打不开，请看下边的复本。

![启动界面](/images/2022-04-22-raspberry_pi_introduce/first_boot_1.png)

![设定国家、语言和时区](/images/2022-04-22-raspberry_pi_introduce/first_boot_2.png)

![创建新用户](/images/2022-04-22-raspberry_pi_introduce/first_boot_3.png)

![调整屏幕黑边](/images/2022-04-22-raspberry_pi_introduce/first_boot_4.png)

![设定 Wi- Fi](/images/2022-04-22-raspberry_pi_introduce/first_boot_5.png)

建议更新软件时选择跳过（skip）。默认源在国外，因为防火墙的原因更新会比较慢，可以等系统初始化完成并换成国内源后再更新。

![更新软件](/images/2022-04-22-raspberry_pi_introduce/first_boot_6.png)

![初始化完成](/images/2022-04-22-raspberry_pi_introduce/first_boot_7.png)



### 初次使用

初始化的时候跳过了软件更新，在正式使用前把它补回来。



#### 1. 换源

先解释下**源**这个概念：源全称“软件源”，是 Linux 系统的**应用程序安装仓库**，很多应用软件都会这收录到这个仓库里。类比的话可以用 Mac OS 的 AppStore 理解，用户想要安装软件，就去仓库（AppStore）里找。

再说明下为什么要**换源**：因为大部分 Linux 官方源（仓库）都在国外，安装速度慢且失败率高，所以要把源（仓库）从国外的官方源换成国内的镜像源。人生苦短，请换源。

参考清华镜像站的说明：[Raspbian 镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/raspbian/)。

- 首先在终端中输入 `uname -m` 确定系统架构：aarch64（请以自己的架构信息为准）。

- 再在镜像站上选择 Raspbian 对应的 Debian 版本：bullseye（请以自己的系统版本为准）。

- 最后替换 `/etc/apt/sources.list` 和 `/etc/apt/sources.list.d/raspi.list` 两个文件内容。

  ```
  # aarch64 /etc/apt/sources.list
  deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
  deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
  deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
  deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free
  ```

  ```
  # /etc/apt/sources.list.d/raspi.list
  deb http://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ bullseye main
  ```



#### 2. 更新

```shell
# 更新包信息
$ sudo apt update
# 升级软件及其依赖
$ sudo apt full-upgrade
```

安装/卸载软件

```shell
# 安装
$ sudo apt install xxx
# 卸载，保留配置文件
$ sudo apt remove xxx
# 卸载，移除配置文件
$ sudo apt purge xxx
```

安装中文输入法：`sudo apt install fcitx5 fcitx5-chinese-addons`



#### 3. 应用

![Firefox](/images/2022-04-22-raspberry_pi_introduce/raspberry_pi_os_firefox.jpg)

![LibreOffice Writer](/images/2022-04-22-raspberry_pi_introduce/raspberry_pi_os_libreoffice_writer.jpg)

![LibreOffice Calc](/images/2022-04-22-raspberry_pi_introduce/raspberry_pi_os_calc.jpg)

![PDF Viewer](/images/2022-04-22-raspberry_pi_introduce/raspberry_pi_os_pdf_viewer.jpg)
