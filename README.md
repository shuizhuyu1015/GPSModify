# GPSModify
`虚拟定位修改手机GPS定位，可使手机自带地图以及其他地图APP或需要用到定位的地方，都被设置为本项目内指定的坐标`
__________________________
用法
=======================
1、百度地图开放平台搜索想要定位的坐标 （[坐标拾取](http://api.map.baidu.com/lbsapi/getpoint/index.html)）<br>
2、Xcode运行程序将BD坐标转为WGS坐标<br>
```
#import "CoordinateTransform.h"

//百度开发平台拿到的BD坐标
CLLocationCoordinate2D bdCoor = CLLocationCoordinate2DMake(21.666834,110.49619);
//转换成WGS坐标
CLLocationCoordinate2D wgsCoor = [CoordinateTransform bd09ToWgs84:bdCoor];
//获取转换后坐标后，记得修改gpx文件里的坐标，才能修改手机虚拟定位
NSLog(@"WGS:经度 %lf, 纬度 %lf", wgsCoor.longitude, wgsCoor.latitude);
```
3，修改GPX文件(SimulatorLocation.gpx)坐标<br>
```
<gpx version="1.1"
    creator="GMapToGPX 6.4j - http://www.elsewhere.org/GMapToGPX/"
    xmlns="http://www.topografix.com/GPX/1/1"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">
    <wpt lat="21.663400" lon="110.485274">
    </wpt>
</gpx>
```
4、点击工具栏Debug -> Simulator Location，选择gpx文件<br>
5、点击stop，10-30分钟还原为真实定位；如想保留时间更长，可直接拔线，重启手机定位会还原<br>
