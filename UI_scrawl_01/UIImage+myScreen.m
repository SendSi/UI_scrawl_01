//
//  UIImage+myScreen.m
//  UI_scrawl_01
//
//  Created by scuplt on 16-3-9.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "UIImage+myScreen.h"

@implementation UIImage (myScreen)
+(instancetype)captureWithView:(UIView *)view{
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
