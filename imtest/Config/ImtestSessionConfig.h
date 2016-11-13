//
//  ImtestSessionConfig.h
//  imtest
//
//  Created by XuBill on 2016/11/13.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NIMSessionConfig.h"

typedef NS_ENUM(NSInteger, ImtestSMediaButton)
{
     CMBSMediaButtonPicture = 0,    //相册
     CMBSMediaButtonShoot,          //拍摄
     CMBSMediaButtonLocation,       //位置
     CMBSMediaButtonJanKenPon,      //石头剪刀布
     CMBSMediaButtonVideoChat,      //视频语音通话
     CMBSMediaButtonAudioChat,      //免费通话
     CMBSMediaButtonFileTrans,      //文件传输
     CMBSMediaButtonSnapchat,       //阅后即焚
     CMBSMediaButtonWhiteBoard,     //白板沟通
     CMBSMediaButtonTip,            //提醒消息
};

@interface ImtestSessionConfig : NSObject<NIMSessionConfig>
@property (nonatomic,strong)    NIMSession *session;

@end
