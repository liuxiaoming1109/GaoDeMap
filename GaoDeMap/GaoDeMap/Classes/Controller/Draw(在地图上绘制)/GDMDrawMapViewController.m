//
//  GDMDrawMapViewController.m
//  GaoDeMap
//
//  Created by liuxm on 2017/7/18.
//  Copyright © 2017年 liuxm. All rights reserved.
//

#import "GDMDrawMapViewController.h"
#import "GDMDrawMarkViewController.h"


@interface GDMDrawMapViewController () <UITableViewDelegate, UITableViewDataSource> {
    // Cell数据
    NSArray *_cellArray;
}

@end

@implementation GDMDrawMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"在地图上绘制";
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    _cellArray = [[NSArray alloc]initWithObjects:@"绘制点标记", @"地图交互", @"在地图上绘制", @"获取地图数据", nil];
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
            GDMDrawMarkViewController *markVC = [[GDMDrawMarkViewController alloc]init];
            [self.navigationController pushViewController:markVC animated:YES];
        }
            break;
//        case 1:
//        {
//            GDMInteractionViewController *interactionVC = [[GDMInteractionViewController alloc]init];
//            [self.navigationController pushViewController:interactionVC animated:YES];
//        }
//            break;
//        case 2:
//        {
//            GDMDrawMapViewController *drawMapVC = [[GDMDrawMapViewController alloc]init];
//            [self.navigationController pushViewController:drawMapVC animated:YES];
//        }
//            break;
            
        default:
            break;
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
