//
//  GDMDrawPlaneViewController.m
//  GaoDeMap
//
//  Created by liuxm on 2017/7/19.
//  Copyright © 2017年 liuxm. All rights reserved.
//

#import "GDMDrawPlaneViewController.h"

@interface GDMDrawPlaneViewController () <MAMapViewDelegate> {
    MAMapView *_mapView;
}

@end

@implementation GDMDrawPlaneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"绘制面";
    
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView.delegate = self;
    
    ///把地图添加至view
    [self.view addSubview:_mapView];
    
    // 构造圆
//    [self initCircle];
    // 绘制overlay（自定义图层）
    [self initOverlay];
}

// 构造圆
- (void)initCircle {
    // 构造圆
    MACircle *circle = [MACircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(39.952136, 116.50095) radius:5000];
    
    // 在地图上添加圆
    [_mapView addOverlay: circle];
}

// 绘制overlay（自定义图层）
- (void)initOverlay {
    MACoordinateBounds coordinateBounds = MACoordinateBoundsMake(CLLocationCoordinate2DMake
                                                                 (39.939577, 116.388331),CLLocationCoordinate2DMake(39.935029, 116.384377));
    
    MAGroundOverlay *groundOverlay = [MAGroundOverlay groundOverlayWithBounds:coordinateBounds icon:[UIImage imageNamed:@"GWF"]];
    
    [_mapView addOverlay:groundOverlay];
    _mapView.visibleMapRect = groundOverlay.boundingMapRect;
}

// 设置圆的样式
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay {
    if ([overlay isKindOfClass:[MACircle class]]) {
        MACircleRenderer *circleRenderer = [[MACircleRenderer alloc] initWithCircle:overlay];
        
        circleRenderer.lineWidth    = 5.f;
        circleRenderer.strokeColor  = [UIColor redColor];
        circleRenderer.fillColor    = [UIColor colorWithRed:1.0 green:0.8 blue:0.0 alpha:0.8];
        return circleRenderer;
    } else if ([overlay isKindOfClass:[MAGroundOverlay class]]) {
        MAGroundOverlayRenderer *groundOverlayRenderer = [[MAGroundOverlayRenderer alloc] initWithGroundOverlay:overlay];
        
        return groundOverlayRenderer;
    }
    
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
