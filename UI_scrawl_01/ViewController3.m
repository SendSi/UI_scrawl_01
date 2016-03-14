//
//  ViewController3.m
//  UI_scrawl_01
//
//  Created by scuplt on 16-3-10.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "ViewController3.h"
#import "myPoint3.h"
@interface ViewController3 ()<myPoint3Delegate>

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)point3Read:(myPoint3 *)myP andNumbers:(NSString *)strNum{
    NSLog(@"用户手势路径%@",strNum);
}


@end
