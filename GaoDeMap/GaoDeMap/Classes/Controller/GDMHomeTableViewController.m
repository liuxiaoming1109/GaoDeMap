//
//  GDMHomeTableViewController.m
//  GaoDeMap
//
//  Created by liuxm on 2017/7/17.
//  Copyright © 2017年 liuxm. All rights reserved.
//

#import "GDMHomeTableViewController.h"
#import "GDMShowMapViewController.h"
#import "GDMInteractionViewController.h"
#import "GDMDrawMarkViewController.h"
#import "GDMDrawPolylineViewController.h"
#import "GDMDrawPlaneViewController.h"


@interface GDMHomeTableViewController () {
    // Cell数据
    NSArray *_cellArray;
}

@end

@implementation GDMHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _cellArray = [[NSArray alloc]initWithObjects:@"显示定位", @"地图交互", @"绘制点标记", @"绘制折线", @"绘制面", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_cellArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"reuseIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [_cellArray objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            GDMShowMapViewController *showVC = [[GDMShowMapViewController alloc]init];
            [self.navigationController pushViewController:showVC animated:YES];
        }
            break;
        case 1:
        {
            GDMInteractionViewController *interactionVC = [[GDMInteractionViewController alloc]init];
            [self.navigationController pushViewController:interactionVC animated:YES];
        }
            break;
        case 2:
        {
            GDMDrawMarkViewController *markVC = [[GDMDrawMarkViewController alloc]init];
            [self.navigationController pushViewController:markVC animated:YES];
        }
            break;
        case 3:
        {
            GDMDrawPolylineViewController *polylineVC = [[GDMDrawPolylineViewController alloc]init];
            [self.navigationController pushViewController:polylineVC animated:YES];
        }
            break;
        case 4:
        {
            GDMDrawPlaneViewController *planeVC = [[GDMDrawPlaneViewController alloc]init];
            [self.navigationController pushViewController:planeVC animated:YES];
        }
            break;

            
        default:
            break;
    }
}


@end
