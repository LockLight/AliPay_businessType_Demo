//
//  UILabel+Addition.m
//  01-生活圈
//
//  Created by chao on 2016/11/6.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "UILabel+Addition.h"

@implementation UILabel (Addition)
+ (instancetype)makeLabelWithText:(NSString *)text andTextColor:(UIColor *)color andTextFontSize:(CGFloat)font {
    UILabel *label = [[self alloc] init];
    label.text = text;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:font];
    return label;
}
@end
