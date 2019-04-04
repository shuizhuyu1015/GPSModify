//
//  ViewController.m
//  GPSModify
//
//  Created by GL on 2018/2/27.
//  Copyright © 2018年 GL. All rights reserved.
//

#import "ViewController.h"
#import "CoordinateTransform.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    bgImageView.image = [UIImage imageNamed:@"scenery1.jpg"];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectView.frame = CGRectMake(0, 0, CGRectGetWidth(bgImageView.frame), 250);
    effectView.center = bgImageView.center;
    effectView.alpha = 0.6;
    [bgImageView addSubview:effectView];
    [self.view addSubview:bgImageView];
    
    //百度开发平台拿到的BD坐标
    CLLocationCoordinate2D bdCoor = CLLocationCoordinate2DMake(25.749347, 123.479754);
    //转换成WGS坐标
    CLLocationCoordinate2D wgsCoor = [CoordinateTransform bd09ToWgs84:bdCoor];
    //获取转换后坐标后，记得修改gpx文件里的坐标，才能修改手机虚拟定位
    NSLog(@"经度 %lf, 纬度 %lf", wgsCoor.longitude, wgsCoor.latitude);
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, CGRectGetWidth(self.view.bounds), 40)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"虚拟定位";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:titleLabel];
    
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.view.bounds)-20, 200)];
    infoLabel.center = self.view.center;
    NSString *str = @"1、百度地图开放平台搜索想要定位的坐标\n2、Xcode运行程序将BD坐标转为WGS坐标\n3、修改gpx文件坐标\n4、debug-simulator location，选择gpx文件\n5、直接拔线，可保留虚拟定位\n6、点击stop，10-30分钟还原为真实定位";
    infoLabel.text = str;
    infoLabel.font = [UIFont systemFontOfSize:15];
    infoLabel.textColor = [UIColor whiteColor];
    infoLabel.numberOfLines = 0;
    [self.view addSubview:infoLabel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
