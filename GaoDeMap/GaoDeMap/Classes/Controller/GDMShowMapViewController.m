//
//  GDMShowMapViewController.m
//  GaoDeMap
//
//  Created by liuxm on 2017/7/17.
//  Copyright © 2017年 liuxm. All rights reserved.
//

#import "GDMShowMapViewController.h"

@interface GDMShowMapViewController () {
    UISegmentedControl *_segCtrl;
    MAMapView *_mapView;
}

@end

@implementation GDMShowMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"显示地图";
    
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    
    ///把地图添加至view
    [self.view addSubview:_mapView];
    
    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    //YES：显示室内地图；NO：不显示；
    _mapView.showsIndoorMap = YES;
    
    [_mapView setMapType:MAMapTypeStandard];
    
    NSArray *segArray = [[NSArray alloc]initWithObjects:@"标准地图", @"卫星地图", @"夜景模式", @"导航模式", @"公交模式", nil];
    _segCtrl = [[UISegmentedControl alloc]initWithItems:segArray];
    _segCtrl.frame = CGRectMake(20, CGRectGetHeight(self.view.frame) - 80, CGRectGetWidth(self.view.frame) - 40, 30);
    NSInteger selecteIndex = 0;
    _segCtrl.selectedSegmentIndex = selecteIndex;
    _segCtrl.tintColor = [UIColor redColor];
    [_segCtrl addTarget:self action:@selector(typeTab:) forControlEvents:UIControlEventValueChanged];
    [_mapView addSubview:_segCtrl];
}

/**
 *  页面切换
 */
- (void)typeTab:(UISegmentedControl *)seg {
    if (seg.selectedSegmentIndex == 0) {
       [_mapView setMapType:MAMapTypeStandard];
    } else if (seg.selectedSegmentIndex == 1) {
        [_mapView setMapType:MAMapTypeSatellite];
    } else if (seg.selectedSegmentIndex == 2) {
        [_mapView setMapType:MAMapTypeStandardNight];
    } else if (seg.selectedSegmentIndex == 3) {
        [_mapView setMapType:MAMapTypeNavi];
    } else {
        [_mapView setMapType:MAMapTypeBus];
    }
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
