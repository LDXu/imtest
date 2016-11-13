//
//  CMBSessionConfig.m
//  imtest
//
//  Created by XuBill on 2016/11/13.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "ImtestSessionConfig.h"

@implementation ImtestSessionConfig

- (NSArray *)mediaItems
{
    return @[[NIMMediaItem item:CMBSMediaButtonPicture
                    normalImage:[UIImage imageNamed:@"bk_media_picture_normal"]
                  selectedImage:[UIImage imageNamed:@"bk_media_picture_nomal_pressed"]
                          title:@"相册"],
             
             [NIMMediaItem item:CMBSMediaButtonShoot
                    normalImage:[UIImage imageNamed:@"bk_media_shoot_normal"]
                  selectedImage:[UIImage imageNamed:@"bk_media_shoot_pressed"]
                          title:@"拍摄"],
             
             [NIMMediaItem item:CMBSMediaButtonLocation
                    normalImage:[UIImage imageNamed:@"bk_media_position_normal"]
                  selectedImage:[UIImage imageNamed:@"bk_media_position_pressed"]
                          title:@"位置"],
             
             [NIMMediaItem item:CMBSMediaButtonJanKenPon
                    normalImage:[UIImage imageNamed:@"icon_jankenpon_normal"]
                  selectedImage:[UIImage imageNamed:@"icon_jankenpon_pressed"]
                          title:@"石头剪刀布"],
             
             [NIMMediaItem item:CMBSMediaButtonAudioChat
                    normalImage:[UIImage imageNamed:@"btn_media_telphone_message_normal"]
                  selectedImage:[UIImage imageNamed:@"btn_media_telphone_message_pressed"]
                          title:@"实时语音"],
             
             [NIMMediaItem item:CMBSMediaButtonVideoChat
                    normalImage:[UIImage imageNamed:@"btn_bk_media_video_chat_normal"]
                  selectedImage:[UIImage imageNamed:@"btn_bk_media_video_chat_pressed"]
                          title:@"视频聊天"],
             
             [NIMMediaItem item:CMBSMediaButtonFileTrans
                    normalImage:[UIImage imageNamed:@"icon_file_trans_normal"]
                  selectedImage:[UIImage imageNamed:@"icon_file_trans_pressed"]
                          title:@"文件传输"],
             
             [NIMMediaItem item:CMBSMediaButtonSnapchat
                    normalImage:[UIImage imageNamed:@"bk_media_snap_normal"]
                  selectedImage:[UIImage imageNamed:@"bk_media_snap_pressed"]
                          title:@"阅后即焚"],
             
             [NIMMediaItem item:CMBSMediaButtonWhiteBoard
                    normalImage:[UIImage imageNamed:@"btn_whiteboard_invite_normal"]
                  selectedImage:[UIImage imageNamed:@"btn_whiteboard_invite_pressed"]
                          title:@"白板"],
             
             [NIMMediaItem item:CMBSMediaButtonTip
                    normalImage:[UIImage imageNamed:@"bk_media_tip_normal"]
                  selectedImage:[UIImage imageNamed:@"bk_media_tip_pressed"]
                          title:@"提醒消息"]];
    
    
}



- (BOOL)shouldHideItem:(NIMMediaItem *)item
{
    BOOL hidden = NO;
    BOOL isMe   = _session.sessionType == NIMSessionTypeP2P
    && [_session.sessionId isEqualToString:[[NIMSDK sharedSDK].loginManager currentAccount]];
    if (_session.sessionType == NIMSessionTypeTeam || isMe) {
        hidden = item.tag == CMBSMediaButtonAudioChat ||
        item.tag == CMBSMediaButtonVideoChat ||
        item.tag == CMBSMediaButtonWhiteBoard||
        item.tag == CMBSMediaButtonSnapchat;
    }
    return hidden;
}


- (id<NIMCellLayoutConfig>)layoutConfigWithMessage:(NIMMessage *)message{
    id<NIMCellLayoutConfig> config;
    return config;
}

- (BOOL)disableProximityMonitor{
    return NO;
}


- (BOOL)shouldHandleReceipt{
    return YES;
}

- (BOOL)shouldHandleReceiptForMessage:(NIMMessage *)message
{
    //文字，语音，图片，视频，文件，地址位置和自定义消息都支持已读回执，其他的不支持
    NIMMessageType type = message.messageType;
    
    return type == NIMMessageTypeText ||
    type == NIMMessageTypeAudio ||
    type == NIMMessageTypeImage ||
    type == NIMMessageTypeVideo ||
    type == NIMMessageTypeFile ||
    type == NIMMessageTypeLocation ||
    type == NIMMessageTypeCustom;
}

- (NIMAudioType)recordType
{
    return  NIMAudioTypeAMR ;
}


@end
