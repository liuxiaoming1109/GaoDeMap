//
//  GDMInteractionViewController.m
//  GaoDeMap
//
//  Created by liuxm on 2017/7/17.
//  Copyright © 2017年 liuxm. All rights reserved.
//

#import "GDMInteractionViewController.h"

@interface GDMInteractionViewController () {
    MAMapView *_mapView;
}

@end

@implementation GDMInteractionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"地图交互";
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
