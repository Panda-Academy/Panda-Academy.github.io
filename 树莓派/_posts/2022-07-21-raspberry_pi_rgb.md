---
title: 树莓派调色 RGB LED
typora-root-url: ../..
---

RGB 或者三原色大家应该都听说过：通过红（Red）、绿（Green）、蓝（Blue）三种基本颜色可以“合成”其它各种颜色，譬如：红+绿=黄，绿+蓝=青，红+蓝=洋红等等。

但是，更准确一点的说法应该是：将 RGB 以不同的比例混合后，对人的眼睛可以形成与各种频率的可见光等效的色觉。直白一点就是：RGB 的组合欺骗了人眼/脑，让人感觉是看到了其它颜色，这是由人的生理原因造成的，并非出于物理原因。

颜色理论中有很多概念以及定义，其中跟原色相关的有[加色法](https://zh.wikipedia.org/zh-cn/加色法)和[减色法](https://zh.wikipedia.org/zh-cn/減色法)，它说的是：相同颜色的**透明物体**和**不透明物体**，对光的处理不一样。譬如：绿色透明物体，它**透过绿光**，吸收其他色光，因此人眼看到绿色；绿色不透明物体，它**反射绿光**，吸收其他色光，因此人眼看到绿色。虽然都看到了绿色，透明物体是由于光的透射，不透明物体是由于光的反射。由此原色也可以分为两类，一类基于透射，一类基于反射，感兴趣的同学可以去 Wiki 上再看看。

- [三原色光模式](https://zh.wikipedia.org/zh-cn/三原色光模式)，RGB 为三原色。
- [印刷四分色模式](https://zh.wikipedia.org/zh-cn/印刷四分色模式)，CMYK（**C**yan、**M**agenta、**Y**ellow、blac**K**）为四分色。

以上是一点点理论知识，下面看看实践部分。



## 在线调色

[Colors RGB](https://www.w3schools.com/colors/colors_rgb.asp) 可以在线调整 RGB 的值以得到不同的颜色，方便好奇的同学了解 RGB。

补充说明下 RGB 的表达方式，常见的有两种：rgb(255, 0, 0)、\#ff0000。

- rgb(xxx, xxx, xxx) 的方式，三个值分别表示 R、G、B 的大小，最大值为 255 (8 bit)
- #ff0000 的方式，是 rgb 的 十六进制表达方式，总共 6 个字符，前 2 个字符表示 R 的大小，00 到 FF 对应十进制的 0 到 255，中间 2 个字符表示 G 的大小，最后两个字符表示 B 的大小。



## LED 调色

借助于 RGB LED（电子市场零售大概几毛一个），树莓派也可以实现单 LED 的调色。

先看看效果（拍照有炫光，实际的灯光效果比图片好）：

![rgb_led](/images/2022-07-21-raspberry_pi_rgb/rgb_led.gif)

下面是硬件连接电路：黑色线接共阴极，红、绿、蓝三根线分别接 R、G、B 的阳极，限流电阻可以选择 220Ω（3.3v/220Ω=15mA）。

![rgb_led](/images/2022-07-21-raspberry_pi_rgb/rgb_led.jpg)

接下来是代码，鉴于大多数情况下树莓派都是放在角落里做为微型服务器用，一般不接显示器，因此代码就选择 C/S 模式：手头的电脑做 **C**lient 通过 GUI 进行 RGB 值的调整；角落的树莓派做 **S**erver 接收 Client 传过来的值对 LED 进行颜色调整，结构图如下。

```
┌────Client─────┐                ┌────Server─────┐
│               │                │               │
│ ┌───────────┐ │                │ ┌───────────┐ │
│ │    GUI    │ │                │ │    LED    │ │
│ └─────┬─────┘ │                │ └─────▲─────┘ │
│       │       │                │       │       │
│       │       │                │       │       │
│  ┌────▼────┐  │                │  ┌────┴────┐  │
│  │  R G B  ├──┼──────http──────┼──►  R G B  │  │
│  └─────────┘  │                │  └─────────┘  │
│               │                │               │
└───────────────┘                └───────────────┘
```

Client 代码如下，需要安装 tkinter 模块，macOS 下命令：` brew install python-tk@3.10`，其它系统大家自行搜索吧，代码中需要根据自己实际情况进行调整的地方是 **IP**，要改成实际的树莓派 IP。

```python
from tkinter import *
import urllib.request


def init_scale():
    Scale(
        window,
        orient=HORIZONTAL,
        from_=0, to=255, length=200,
        variable=r, background="#ff0000",
        command=updateRGB
    ).pack()
    Scale(
        window,
        orient=HORIZONTAL,
        from_=0, to=255, length=200,
        variable=g, background="#00ff00",
        command=updateRGB
    ).pack()
    Scale(
        window,
        orient=HORIZONTAL,
        from_=0, to=255, length=200,
        variable=b, background="#0000ff",
        command=updateRGB
    ).pack()

    window.mainloop()


def updateRGB(event):
    print(event)
    url = f"http://{IP}:{PORT}?r={r.get()/MAX}&g={g.get()/MAX}&b={b.get()/MAX}"
    response = urllib.request.urlopen(url)
    print(response.read().decode('utf-8'))


if __name__ == "__main__":
    window = Tk()
    window.title("RGB")

    r = IntVar()
    g = IntVar()
    b = IntVar()
    MAX = 255.0
    IP = "192.168.0.2"
    PORT = "8080"

    init_scale()
```

Server 代码如下，需要安装 gpiozero 模块（一个树莓派下非常好用的 GPIO 库），代码中需要根据自己实际情况进行调整的地方是 **RED**、**GREEN**、**BLUE**，要改成实际连接的树莓派管脚。

```python
from http import HTTPStatus
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import parse_qs, urlparse

from gpiozero import RGBLED


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        parsed = urlparse(self.path)
        rgb = parse_qs(parsed.query)
        led.color = (float(rgb['r'][0]),
                     float(rgb['g'][0]),
                     float(rgb['b'][0]))

        self.send_response(HTTPStatus.OK)
        self.end_headers()
        self.wfile.write(bytes(str(rgb), "utf-8"))


if __name__ == "__main__":
    RED = 9
    GREEN = 10
    BLUE = 11
    PORT = 8080

    led = RGBLED(red=RED, green=GREEN, blue=BLUE)

    httpd = HTTPServer(('', PORT), Handler)
    httpd.serve_forever()
```

启动时，Server 代码存放在树莓派上保存为 rgb-server.py 文件，通过命令 `sudo python3 rgb-server.py` 启动；Client 代码存放在自己电脑上保存为 rgb-client.py 文件，通过命令 `python3 rgb-client.py` 启动。