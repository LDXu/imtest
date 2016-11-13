//
//  ImtestSessionConfig.m
//  imtest
//
//  Created by XuBill on 2016/11/13.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "ImtestChatroomConfig.h"
#import "NTESChatroomCellLayoutConfig.h"

@implementation ImtestChatroomConfig

- (NSArray<NSNumber *> *)inputBarItemTypes{
    return @[
             @(NIMInputBarItemTypeTextAndRecord),
             @(NIMInputBarItemTypeEmoticon)
             ];
}

- (NSArray<NIMMediaItem *> *)mediaItems{
    return nil;
}

- (BOOL)disableCharlet{
    return YES;
}


- (BOOL)autoFetchWhenOpenSession
{
    return YES;
}
- (BOOL)shouldHandleReceipt
{
    return YES;
}



- (id<NIMCellLayoutConfig>)layoutConfigWithMessage:(NIMMessage *)message{
    return [NTESChatroomCellLayoutConfig new];
}

- (BOOL)shouldHandleReceiptForMessage:(NIMMessage *)message
{
    //文字，语音，图片，视频，文件，地址位置和自定义消息都支持已读回执，其他的不支持
    return YES;
}
@end
