---
title: 树莓派官方操作系统
typora-root-url: ../..
---

**Raspberry Pi OS**（原为Raspbian）是基于 Debian 开发的操作系统。从 2015 年起，树莓派基金会正式将其作为树莓派的官方操作系统。



## 安装

Raspberry Pi OS 可以从[官方网站](https://www.raspberrypi.com/software/operating-systems/)或者[清华镜像站](https://mirrors.tuna.tsinghua.edu.cn/raspberry-pi-os-images/)下载。

常规的安装方式是使用 [Raspberry Pi Imager](https://www.raspberrypi.com/software/)、[Etcher](https://www.balena.io/etcher/) 或者 **dd 命令行工具**烧录到 SD 卡中，再接上鼠标、键盘、显示器，接通电源后看着屏幕进行初始化配置。

但有时手头除了一个笔记本电脑并没有额外的外设，那就需要用另一种方式进行安装：无界面安装 [(Setting up a Headless Raspberry Pi)](https://www.raspberrypi.com/documentation/computers/configuration.html#setting-up-a-headless-raspberry-pi)。具体步骤如下：



### 1. 烧录 SD 卡

依然使用 Imager、Etcher、dd 等工具把系统烧录到 SD 卡，完成后先不要推出，还需要写入配置文件。



### 2. 添加配置文件

在 SD 卡的 **boot** 分区创建两个文件：**ssh**、**userconf.txt**。

- ssh 文件是用来开启树莓派的 sshd 功能，开启后可以直接在笔记本电脑上通过 ssh 的方式访问树莓派。ssh 文件创建出来后不用任何其它操作，留空即可。

- userconf.txt 文件是用来创建用户的，新的树莓派官方系统已不再保留默认的 pi 用户，因此需要用户自己创建。userconf.txt 的内容很简单，一行 `username:password` 形式的文本即可，其中：username 是明文用户名；password 是使用命令 `echo 'yourpassword' | openssl passwd -6 -stdin` 生成的密文。如果没有相应的工具也可以使用我用 **pi** 生成的密文： **$6$b/XnJjYlAWe1OOME$OckGiin62vnCYnaZWn5zeXTQpFZWrCPUi4BWom2P8HKqy3nAwcAjWNEq3kgjwYa3JlWfTIapYTo1xJ69MGkvS1**。

  ```shell
  $ echo 'pi' | openssl passwd -6 -stdin
  $6$b/XnJjYlAWe1OOME$OckGiin62vnCYnaZWn5zeXTQpFZWrCPUi4BWom2P8HKqy3nAwcAjWNEq3kgjwYa3JlWfTIapYTo1xJ69MGkvS1
  ```

  最终 userconf.txt 的内容如下，相应的登陆时的**用户名/密码**就是：**panda/pi**。

  ```
  panda:$6$b/XnJjYlAWe1OOME$OckGiin62vnCYnaZWn5zeXTQpFZWrCPUi4BWom2P8HKqy3nAwcAjWNEq3kgjwYa3JlWfTIapYTo1xJ69MGkvS1
  ```

如果不想使用网线而是通过 Wi-Fi 给树莓派提供网络，还需要在 boot 分区创建另外一个文件 **wpa_supplicant.conf** 以提供 Wi-Fi 的 ssid 和密码。内容如下：

```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
country=CN
update_config=1

network={
    ssid="Wi-Fi 名"
    psk="Wi-Fi 密码"
}
```



### 3. 启动

推出 SD 卡然后插到树莓派卡槽里，接上网线和电源线，上电启动。



### 4. 远程连接

虽然树莓派就在你手里，但是因为没有显示器没法直接使用，只能通过 ssh 的方式连接使用，因此这步叫远程连接。

Windows 使用 [PuTTY](https://www.putty.org) 工具连接，Mac/Linux 直接在 Terminal 里输入命令：`ssh panda@raspberrypi.local` 连接，其中的 panda 请改成自己在userconf.txt 文件设定的用户名。

```shell
$ ssh panda@raspberrypi.local
The authenticity of host 'raspberrypi.local' 
...
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

输入 yes 后回车再输入密码，就进入到了树莓派系统。

![ssh_pi](/images/2022-04-30-raspberr_pi_os/ssh_pi.png)

简单解释下 ssh，在以后的文章中再详细说明：

> **Secure Shell**（安全外壳协议，简称 **SSH**）是一种加密的网络传输协议，可在不安全的网络中为网络服务提供安全的传输环境。SSH 通过在网络中建立安全隧道来**实现 SSH 客户端与服务器之间的连接**。SSH **最常见的用途是远程登录系统**，人们通常利用 SSH 来**传输命令行界面和远程执行命令**。



### 5. 开启 VNC

VNC 能够让笔记本访问树莓派的桌面，Raspberry Pi OS 已安装了 VNC Server 但默认关闭，需要手动打开。

> **VNC**（Virtual Network Computing），为一种使用 RFB 协议的屏幕画面分享及远程操作软件。
>
> 此软件借由网络，可发送键盘与鼠标的动作及即时的屏幕画面。

在命令行中输入 `sudo raspi-config` 打开配置，选择：Interface Options --> VNC --> Yes，开启 VNC。

![raspi_config](/images/2022-04-30-raspberr_pi_os/raspi_config.png)

![raspi_config_vnc](/images/2022-04-30-raspberr_pi_os/raspi_config_vnc.png)

![raspi_config_vnc_yes](/images/2022-04-30-raspberr_pi_os/raspi_config_vnc_yes.png)选择：Display Options --> VNC Resolution --> 选定分辨率 --> Select，对 VNC 的分辩率进行调整。

![raspi_config_display](/images/2022-04-30-raspberr_pi_os/raspi_config_display.png)

![raspi_config_display_vnc_resolution](/images/2022-04-30-raspberr_pi_os/raspi_config_display_vnc_resolution.png)

![raspi_config_display_vnc_resolution_yes](/images/2022-04-30-raspberr_pi_os/raspi_config_display_vnc_resolution_yes.png)

选择：Finish --> Yes，保存设定并重启。

![raspi_config_finish](/images/2022-04-30-raspberr_pi_os/raspi_config_finish.png)

![raspi_config_reboot](/images/2022-04-30-raspberr_pi_os/raspi_config_reboot.png)



### 6. VNC Viewer

树莓派上 VNC Server 配置好等待重启期间，笔记本电脑上需要安装 [VNC Viewer](https://www.realvnc.com/en/connect/download/viewer/)，直接下载安装即可。（VNC Viewer 手机端也可以安装，感兴趣的同学可以试试。）

打开 VNC Viewer，输入地址 `raspberrypi.local` ，再输入用户名/密码（panda/pi）连接。

![vnc_virewer](/images/2022-04-30-raspberr_pi_os/vnc_virewer.jpg)

连接成功的界面如下：

![vnc_success](/images/2022-04-30-raspberr_pi_os/vnc_success.jpg)



以上 6 步就完成了树莓派的无界面安装和 VNC 访问，方便手里只有一台笔记本电脑的同学操作。



## 使用

树莓派日常使用的场景：网页浏览、文档编辑、影音播放等，下边一一介绍。



### 1. 系统更新

换源和系统更新的方法不用过多说明，参考清华镜像站 [Raspbian 镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/raspbian/)和以下命令。

```shell
# 更新软件包列表
$ sudo apt update
# 更新所有软件及其依赖
$ sudo apt full-upgrade
# 安装软件
$ sudo apt install xxx
# 卸载软件
$ sudo apt remove xxx
# 卸载软件及其配置文件
$ sudo apt purge xxx
```

系统更新可以提高系统的安全性，手动更新的频率请参照神秀禅师的偈子：时时勤拂拭，勿使惹尘埃。



### 2. 中文输入法

```shell
# 安装
$ sudo apt install fcitx5 fcitx5-chinese-addons
```

**Preferences --> Fcitx5 Configuration --> 取消 Only Show Current Language --> 添加 Pinyin**，添加好之后，可以通过快捷键 **Crtl + 空格**切换。

![fcitx5_config](/images/2022-04-30-raspberr_pi_os/fcitx5_config.jpg)

![fcitx5_config_pinyin](/images/2022-04-30-raspberr_pi_os/fcitx5_config_pinyin.jpg)

如果想让系统界面也改成中文，在 **Preferences --> Raspberry Pi Configuration --> Localisaition --> Locale** 中进行设定，重启后生效。

![language_config](/images/2022-04-30-raspberr_pi_os/language_config.jpg)



### 3. 浏览器

系统默认安装了 Chromium 浏览器，外接显示器的情况下使用没有什么问题，但是通过 VNC 的方式使用时会非常卡顿，几乎无法使用。

这篇贴子给出了可能的原因和解决方法：[Slow VNC response in certain applications](https://forums.raspberrypi.com/viewtopic.php?t=327772)。

原因：

> Extensive research indicated problem may be due to VNC system with headless Bullseye &/or chromium hardware acceleration.

解决：

- 方法1

  插入 HDMI 接口或假的 HDMI 接口。这种方法不推荐，本来就是因为没有或者不想用额外的外设才 VNC 的。

  > Monitor use not a long term option for those of us who like or need to run RPi's headless, so I used an HDMI dummy plug of the type typically used by cryptocurrency miners to fool an OS that a GPU is actually connected to a monitor when in fact it is not.

- 方法2

  改 /boot/config.txt：

  ```
  # 把 hdmi_force_hotplug 的注释取消
  hdmi_force_hotplug=1
  
  # 把下边两行注释掉
  #dtoverlay=vc4-kms-v3d
  #max_framebuffers=2
  ```

  再按说明选择 **[hdmi_group](https://www.raspberrypi.com/documentation/computers/config_txt.html#hdmi_group)** 和 **[hdmi_mode](https://www.raspberrypi.com/documentation/computers/config_txt.html#hdmi_mode)**。

  ```
  # DMT
  hdmi_group=2
  # 1920x1080 60Hz
  hdmi_mode=82
  ```

- 方法3

  `sudo apt install firefox-esr` 索性换个浏览器吧。

  ![firefox](/images/2022-04-30-raspberr_pi_os/firefox.jpg)

外接显示器时，网页端看视频 720P 无压力，1080P 有丢帧不影响观看，VNC 下看视频都很卡顿。



### 4. 文档和影音

办公软件默认安装了 [LibreOffice](https://www.libreoffice.org)，它是由文档基金会开发的自由及开放源代码的办公室套件，支持读写 Microsoft Office 格式（.docx、.pptx、.xlsx 、.doc、.ppt、.xls），对不想购买 Office License 的轻度用户非常友好。

![libreoffice](/images/2022-04-30-raspberr_pi_os/libreoffice.jpg)

播放器默认安装了 [VLC media player](https://www.videolan.org)，它是一款免费、自由、开源的跨平台多媒体播放器及框架，可播放大多数多媒体文件，以及各类流媒体协议。

![vlc](/images/2022-04-30-raspberr_pi_os/vlc.jpg)



### 5. 摄像头

树莓派支持两种类型的摄像头：CSI 接口的专用摄像头、USB 接口的网络摄像头。

- 官方 CSI 摄像头有[常规](https://www.raspberrypi.com/products/camera-module-v2/)、[红外](https://www.raspberrypi.com/products/pi-noir-camera-v2/)、[高清](https://www.raspberrypi.com/products/raspberry-pi-high-quality-camera/)三种，价格 ¥200 往上；淘宝上也有非官方的同类产品，价格亲民 ¥20 上下。

  ![pi_camera_module_v2](/images/2022-04-30-raspberr_pi_os/pi_camera_module_v2.jpg)

- USB 摄像头是我们日常用的外接摄像头，像罗技的这些产品：[网络摄像头](https://www.logitech.com.cn/zh-cn/products/webcams.html)。

  ![logitech_c310](/images/2022-04-30-raspberr_pi_os/logitech_c310.jpg)

官方 CSI 摄像头比同等价位的 USB 摄像头的性能高不少，同时它的可配置性也高很多，相关软件有 [libcamera](https://github.com/kbingham/libcamera) 和 [Raspicam](https://github.com/Lillifee/raspiCam)，具体请参考文档：[Camera](https://www.raspberrypi.com/documentation/accessories/camera.html)。

|        | **Camera Module v2** | **Logitech C310** |
| ------ | -------------------- | ----------------- |
| 价格   | ¥200                 | ¥249              |
| 像素   | 800 万               | 120 万            |
| 分辨率 | 1080p30，720p60      | 720p30            |

USB 摄像头连接上可以用 `lsusb` 查看：

```shell
$ lsusb
...
Bus 001 Device 003: ID 046d:081b Logitech, Inc. Webcam C310
```

然后用 `fswebcam`、`ffmpeg` 拍照和录像：

```shell
# 安装
$ sudo apt install fswebcam ffmpeg
# 拍照
$ fswebcam -r 1280x720 --no-banner image.jpg
# 录像
$ ffmpeg -f v4l2 -s 640x480 -i /dev/video0 -b:v 1.5M -c:v h264_v4l2m2m -r 24 -s 640x480 video.mp4
```



### 6. GPIO

树莓派区别于常规计算机的一个强大功能是它带有 **GPIO** (general-purpose input/output) ，中文翻译为**通用输入输出接口**，一般在中文语境下也用 GPIO。

树莓派上的不同 GPIO 有以下功能：

- 电源输出：5V（最大电流输出与电源能力有关）、3.3V（最大 50mA 电流输出）。

- 输出：高（3.3V）、低（0V），最大 16mA 电流输出。

- 输入：高（3.3V）、低（0V），带 50kΩ 左右的上/下拉电阻，其中 GPIO2 和 GPIO3 只带上拉电阻，其余可配置为上拉或者下拉。上/下拉表示 IO 口默认是连接到电源还是地。例如，当 IO 口**配置为上拉**时，外接开关（输入）的**另一端就需要接地**，这样在开关按下（输入变化）后，正确的低电平信号才能传给 IO。

  ![pull_up_resistor](/images/2022-04-30-raspberr_pi_os/pull_up_resistor.jpeg)								![pull_down_resistor](/images/2022-04-30-raspberr_pi_os/pull_down_resistor.jpg)

  

- 专用功能：

  - PWM (Pulse-width Modulation)，中文**脉宽调制**
    - 所有 pin 都可以实现软件 PWN
    - GPIO12、GPIO13、GPIO18、GPIO19 带有硬件 PWM
    - 软件PWM 和硬件 PWM 的区别在于：软件 PWM 依靠**操作系统的时间分片调度**，其占空比并不准确；硬件 PWM 由**专有硬件实现**，占空比和周期都非常准确
  - SPI (Serial Peripheral Interface Bus)，中文**串行外设接口**
    - SPI0: MOSI (GPIO10); MISO (GPIO9); SCLK (GPIO11); CE0 (GPIO8), CE1 (GPIO7)
    - SPI1: MOSI (GPIO20); MISO (GPIO19); SCLK (GPIO21); CE0 (GPIO18); CE1 (GPIO17); CE2 (GPIO16)
  - I2C (Inter-Integrated Circuit)，中文**集成电路总线**
    - Data: (GPIO2); Clock (GPIO3)
    - EEPROM Data: (GPIO0); EEPROM Clock (GPIO1)
  - Serial，串口
    - TX (GPIO14); RX (GPIO15)

树莓派 4B 板上带有 40-pin 的 GPIO 插头，其引脚分布如下：

![gpio](/images/2022-04-30-raspberr_pi_os/gpio.png)

![gpio_class](/images/2022-04-30-raspberr_pi_os/gpio_class.png)

在命令行输入 `pinout` 也可以看到引脚分布图，或者访问 [Raspberry Pi Pinout](https://pinout.xyz) 查看更多信息。

![pinout](/images/2022-04-30-raspberr_pi_os/pinout.jpg)



#### LED

硬件领域的点亮 LED，跟软件行业的 Hello World 一样，是学习一款硬件颇有仪式感的第一步。

首先按图示连接元器件，限流电阻可以选 330Ω，3.3v/330Ω = 10mA（LED 工作电流一般 5mA - 20mA），LED 阳极接 GPIO14，阴极接 GND。

![led](/images/2022-04-30-raspberr_pi_os/led.jpg)

然后创建 python 脚本，`python led.py` 运行脚本，LED 有规律的闪起来了。

```python
# led.py
from gpiozero import LED
from time import sleep

led = LED(14)
led.blink()
input()
```

![led](/images/2022-04-30-raspberr_pi_os/led.gif)

或者按照下图接线，利用 PWM 做个呼吸灯，感受下电子的生命。

![pwm](/images/2022-04-30-raspberr_pi_os/pwm.jpg)

```python
# pwm.py
from gpiozero import PWMLED
from time import sleep

led = PWMLED(12)
led.blink(0.5, 0.5, 2, 2)
input()
```

![pwm](/images/2022-04-30-raspberr_pi_os/pwm.gif)

 

#### 蜂鸣器

手边正好有个无源压电蜂鸣器，这里顺带介绍下。

常见的蜂鸣器有无源和有源两类，是根据其内部是否带有振荡源区分的。有源蜂鸣器内部自带振荡源，使用时直接通直流电便能发出声音；无源蜂鸣器则需要提供振荡信号才能发出声音。

压电指其工作原理利用了压电陶瓷片的电能/机械能转化特性，压电陶瓷片可以把振荡的电信号转化为自身的高频振动挤压周围空气，从而像人的声带一样发出声音。

我手上的无源压电蜂鸣器型号是3MMTDK，几毛钱一个，下边是它的特性曲线：

![buzzer_spec](/images/2022-04-30-raspberr_pi_os/buzzer_spec.jpeg)

蜂鸣器跟树莓派之间的连线也非常简单，直接接到 PWM 输出和地之间即可。

![buzzer](/images/2022-04-30-raspberr_pi_os/buzzer.jpg)

运行以下代码，蜂鸣器会一直发出“哔”的声音：

```python
from gpiozero import PWMOutputDevice

bz = PWMOutputDevice(12, True, 0.5, 4000)
input()
```

更高级一点，让它奏一曲[真·电音版《铁血丹心》](https://www.bilibili.com/video/BV1Sr4y1b7tQ?share_source=copy_web)，代码详见 [buzzer-player](https://github.com/Panda-Academy/buzzer-player)，如果打不开请访问同步的 [Gitee 版 buzzer-player](https://gitee.com/Panda-Academy/buzzer-player)。