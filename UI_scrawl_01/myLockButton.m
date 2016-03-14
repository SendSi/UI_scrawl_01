//
//  myLockButton.m
//  UI_scrawl_01
//
//  Created by scuplt on 16-3-13.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myLockButton.h"

@implementation myLockButton

-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if(self){
        [self setUp];
    }
    return self;
}
-(void) setUp{
    self.userInteractionEnabled=NO;
    [self setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:(UIControlStateNormal)];
    [self setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:(UIControlStateSelected)];
}
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        [self setUp];
    }return self;
}


@end
