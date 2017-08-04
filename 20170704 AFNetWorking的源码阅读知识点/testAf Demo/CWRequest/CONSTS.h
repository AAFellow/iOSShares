//
//  CONSTS.h
//  BMSMerchant
//
//  Created by Admin on 14-6-12.
//  Copyright (c) 2014年 chenmingguo. All rights reserved.
//

#ifndef BMSMerchant_CONSTS_h
#define BMSMerchant_CONSTS_h
#import "AppDelegate.h"
#import "UIColor+helper.h"
#import "MobilePhoneNumberJudgment.h"
/********************************************高德地图以及新浪微博腾讯微信的APPKey*************************************************/
//地图Key
#define GDMAP_KEY                                                               @"d94226f3556cbda7e5ea1a6588b25e68"
//新浪微博
#define Sina_kAppKey                                                            @"3316851925"
#define Sina_kRedirectURL                                                       @"https://openapi.baidu.com/social/oauth/2.0/receiver"
//腾讯AppID
#define QQ_kAppID                                                               @"1101147450"
//新的微信key以及ID
#define WeChat_kAppId                                                           @"wx4a7f4575b93c9b36"
#define WeChat_kAppKey                                                          @"0a82876b024df6254201cdc57bd73d40"
//ApplePay的唯一标识
#define ApplePay_MerchantID                                                     @"merchant.com.aachuxing.AAzuche"
//UnionPay_Scheme
#define UnionPay_Scheme                                                         @"aazuchecallback.aazuche"




/*********color***********/
#define ClearColor [UIColor clearColor]

//线条、cell、按钮点击颜色
#define LINECOLOR [UIColor colorWithString:@"#e5e5e5"]
//返回上一页的时间
#define POPViewTIME 1
//通用背景色
#define UniversalBackGround RGBALPHA(0xf0f0f0, 1)
//6.0提交确认按钮通用背景色
#define SUREBUTTONBACKGROUNDCOLOR [UIColor colorWithString:@"#101010"]
#define SUREBUTTONHIGHLIGHTEDBACKGROUNDCOLOR RGBALPHA(0x101010, 0.6)
//通用按钮不可点击颜色
#define SUREBUTTONDISABLECOLOR   LINECOLOR


/*********text***********/
//通用字体深色颜色
#define UNIVERSALTEXTCOLOR [UIColor colorWithString:@"#101010"]
//通用字体浅色颜色
#define UNIVERSALLIGHTTEXTCOLOR [UIColor colorWithString:@"#b4b4b4"]
//特殊的蓝色颜色
#define SPECIALTEXTCOLOR     RGBALPHA(0x1577cc, 1)
//透明度40%
#define ALPHASPECIALTEXTCOLOR RGBALPHA(0x1577cc, 0.4)





#define Text_Color [UIColor colorWithString:@"#3a3a3a"]


//手机号码校验
#define MOBILEPHONEJUDGMENT(phone) [MobilePhoneNumberJudgment isMobileNumber:phone]

/*********Systen********/
//#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//#define iPhone5 ([UIScreen mainScreen] .bounds.size.height>=568?YES:NO)
#define iPhone5 (([[UIScreen mainScreen] currentMode].size.height==1136||[[UIScreen mainScreen] currentMode].size.height==1704)?YES:NO)
//#define iPhone5 ([[UIScreen mainScreen] currentMode].size.height>=1136?YES:NO)
#define APP_SIZE [UIScreen mainScreen].bounds.size
#define APP_Width [UIScreen mainScreen].bounds.size.width
#define APP_Height [UIScreen mainScreen].bounds.size.height

#define iPhone6Plus ([[UIScreen mainScreen] currentMode].size.height>1136?YES:NO)
/***************字段宏****************/

#define ChecheAppVersionCode 2
//#define BMSBundleVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define APP_VERSION [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define APP_LAUNCHED_VERSION(version)  [NSString stringWithFormat:@"APP_LAUNCHED_VERSION_%@",version]

#define APP_YinDaoYe_VERSION  [NSString stringWithFormat:@"APP_YinDaoYe_VERSION_%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]]

#define AppName @"AA租车"

