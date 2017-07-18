//
//  GDMDrawMarkViewController.m
//  GaoDeMap
//
//  Created by liuxm on 2017/7/18.
//  Copyright © 2017年 liuxm. All rights reserved.
//

#import "GDMDrawMarkViewController.h"
#import <CoreLocation/CLLocationManager.h>
#import "GDMCustomAnnotationView.h"

@interface GDMDrawMarkViewController ()<MAMapViewDelegate, CLLocationManagerDelegate> {
    MAMapView *_mapView;
    CLLocationManager *_locationManager;
}

@end

@implementation GDMDrawMarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"绘制点标记";
    
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView.delegate = self;
    
    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    //    _mapView.showsUserLocation = NO;
    //    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    ///把地图添加至view
    [self.view addSubview:_mapView];
    
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    // 添加默认样式点标记
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.989631, 116.481018);
    pointAnnotation.title = @"东方大厦";
    pointAnnotation.subtitle = @"世纪大道1500号";
    
    [_mapView addAnnotation:pointAnnotation];
    
    // 添加默认样式点标记
    MAPointAnnotation *pointAnnotation2 = [[MAPointAnnotation alloc] init];
    pointAnnotation2.coordinate = CLLocationCoordinate2DMake(39.989631, 116.381018);
    pointAnnotation2.title = @"东方大厦2";
    pointAnnotation2.subtitle = @"世纪大道1500号2";
    
    [_mapView addAnnotation:pointAnnotation2];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations lastObject];
    CLLocationDegrees latitude = location.coordinate.latitude;
    CLLocationDegrees longitude = location.coordinate.longitude;
    
    UIAlertView *alert = [[UIAlertView alloc]init];
    [alert setTitle:[NSString stringWithFormat:@"%f-%f", latitude, longitude]];
    NSLog(@"%f---%f", latitude, longitude);
}

// 设置标注样式
//- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation {
//    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
//        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
//        // 高德地图提供 MAPinAnnotationView
//        MAPinAnnotationView *annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
//        if (annotationView == nil) {
//            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
//        }
//        annotationView.canShowCallout= YES;       // 设置气泡可以弹出，默认为NO
//        annotationView.animatesDrop = YES;        // 设置标注动画显示，默认为NO
//        annotationView.draggable = YES;           // 设置标注可以拖动，默认为NO
//        // 自带大头针标注图标
//        // annotationView.pinColor = MAPinAnnotationColorGreen;
//
//        // 自定义标注图标
//        annotationView.image = [UIImage imageNamed:@"Mark"];
//        return annotationView;
//    }
//
//    return nil;
//}

// 自定义标注样式
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation {
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        GDMCustomAnnotationView *annotationView = (GDMCustomAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)  {
            annotationView = [[GDMCustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
        }
        annotationView.image = [UIImage imageNamed:@"Mark"];
        
        //        annotationView.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Annotation"]];
        UIImage *image = [UIImage imageNamed:@"Annotation"];
        [annotationView.calloutView setImage:image];
        
        // 设置为NO，用以调用自定义的calloutView
        annotationView.canShowCallout = NO;
        
        // 设置中心点偏移，使得标注底部中间点成为经纬度对应点
        annotationView.centerOffset = CGPointMake(0, -18);
        
        return annotationView;
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
