# GPSModify
`虚拟定位修改手机GPS定位，可使手机自带地图以及其他地图APP或需要用到定位的地方，都被设置为本项目内指定的坐标`
__________________________
用法
=======================
1、百度地图开放平台搜索想要定位的坐标 （[坐标拾取](http://api.map.baidu.com/lbsapi/getpoint/index.html)）<br>
2、Xcode运行程序将BD坐标转为WGS坐标<br>
3，修改GPX文件坐标<br>
4、点击工具栏Debug -> Simulator Location，选择gpx文件<br>
5、点击stop，10-30分钟还原为真实定位；如想保留时间更长，可直接拔线，重启手机定位会还原<br>
