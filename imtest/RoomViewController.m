//
//  RoomViewController.m
//  imtest
//
//  Created by XuBill on 2016/11/13.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "RoomViewController.h"
#import "ImtestChatroomConfig.h"
@interface RoomViewController ()<NIMInputDelegate>


@property (nonatomic,strong) NIMChatroom *chatroom;

@end

@implementation RoomViewController

- (instancetype)initWithChatroom:(NIMChatroom *)chatroom
{
    self = [super initWithSession:[NIMSession session:chatroom.roomId type:NIMSessionTypeChatroom]];
    if (self) {
        _chatroom = chatroom;
    }
    return self;
}


- (id<NIMSessionConfig>)sessionConfig{
    return [ImtestChatroomConfig new];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.layoutManager.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (void)sendMessage:(NIMMessage *)message{
    
    
    NSString * userName = @"imtest" ;
    if (userName == nil) {
        userName = @"";
    }
    
    message.remoteExt = @{@"type":@(NIMChatroomMemberTypeGuest),@"nickName":userName};
    
    [super sendMessage:message];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
