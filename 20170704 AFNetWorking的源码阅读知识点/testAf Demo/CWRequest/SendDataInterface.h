//
//  SendDataInterface.h
//  AAyongche
//
//  Created by  邵波 on 14-2-11.
//  Copyright (c) 2014年  邵波. All rights reserved.
//
typedef enum{
    AA_services,
    AA_cities,
    AA_cars,
    AA_aircars,
    AA_airports,
    AA_login,
    AA_checkPhone,
    AA_fast_register,
    AA_contacts,
    AA_forgetPassword,
    AA_current_orders,//全部
    AA_going_orders,//进行中
    AA_finish_orders,//历史订单
    AA_company_orders,//公务订单
    AA_location_driver,//获取司机位置
    AA_orderToken,
    AA_makeOrder,
    AA_SoonMakeOrder,
    AA_NewSoonCreatOrder,//5.8快捷下单
    AA_personShow,
    AA_pick,
    AA_orderDetial,//订单详情
    AA_concle_order,//取消订单
    AA_babySubmitOrder,
    AA_checkCode,
    AA_changePassword,
    AA_passengerUpdate,
    AA_alipay,
    AA_alipayWeb,
    AA_UPMPpay,
    AA_ucfPay,
    AA_paypal,
    AA_historyAdress,//历史地址
    AA_invoiceList,
    AA_invoiceShow,
    AA_invoiceSubmit,
    AA_invoiceCheck,
    AA_complainSubmit,//投诉建议
    AA_driverScore,//司机评分
    AA_XFPay_bind,
    AA_XFPay_unbind,
    AA_XFPay_boundcard,
    AA_CouponAvailable,
    AA_CouponIsreceived,
    AA_PassengerCouponList,
    AA_CouponActivity,
    AA_CouponShow,
    AA_CouponRecieve,
    AA_CouponExchange,
    AA_shareText,
    AA_orderIndicator,
    AA_CommonVersion,
    AA_instructions,
    AA_baidu_push,
    AA_Vacher,
    AA_driverList,
    AA_promo_screen,
    AA_Paylist,
    AA_FeedBack,
    AA_Getgift,
    AA_GetgiftAmount,
    AA_InvoiceHistor,
    AA_orderView,
    AA_GetIMId,
    AA_GetIMDriver,
    AA_PriceList,//充值金额列表
    AA_weixinPay,
    AA_orderAd,
    AA_NavigationCommon,
    AA_getSpeachCode,
    AA_ChagerType,//支付方式排序
    AA_NowCoupn,
    AA_CommonAddressShow,//查看常用地址
    AA_CommonAddressEdit,//编辑常用地址
    AA_CommonAddressDelete,//删除常用地址
    AA_getPrePrice,
    AA_GetComplaints,//获取订单投诉标识
    AA_OrderComplain,//订单投诉
    AA_getColectDriverList,//获取收藏司机列表
    AA_DriverCollectList,//收藏司机列表
    AA_DriverRefuseList,//拉黑司机列表
    AA_BlackDriver,//拉黑或者取消拉黑司机
    AA_CollectDricer,//收藏或者取消收藏司机
    AA_FastOrderSetting,//一键来车快捷键设定
    AA_ApplePay,//ApplePay支付
    GetPassengerAppraiseList,
    GetOrderAppraiseList,//获取需要弹出的待评价订单
    AA_CityCodeMatch,//获取adcode citycode对照表
    AA_getDriverInfor,//获取车辆司机信息
    AA_ShareCoupon,//分享得优惠券
    AA_AuthenticateRealName,//实名认证
    AA_ShareTrip_URL,
     AA_CheckOrder,//取消收费提示
    AA_EmergencyHelp,//紧急求助
    AA_CancelList,
    AA_CancelReport,
    AA_PostRout,//上次路线
    AA_ZHPay,//招行支付
    AA_SKinDownLoad,//客户端皮肤下载
    AA_UpLoadUserLocation,//上传客户位置
    AA_NewCreatOrder,//5.8版本以后生成订单接口
    AA_SetID,// 密保证件绑定及修改
    AA_SetMail,//密保邮箱绑定及修改
    AA_getMailCode,//邮箱验证码下发
    AA_User_Check,//用户账号鉴别
    AA_SetPassWord,//设置密码
    AA_SMSCode,//短信验证码
    AA_GetIDType,//密保证件类型列表
    AA_GetSecurityWay,//获取找回密码方式
    AA_UserRegister,//用户注册
    AA_UserLogin,//用户登录
    AA_UserPsdLogin,//用户密码登录
    AA_UserForgetPsd_ID,//根据身份证号找回密码
    AA_UserForgetPsd_Email,//根据邮箱找回密码
    AA_ModifyPsd,
    AA_SetWarnAgain,//是否提示下单充值
    AA_PreferenceSet,//用户偏好设定
    AA_SetOffAdress,//设置下车地址
    AA_UserCheckPhone,//检测乘车人手机号
    AA_NoticeList,//消息列表
    AA_Notice_SetRead,//标记消息已读
    AA_Notice_SetDelete,//标记消息删除
    AA_User_Logout,//用户退出
    AA_User_VipList,
    AA_UserCard_Unbind,//用户解绑信用卡
    AA_KQ_VerifyCardInfo,//验证信用卡信息
    AA_UserCard_Bind,
    AA_SignIn_IM// 注册IM接口
}requestInterface;
#import <Foundation/Foundation.h>

@interface SendDataInterface : NSObject
+(NSString *)requestInterfaceWithFun:(requestInterface)interface;
+(NSString *)requestHtmlStringWithUrl:(NSString *)htmUrl;
+(NSString *)activityHtmlStringWithFile:(NSString *)fileName;
+ (NSString *)htmlPriceRulStringWithService:(NSString *)service Level:(NSString*)level type:(NSString*)type;
//新的h5取取消规则
+ (NSString *)htmlStringWithFile:(NSString *)fileName;
@end
