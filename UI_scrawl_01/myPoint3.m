//
//  myPoint3.m
//  UI_scrawl_01
//
//  Created by scuplt on 16-3-10.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myPoint3.h"
#import "myLockButton.h"
@interface myPoint3()
/* 触摸的数组  */
@property (nonatomic,strong) NSMutableArray *arrTouchPoint;
@property (nonatomic,assign ) CGPoint currentPoint;
@end


@implementation myPoint3
-(NSMutableArray *)arrTouchPoint{
    if(_arrTouchPoint==nil){
        _arrTouchPoint=[NSMutableArray array];
    }
    return _arrTouchPoint;
}


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}
-(void)setup{
    for (int i=0; i<9; i++) {
        myLockButton *btn=[myLockButton buttonWithType:UIButtonTypeCustom];
        //以下交给按钮类去做,面象对象编程
//        btn.userInteractionEnabled=NO;//原:点击按钮变灰,-->让其点击事件 不可触
//        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        
        //使用tag,要存储
        btn.tag=i;
        [self addSubview:btn];
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat w=72,h=72;
    CGFloat x,y,margin;
    int countNumber=3;
    
    for (int i=0; i<self.subviews.count; i++) {
        UIButton *btn=self.subviews[i];
        margin=(self.frame.size.width-w*countNumber)/4;
        int col=i%countNumber ,row=i/countNumber ;
        x=margin+col*(w+margin);
        y=row*(h+margin);
        btn.frame=CGRectMake(x, y, w, h);
    }
}

/* touch 摸点  位置*/
-(CGPoint) touchPoint:(NSSet *)touches{
    UITouch *touchBegin=[touches anyObject];
    return  [touchBegin locationInView:touchBegin.view];
}
/* 根据摸点 获得对应的按钮  CGRectContainsPoint */
-(UIButton *)buttonWithPoint:(CGPoint) points{
    CGFloat wh=24;
    CGFloat x,y;
    for (UIButton *btn in self.subviews) {
        x=btn.center.x-wh*0.5;
        y=btn.center.y-wh*0.5;
        if(CGRectContainsPoint(CGRectMake(x, y, wh, wh),points))//判断 框中 有没有选中
        {
            return btn;
        }
    }
    return nil;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint pointBegin=[self touchPoint:touches];/* touch 摸点  位置*/
    UIButton *btnBegin=[self buttonWithPoint:pointBegin];/* 根据摸点 获得对应的按钮  CGRectContainsPoint */
    if(btnBegin!=nil&&btnBegin.selected==NO){
        btnBegin.selected=YES;
        [self.arrTouchPoint addObject:btnBegin];
    }
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint pointMove=[self touchPoint:touches];
    UIButton *btnMove=[self buttonWithPoint:pointMove];
    if(btnMove!=nil&&btnMove.selected==NO){
        btnMove.selected=YES;
        [self.arrTouchPoint addObject:btnMove];
    }
    self.currentPoint=pointMove;
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if([self.delegate respondsToSelector:@selector(point3Read:andNumbers:)]){
        NSMutableString *str=[NSMutableString string];
        for (UIButton *btn in self.arrTouchPoint) {
            [str appendString:[NSString stringWithFormat:@"%d",btn.tag]];
        }
            NSLog(@"str=%@",str);
    }   
   
    [self.arrTouchPoint makeObjectsPerformSelector:@selector(setSelected:) withObject:@(NO)];
      [self.arrTouchPoint removeAllObjects];
    [self setNeedsDisplay];
    self.currentPoint=CGPointZero;//使当前点归零 0
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [self touchesEnded:touches withEvent:event];
}
- (void)drawRect:(CGRect)rect{
    if(self.arrTouchPoint.count==0)return;
    
    UIBezierPath *path=[UIBezierPath bezierPath];
    for (int index=0; index<self.arrTouchPoint.count; index++) {
        UIButton *btn=self.arrTouchPoint[index];
        if(index==0)
            [path moveToPoint:btn.center];
        else
            [path addLineToPoint:btn.center];
    }
    if(CGPointEqualToPoint(self.currentPoint, CGPointZero)==NO)//防止从 00点 冒出的 点
    {
        [path addLineToPoint:self.currentPoint];//从9点中,连接到自身
    }
    
    path.lineWidth=10;
    path.lineCapStyle=kCGLineCapRound;
    path.lineJoinStyle=kCGLineCapRound;
    [[UIColor redColor]set];
    [path stroke];
}

@end













