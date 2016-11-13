//
//  ViewController.m
//  imtest
//
//  Created by XuBill on 2016/11/13.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "NIMSDK.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(id)sender {
    
    LoginViewController *vc = [[LoginViewController alloc] init];
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
    
}

- (IBAction)out:(id)sender {
    
    [[[NIMSDK sharedSDK] loginManager]  logout:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@",error);
        }else{
            NSLog(@"登出成功 --- %@ ",[[[NIMSDK sharedSDK] loginManager] currentAccount]);
            [self dismissViewControllerAnimated:YES completion:nil];
        }

    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
