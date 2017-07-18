//
//  GDMCustomAnnotationView.h
//  GaoDeMap
//
//  Created by liuxm on 2017/7/18.
//  Copyright © 2017年 liuxm. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "GDMCustomCalloutView.h"

/**
 自定义AnnotationView
 */
@interface GDMCustomAnnotationView : MAAnnotationView

@property (nonatomic, readonly) GDMCustomCalloutView *calloutView;

@end
