
//  myPoint2.m
//  UI_scrawl_01
//
//  Created by scuplt on 16-3-10.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myPoint2.h"
@interface myPoint2()
@property (nonatomic,strong) NSMutableArray *arrPoints;

@end
@implementation myPoint2

-(NSMutableArray *)arrPoints{
    if(_arrPoints==nil){
        _arrPoints=[NSMutableArray array];
    }return _arrPoints;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *onePoint= [touches anyObject];
    CGPoint points= [onePoint locationInView:onePoint.view];
    
    UIBezierPath *beginPath= [UIBezierPath bezierPath];
    beginPath.lineWidth=4;
    beginPath.lineJoinStyle=kCGLineJoinRound;
    beginPath.lineCapStyle=kCGLineJoinRound;
    [beginPath moveToPoint:points];
    [self.arrPoints addObject:beginPath];
    
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *moveTouch=[touches anyObject];
    CGPoint movePoint=    [moveTouch locationInView:moveTouch.view];
    UIBezierPath *movePath=[self.arrPoints lastObject];
    [movePath addLineToPoint:movePoint];
        [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self touchesMoved:touches withEvent:event];
}

- (void)drawRect:(CGRect)rect {
    [[UIColor yellowColor]set];
    for (UIBezierPath *dic in self.arrPoints) {
        [dic stroke];
    }
}
-(void)Clear{
    [self.arrPoints removeAllObjects];
    [self setNeedsDisplay];
}
-(void)ReturnBack{
    [self.arrPoints removeLastObject];
    [self setNeedsDisplay];
}
@end
