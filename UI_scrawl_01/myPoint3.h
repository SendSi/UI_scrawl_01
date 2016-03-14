//
//  myPoint3.h
//  UI_scrawl_01
//
//  Created by scuplt on 16-3-10.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  myPoint3;
@protocol myPoint3Delegate<NSObject>
@optional
-(void)point3Read:(myPoint3 *)myP andNumbers:(NSString *)strNum;
@end


@interface myPoint3 : UIView

@property (nonatomic,weak) IBOutlet id<myPoint3Delegate> delegate;


@end
