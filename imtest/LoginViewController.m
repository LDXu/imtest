//
//  LoginViewController.m
//  imtest
//
//  Created by XuBill on 2016/11/13.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "LoginViewController.h"
#import "NIMSDK.h"
#import "RoomViewController.h"
@interface LoginViewController ()
{
    BOOL logined;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtn:(id)sender {
    
    if(logined){
        [self dismiss];
        return;
    }
    
    [[[NIMSDK sharedSDK] loginManager] login:@"test1"
                                       token:@"test123"
                                  completion:^(NSError *error) {
                                      if (error) {
                                                          NSLog(@"%@",error);
                                                      }else{
                                                          NSLog(@"登入成功 --- %@ ",[[[NIMSDK sharedSDK] loginManager] currentAccount]);
                                                          logined = YES;
                                                          [self pushToRoom];
                                                      }
                  
                                  
                                  }];
    
}

-(void)pushToRoom{
    NIMChatroomEnterRequest *request = [[NIMChatroomEnterRequest alloc] init];
    request.roomId =@"10590811";
    // 获取用户昵称  进入聊天室显示
    NSString *userName =@"imtest";
    request.roomNickname =  userName ? userName : @"";
    [[[NIMSDK sharedSDK] chatroomManager ]enterChatroom:request completion:^(NSError * _Nullable error, NIMChatroom * _Nullable chatroom, NIMChatroomMember * _Nullable me) {
        if (error) {
            NSLog(@"error-%@",error);
            return ;
        }

        RoomViewController  *vc = [[RoomViewController alloc]initWithChatroom:chatroom];
        [self.navigationController pushViewController:vc animated:YES];
    }];

}

-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
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
