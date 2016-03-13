//
//  myPoint_drag.m
//  UI_scrawl_01
//
//  Created by scuplt on 16-3-13.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myPoint_drag.h"

@implementation myPoint_drag

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
   UITouch *startTouch= [touches anyObject];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *moveTouch= [touches anyObject];
    CGPoint current=   [moveTouch locationInView:self];
    CGPoint preView=    [moveTouch previousLocationInView:self];
    CGPoint center=self.center;
    center.x+=current.x-preView.x;
    center.y+=current.y-preView.y;
    self.center=center;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
        UITouch *startTouch= [touches anyObject];
}
@end
