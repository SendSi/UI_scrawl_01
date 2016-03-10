//
//  myPoint.m
//  UI_scrawl_01
//
//  Created by scuplt on 16-3-9.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myPoint.h"
@interface myPoint()
@property (nonatomic,strong) NSMutableArray *arrPoint;
@end
@implementation myPoint
-(NSMutableArray *)arrPoint{
    if (_arrPoint==nil) {
        _arrPoint=[NSMutableArray array];
    }
    return _arrPoint;
}
-(void)clear{
    [self.arrPoint removeAllObjects];
    [self setNeedsDisplay];
}
-(void)lastOperation{
//       [self.arrPoint removeObjectAtIndex:self.arrPoint.count-1];
    [self.arrPoint removeLastObject];
        [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef refs=UIGraphicsGetCurrentContext();
    for (NSMutableArray *points in self.arrPoint) {
        
        for (int i=0; i<points.count; i++) {
            CGPoint xys=[points[i] CGPointValue];
            if(i==0)
                CGContextMoveToPoint(refs, xys.x, xys.y);
            else
                CGContextAddLineToPoint(refs, xys.x, xys.y);
        }
        
    }
    CGContextSetLineCap(refs, kCGLineCapRound);
    CGContextSetLineWidth(refs, 5);
    CGContextSetLineJoin(refs, kCGLineJoinRound);
    CGContextStrokePath(refs);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *mytouchs=[touches anyObject];
    CGPoint currentPos=   [mytouchs locationInView:mytouchs.view];
    
    NSMutableArray *arrOne=[NSMutableArray array];
    [arrOne addObject:[NSValue valueWithCGPoint:currentPos]];
    [self.arrPoint addObject:arrOne];
    
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *mytouchs=[touches anyObject];
    CGPoint currentPos=   [mytouchs locationInView:mytouchs.view];
    NSMutableArray *arrOne=[self.arrPoint lastObject];
    [arrOne addObject:[NSValue valueWithCGPoint:currentPos]];
//    [self.arrPoint addObject:arrOne];//这句话 不能写
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *mytouchs=[touches anyObject];
    CGPoint currentPos=   [mytouchs locationInView:mytouchs.view];
    NSMutableArray *arrOne=[self.arrPoint lastObject];
    [arrOne addObject:[NSValue valueWithCGPoint:currentPos]];
    //[self.arrPoint addObject:arrOne];
    [self setNeedsDisplay];
}


@end