//版本下载
#define APP_Update_URL @"https://itunes.apple.com/us/app/aa-zu-che/id651392645?l=zh&ls=1&mt=8"
#define APP_Request_URL @"http://itunes.apple.com/lookup?id=651392645"
//版本更新
#define APP_DownLoad_URL @"https://itunes.apple.com/cn/app/aa-zu-che/id651392645?mt=8"
//评价APP
#define APP_EvaluateApp_URL @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=651392645"

//secret 用于签名
#define secrets @"client_secret"
#define secret_value @"kuFFegvfILTdOiBXdRohDktza80h2G2u"
#define AES_KEY @"NXFmQPiPMuchITFiNXFmQPiPMuchITFi"

#define secret_value_encrypt @"Y6SlxVoadIhIahZ7Ge/kzWDpBSTihJ+HdUERjB0fz+LAi3ZSsuosYYGqNxysnsS9GGoEo8sZZZifLVycnXwYDMYe63mIgAeZQsPmJ7B53MMB5vlmjb/nC7mFpcb2UYp3HtAjOMpe5ozHUjmkoH8GVI+WHNSqJ0DHUQ6I0RidBc8="


//屏幕与6的尺寸比
#define AutoScale (CGFloat)([UIScreen mainScreen].bounds.size.width/375.00)

#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...){}
#endif

#define is4InchScreen  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone4  (SCREEN_HEIGHT == 480)

#define APPDELEGATE         ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define APPWINDOW            (UIWindow *)(APPDELEGATE.window)


#define IOS_VERSION_CODE         [[[UIDevice currentDevice] systemVersion] intValue]
#define IOS_VERSION_CODE_FLOAT   [[[UIDevice currentDevice] systemVersion] floatValue]


#define IOSVersion_8		([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)


#pragma mark - font functions

#define UIFontSize(CGFloat) [UIFont systemFontOfSize:CGFloat]
#define UIBoldFontSize(CGFloat)  [UIFont boldSystemFontOfSize:CGFloat]


#pragma mark - color functions

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


#pragma mark - UIKit functions


#define ImageNamed(_pointer)                      [UIImage imageNamed:_pointer]
#define BundleImageNamed(_pointer)                [CommonHelp getImageByName:_pointer]


#define CANCELREQUEST_SAFELY(__POINTER)  { if(__POINTER) {[[AFHttpClient sharedInstance] cancelRequest:__POINTER];  __POINTER = nil; }}


#define NetWorkString(_string)                    [CommonHelp getStringFromNetWorKString:_string]

#define NetWorkDic(dic,keyString)                 [CommonHelp getStringFromNetWorkDic:dic key:keyString]


// 判断字符串是否有值
#define STRINGHASVALUE(str)		(str && [str isKindOfClass:[NSString class]] && [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0)

#pragma mark - Singleton(单例)

#define DATA_ENV     [DataEnvironment sharedDataEnvironment]


/*!
 @class
 @abstract 发通知
 */

#define PostNotificationNameAndObject(_name,_object)       [[NSNotificationCenter defaultCenter] postNotificationName:_name object:_object]
#define POST_NOTIFICATION_NAME(_name)        [[NSNotificationCenter defaultCenter] postNotificationName:_name object:nil]






typedef enum
{
    AAButtonStyleBack,                          //返回
    AAButtonStyleClose,                         //带返回文字
    AAButtonStyleNone,                          //没有返回
    AAButtonStylePersonInfo,                    //个人信息
    AAButtonStyleRightButtonSave,               //保存按钮
    AAButtonStyleRightButtonDone,               //完成按钮
    AAButtonStyleCoustomSevervice,              //客服咨询
    AAButtonStyleMustClose,                     //就是关闭字
    AAButtonStyleOrderCancel,                   //就是关闭字
    AAButtonStyleMustSure,                      //确定
    AAButtonStyleSelectAre,                     //原则地点
    AAButtonStylePop,                           //返回
    AAButtonStyleDismiss,                       //叉号
    AAButtonStyleMore,                          //更多功能

    AAButonStyleDetail                         //紧急求助，行程分享
} AAButtonStyle;

#endif
