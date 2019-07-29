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
    
    [self createUI];
    
    //百度开发平台拿到的BD坐标
    CLLocationCoordinate2D bdCoor = CLLocationCoordinate2DMake(21.666834,110.49619);
    //转换成WGS坐标
    CLLocationCoordinate2D wgsCoor = [CoordinateTransform bd09ToWgs84:bdCoor];
    
    /*! 1.运行一次
     * 输出转换后的wgs坐标，
     * 控制台拿到新坐标后，修改SimulatorLocation.gpx文件里的坐标
     */
    NSLog(@"WGS:经度 %lf, 纬度 %lf", wgsCoor.longitude, wgsCoor.latitude);
    
    /*! 2.再次运行
     * Debug -> Simulator Location
     * 选择gpx文件SimulatorLocation，即可定位到gpx文件指定的坐标
     */
}

-(void)createUI {
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    bgImageView.image = [UIImage imageNamed:@"scenery1.jpg"];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectView.frame = CGRectMake(0, 0, CGRectGetWidth(bgImageView.frame), 250);
    effectView.center = bgImageView.center;
    effectView.alpha = 0.6;
    [bgImageView addSubview:effectView];
    [self.view addSubview:bgImageView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, CGRectGetWidth(self.view.bounds), 40)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"虚拟定位";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:titleLabel];
    
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.view.bounds)-20, 200)];
    infoLabel.center = self.view.center;
    NSString *str = @"1、百度地图开放平台搜索想要定位的坐标\n2、Xcode运行程序将BD坐标转为WGS坐标\n3、修改项目内的gpx文件坐标为获取到的WGS坐标\n4、再次运行，debug-simulator location，选择gpx文件\n5、直接拔线，可保留虚拟定位\n6、点击stop，10-30分钟还原为真实定位";
    infoLabel.text = str;
    infoLabel.font = [UIFont systemFontOfSize:16];
    infoLabel.textColor = [UIColor whiteColor];
    infoLabel.numberOfLines = 0;
    [self.view addSubview:infoLabel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
