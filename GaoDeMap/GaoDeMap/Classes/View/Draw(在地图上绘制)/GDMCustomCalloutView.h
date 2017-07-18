//
//  GDMCustomCalloutView.h
//  GaoDeMap
//
//  Created by liuxm on 2017/7/18.
//  Copyright © 2017年 liuxm. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 自定义气泡
 */
@interface GDMCustomCalloutView : UIView

@property (nonatomic, strong) UIImage *image;   // 商户图
@property (nonatomic, copy) NSString *title;    // 商户名
@property (nonatomic, copy) NSString *subtitle; // 地址

@end
