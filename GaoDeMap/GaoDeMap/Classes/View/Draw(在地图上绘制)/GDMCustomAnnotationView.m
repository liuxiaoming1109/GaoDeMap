//
//  GDMCustomAnnotationView.m
//  GaoDeMap
//
//  Created by liuxm on 2017/7/18.
//  Copyright © 2017年 liuxm. All rights reserved.
//

#import "GDMCustomAnnotationView.h"

#define kCalloutWidth       200.0
#define kCalloutHeight      70.0

@interface GDMCustomAnnotationView()

@property (nonatomic, strong, readwrite) GDMCustomCalloutView *calloutView;

@end

@implementation GDMCustomAnnotationView

// 重写选中方法setSelected。选中时新建并添加calloutView，传入数据；非选中时删除calloutView
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    if (self.selected == selected) {
        return;
    }
    
    if (selected) {
        if (self.calloutView == nil) {
            self.calloutView = [[GDMCustomCalloutView alloc] initWithFrame:CGRectMake(0, 0, kCalloutWidth, kCalloutHeight)];
            self.calloutView.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x,
                                                  -CGRectGetHeight(self.calloutView.bounds) / 2.f + self.calloutOffset.y);
        }
        
        self.calloutView.image = [UIImage imageNamed:@"Annotation"];
        self.calloutView.title = self.annotation.title;
        self.calloutView.subtitle = self.annotation.subtitle;
        
        [self addSubview:self.calloutView];
    } else {
        [self.calloutView removeFromSuperview];
    }
    
    [super setSelected:selected animated:animated];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
