//
//  ViewController2.m
//  UI_scrawl_01
//
//  Created by scuplt on 16-3-10.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "ViewController2.h"
#import "myPoint2.h"
#import "MBProgressHUD+MJ.h"
#import "UIImage+myScreen.h"
@interface ViewController2 ()
- (IBAction)Clear;
- (IBAction)Back;
- (IBAction)SavePic;
@property (weak, nonatomic) IBOutlet myPoint2 *myPoint_view;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)Clear {
    [self.myPoint_view Clear];
}

- (IBAction)Back {
      [self.myPoint_view ReturnBack];
}

- (IBAction)SavePic {
UIImage *img_pic=    [UIImage captureWithView:self.myPoint_view];
    UIImageWriteToSavedPhotosAlbum(img_pic, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if(error==nil){
        [MBProgressHUD showSuccess:@"保存成功"];
    }
    else {
        [MBProgressHUD showError:@"失败"];
    }
}
@end
