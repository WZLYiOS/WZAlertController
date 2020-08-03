//
//  ocViewController.m
//  WZAlertController_Example
//
//  Created by qiuqixiang on 2020/4/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

#import "ocViewController.h"
#import <WZAlertController-Swift.h>

@interface ocViewController ()

@end

@implementation ocViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIAlertController wz_ocShowWithTitle:@"xaxa" message:@"xxxx" attributedMessage:nil textAlignment:<#(NSTextAlignment)#> preferredStyle:<#(enum UIAlertControllerStyle)#> cancelAction:<#(NSString * _Nullable)#> actions:<#(NSArray<NSString *> * _Nullable)#> tintColor:<#(UIColor * _Nullable)#> handler:<#^(NSString * _Nonnull, NSInteger)handler#>
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
