//
//  myPoint3.m
//  UI_scrawl_01
//
//  Created by scuplt on 16-3-10.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myPoint3.h"

@implementation myPoint3


- (void)drawRect:(CGRect)rect{

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
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.userInteractionEnabled=NO;//原:点击按钮变灰,-->让其点击事件 不可触
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];

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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touchBegin=[touches anyObject];
    CGPoint pointBegin=[touchBegin locationInView:touchBegin.view];
    

}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touchMove=[touches anyObject];
    CGPoint pointMove=[touchMove locationInView:touchMove.view];
    for (UIButton *btn in self.subviews) {
        if(CGRectContainsPoint(btn.frame,pointMove))//判断 框中 有没有选中
        {
            btn.selected=YES;
        }
    }
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self touchesEnded:touches withEvent:event];
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
       [self touchesEnded:touches withEvent:event];
}

@end













