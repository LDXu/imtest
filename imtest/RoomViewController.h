//
//  RoomViewController.h
//  imtest
//
//  Created by XuBill on 2016/11/13.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "NIMSessionViewController.h"

@interface RoomViewController : NIMSessionViewController
- (instancetype)initWithChatroom:(NIMChatroom *)chatroom;
@end
