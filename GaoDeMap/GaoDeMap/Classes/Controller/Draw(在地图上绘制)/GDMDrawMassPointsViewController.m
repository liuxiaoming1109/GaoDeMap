//
//  GDMDrawMassPointsViewController.m
//  GaoDeMap
//
//  Created by liuxm on 2017/7/20.
//  Copyright © 2017年 liuxm. All rights reserved.
//

#import "GDMDrawMassPointsViewController.h"

@interface GDMDrawMassPointsViewController () <MAMapViewDelegate, MAMultiPointOverlayRendererDelegate> {
    MAMapView *_mapView;
}

@end

@implementation GDMDrawMassPointsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"绘制海量点";
    
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView.delegate = self;
    
    ///把地图添加至view
    [self.view addSubview:_mapView];
    
    [self initData];
}

- (void)initData {
    ///根据file读取出经纬度数组
    NSString *file = [[NSBundle mainBundle] pathForResource:@"Points" ofType:@"txt"];
    NSString *locationString = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
    NSArray *locations = [locationString componentsSeparatedByString:@"\n"];
    
    ///创建MultiPointItems数组，并更新数据
    NSMutableArray *items = [NSMutableArray array];
    
    for (int i = 0; i < locations.count; ++i) {
        @autoreleasepool {
            MAMultiPointItem *item = [[MAMultiPointItem alloc] init];
            
            NSArray *coordinate = [locations[i] componentsSeparatedByString:@","];
            
            if (coordinate.count == 2) {
                item.coordinate = CLLocationCoordinate2DMake([coordinate[1] floatValue], [coordinate[0] floatValue]);
                
                [items addObject:item];
            }
        }
    }
    
    ///根据items创建海量点Overlay MultiPointOverlay
    MAMultiPointOverlay *_overlay = [[MAMultiPointOverlay alloc] initWithMultiPointItems:items];
    
    ///把Overlay添加进mapView
    [_mapView addOverlay:_overlay];
}

// 通过 renderer 调整海量点的icon、锚点
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay {
    if ([overlay isKindOfClass:[MAMultiPointOverlay class]]) {
        MAMultiPointOverlayRenderer * renderer = [[MAMultiPointOverlayRenderer alloc] initWithMultiPointOverlay:overlay];
        
        ///设置图片
        renderer.icon = [UIImage imageNamed:@"Marker_red"];
        ///设置锚点
        renderer.anchor = CGPointMake(0.5, 1.0);
        renderer.delegate = self;
        return renderer;
    }
    
    return nil;
}

#pragma mark - 海量点点击回调

- (void)multiPointOverlayRenderer:(MAMultiPointOverlayRenderer *)renderer didItemTapped:(MAMultiPointItem *)item {
    NSLog(@"item :%@ <%f, %f>", item, item.coordinate.latitude, item.coordinate.longitude);
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
