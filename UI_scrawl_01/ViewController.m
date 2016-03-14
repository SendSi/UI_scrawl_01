//
//  ViewController.m
//  UI_scrawl_01
//
//  Created by scuplt on 16-3-9.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "ViewController.h"
#import "myPoint.h"
#import "UIImage+myScreen.h"
#import "MBProgressHUD+MJ.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet myPoint *viewOptions;

- (IBAction)ClickClear;
- (IBAction)ClickLastOption;
- (IBAction)ClickSavePic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)ClickClear {
    [self.viewOptions clear];
}

- (IBAction)ClickLastOption {
    [self.viewOptions lastOperation];
}

- (IBAction)ClickSavePic {
    UIImage *i_mage=[UIImage captureWithView:self.viewOptions];
    UIImageWriteToSavedPhotosAlbum(i_mage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if(error){
        [MBProgressHUD showError:@"保存失败"];
    }
    else {
        [MBProgressHUD showSuccess:@"成功保存"];
    
    }
}

@end





















