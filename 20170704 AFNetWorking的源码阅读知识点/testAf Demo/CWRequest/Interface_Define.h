//
//  Interface_Define.h
//  AAyongche
//
//  Created by  邵波 on 14-2-11.
//  Copyright (c) 2014年  邵波. All rights reserved.
//
/****develop***/

//#define testUrl @"http://test.aayongche.com/apiV2/service/service_list_json"


#define TESTENVIRONMENT @"environment"     //注掉就为线上环境
#ifdef TESTENVIRONMENT
#define Request_API @"https://yongchedev.aachuxing.com/v3/"
#define H5Request_API  @"http://h5test.aachuxing.com/"
#define IMAPP_Key    @"386b14a1d487dc57dd8c2249eaa05fc3"
#define IMPUSHCERName  @"ApplePushDevelop"
//#define Request_API @"https://yongchetest.aachuxing.com/v3/"// 16/03/15修改

#define LBS_URL @"http://lbstest.aachuxing.com"//测试

#define DEVELOPENVIRONMENT          1

#else

#define Request_API @"https://yongche.aachuxing.com/v3/"  //线上发布
#define H5Request_API  @"http://web.aachuxing.com/"

#define LBS_URL @"http://nest.aayongche.com/"//LBS线上域名
#define IMAPP_Key    @"386b14a1d487dc57dd8c2249eaa05fc3"
#define IMPUSHCERName  @"ApplePushDis"
#define DEVELOPENVIRONMENT          0


#endif

/* interface define */
#define OrderIndicator_URL @"order/status/indicator"//首页轮循


#define  CityList_URL @"resource/cities"//城市列表
#define  Services_URL @"resource/services"//服务类型
#define  Airports_URL @"resource/city/airports"//机场列表
#define  AirCars_URL @"resource/airport_cars"//接送机车型列表
#define  Cars_URL  @"resource/cars"  //获取车辆类型
#define  FastRegister_URL @"passenger/fast_register"//快速注册
#define  Login_URL @"passenger/login"//登录接口
#define  Contacts_URL @"passenger/contacts"//常用乘车人
#define  CheckCode_URL @"common/check_code"//获取短信验证码
#define  CheckPhone_URL @"common/check/phone"//手机号码检测
#define  ChangePassword_URL @"passenger/password/update"//修改密码
#define  ForgetPassword_URL @"passenger/password/forget"//忘记密码
#define  PassengerUpdate_URL @"passenger/update"//个人资料更新
#define  Invoice_URL @"resource/invoices"//发票类型
#define  InvoiceShow_URL @"passenger/invoice/show"//发票信息
#define  InvoiceSubmit_URL @"passenger/invoice/create"//提交发票
#define  InvoiceCheck_URL   @"passenger/invoice/check"//发票检查
#define  ComplainSubmit_URL @"passenger/feedback/create"//投诉建议
#define  InvoiceHistor_URL @"passenger/invoice/history"//发票历史
#define  OrderGrade_URL @"order/grade"//订单评分
#define  GetOrderComplaints @"passenger/complaints"//获取投诉列表标签
#define  OrderComplain      @"order/complain"//订单投诉

#define  Finish_Orders_URL @"order/passenger/complete"//历史订单列表
#define  Going_Orders_URL @"order/passenger/going"//进行订单列表
#define  All_Orders_URL @"order/passenger/current"//所有订单
#define  Company_Orders_URL @"order/passenger/company"//公务单
#define  Concle_Orders_ULR @"order/cancel/user"//取消订单
//#define  Offec_Adress_URL @"passenger/locations"//历史地址
#define  History_Address_URL @"passenger/addresses_history"//历史地址
#define  Driver_Location_URL @"order/status"//获取司机位置
#define  Nearby_DriverList_URL @"resource/nearby_driver_list"//附近司机列表

#define  PassengerCouponList_URL @"coupon/passenger"//乘客已领取的优惠券列表
#define  CouponActivity_URL @"coupon/active"//优惠券活动列表
#define  CouponShow_URL @"coupon/show"//优惠券详情
#define  CouponRecieve_URL @"coupon/receive"//领取优惠券
#define  CouponAvailable_URL @"coupon/available"//根据服务获取可用优惠券
#define  CouponIsreceived_URL @"coupon/isreceived"//检查用户是否已经领取过某优惠券
#define  CouponExchange_URL @"coupon/exchange"//优惠码领取优惠券

#define  OrderToken_URL   @"order/token"//下单许可token
#define  MakeOrder_URL    @"order"      //下单
#define SoonMakeOrder_URL @"order_soon" //快捷下单
#define  NewSoonCreatOrder @"order_soon/create"//5.8以后快捷下单
#define  Pick_URL            @"resource/pick" //宝贝上学获取车型列表和附加服务
#define  OredrDetial_URL     @"order/show"    //订单详情
#define  BabySubmitOrder_URL @"order/pick"    //宝贝上学下单
#define DriverInfor_URL       @"order/driver_info"   //获取司机车辆信息        
#define CheckCancelOrder_URL @"order/cancel_check"               //取消订单收费
#define EmergencyHelp_URL    @"order/passenger/help_me" //紧急求助
#define UpLoadUserLocation_URL @"order/upload"//上传用户位置
#define CreatOrder_URL   @"order/create"//生成订单


#define  WeixinPay_URL  @"pay/weixin/pay" //微信充值
#define  AlipayWeb_URL  @"pay/alipay/web"//支付宝网页版充值
#define  Alipay_URL     @"pay/alipay"    //支付宝插件充值
#define  UPMPpay_URL    @"pay/upmp"       //银联充值
#define  Vacher_Pay_URL @"pay/voucher"    //代金券充值
#define  UCFCard_URL    @"pay/ucfcard"    //车卡充值
//#define  PaymentAsia_URL @"pay/paymentasia"//paymentAsia支付
#define  XFpay_Bind_URL      @"pay/ucf/bind"     //先锋支付   绑定信用卡
#define  XFpay_Unbind_URL    @"pay/ucf/unbind"   //先锋支付   解绑信用卡
#define  XFpay_Boundcard_URL @"pay/ucf/boundcard"//先锋支付请求绑定信用卡
#define Paypal_URL           @"pay/paypal"
#define  Price_list_URL      @"pay/amount_list"



#define ShareText_URL        @"resource/share"             //分享文案

#define CommonVersion_URL    @"common/version"             //版本检测
#define Instructions_URL     @"order/status/indicator"     //指示器

#define BaiduPushBind_URL    @"push/baidu/bind"            //百度推送绑定
#define PromoScreen_URL      @"common/promo_screen"        //广告页
#define Paylist_URL          @"pay/paylist"                //充值历史记录
#define FeedBack_URL         @"passenger/feedback/create"  //意见反馈
#define Getgift_URL          @"gift/get_gift"              //询问是否又红包
#define GetgiftAmount_URL    @"gift/get_gift_amount"       //金额
#define GetImId_URL          @"passenger/getImConnect"     //获取Imid
#define GetImDriver_URL      @"passenger/getMsgFromGroupId"//grouopId获取司机信息

#define OrderView_URL        @"order/view"                 //下单前检测是否有加价提示

#define OrderAd_URL          @"order/ad"                   //广告接口

#define NavigationCommon_URL @"passenger/navigation_common"//标签信息


#define CommonAddressShow_URL     @"passenger/addresses"
#define CommonAddressEdit_URL     @"passenger/address/edit"       //编辑常用地址
#define CommonAddressDelete_URL   @"passenger/address/delete"     //删除常用地址
#define FastLogin_URL             @"passenger/fast_login"         //验证码登录
#define ChargeType_URL            @"pay/pay_method"               //支付方式排序
#define GetNowCoupn_URL           @"coupons/auto_selected_coupons"//自动选择优惠券
#define GetPrePrice_URL           @"order/service/estimate"       //预估里程价格
#define GetPassengerAppraise_URL  @"passenger/appraise"           //获取需要显示的评价列表
#define GetOrderAppraiseList_URL  @"order/appraise"     //获取需要弹出的待评价订单
#define GetCityCode_url           @"resource/map_mapping"//获取citycode对照表
/*********************************************5.2*********************************************************/
#define GetCollectList_URL              @"passenger/collect_list"    //新增收藏司机列表接口
#define GetRefuseList_URL               @"passenger/refuse_list"     //新增拉黑司机列表接口
#define RefuseDriver_URL                @"passenger/refuse"          //批量拉黑/解除拉黑司机
#define CollectDriver_URL               @"passenger/collect"         //批量收藏/取消收藏司机
#define FastOrderSetting_URL            @"passenger/fast_order"      //一键来车快捷键设定
#define ApplePay_URL                    @"pay/applepay"              //苹果支付获取tn接口
#define GetCanSevericeDriverList_URL    @"passenger/driver_service"   //指派司机页面获取客服务收藏列表
/********************************************5.5**********************************************************/
#define ShareOrderCoupon_URL            @"appraise/createurl"         //分享订单得优惠券


/**********************************************5.6**************************************************************/
#define AAShareTrip_URL                 @"tripshare/createurl"//增加创建行程分享链接接口


/********************************************************5.7***********************************************************/
#define AACancelList_URL                @"order/cancel_list"
#define AACancelReport_URL              @"order/cancel_report"
#define AARoutPost_URL                    @"order/navigate_model"

/**********************************5.8****************/
#define ZHPay_URL   @"pay/cmb/cmbpay"
#define AASkinDownLoad_URL                  @"resource/skin"

/*****************************************5.8.1*********************************************/
#define AAUserCheck_URL                     @"user/check" //用户账号鉴别
#define AASetPsd_URL                        @"password/set"//设置密码
#define AASMSCode_URL                       @"code/sms"//短信验证码下发
#define AAGetIDtype_URL                     @"security/identity/list"//密保证件类型列表
#define AAGetSecurityway_URL                @"password/forget/list"//获取找回密码方式
#define AARegister_URL                      @"user/register"//用户注册
#define AAUserLogin_URL                     @"user/login"//用户登录
#define AAForgetPsd_Identify_URL            @"password/forget/identity"//通过身份证找回密码
#define AAForgetPsd_Email_URL               @"password/forget/email"//通过邮箱找回密码
#define  PersonalShow_URL                   @"user/show"//个人资料
#define SetID_URL           @"security/identity/set" //密保邮箱绑定及修改
#define  SetMail_URL         @"security/email/set"   //密保证件类型列表
#define  GetMailCode_URL    @"code/email"    //邮箱验证码下发
#define SpeachCode_URL            @"code/voice"   //获取语音验证码
#define AAModifyPsd_URL                 @"password/modify"//修改密码
#define AASetWarnAgain_URL       @"user/order/tips" //下单提示设定
#define AASetOffAdress_URL           @"order/add_to_address"//设置下车地址
#define AAUserCheckPhone           @"user/check_phone"//检测乘车人手机格式






/**************************************5.9*******************************************************/
#define AAPreferenceSet_URL             @"user/preference/set"//个人偏好设置
/**************************************5.10*******************************************************/
#define AANoticeList_URL                @"notice/list"//获取用户的消息列表
#define AANotice_SetRead_URL            @"notice/set/read"//批量标记已读消息
#define AANotice_SetDelete_URL          @"notice/set/delete"//批量删除用户消息
#define AAUser_Logout_URL               @"user/logout"//用户退出

/************************************5.13********************************************/
#define AA_UserCardUnbind_URL           @"user/card/unbind"//解绑信用卡
#define AA_KQVerifyCard_URL             @"kq/verifycard"//快钱-验证信用卡信息
#define AA_UserCardBind_URL             @"kq/bind"//绑定信用卡

/*****************************************6.0*****************************************************/
#define AAUser_PsdLogin_URL             @"user/password/login"//用户密码登录
#define AAUser_VIPList_URL              @"resource/permit"//会员权益
#define AA_SignInIM_URL                 @"user/netease/register"
/***********************LBS相关接口***********************/
//#define LBS_Request_API @"http://210.14.149.76:40012/"//测试
//#define LBS_Request_API @"http://nest.aayongche.com/"//测试

//接口
//#define LBS_Enter @"Enter_Service/v1/enter"//程序启动接口，LBS 线上
//#define LBS_Enter @"EnterServer/v1/enter"//LBS 测试



#define LBS_POI                  @"LBS_Service/v1/inverseGeography"//逆地理编码接口
#define LBS_DriverTrajectory_POI @"LBS_Service/v1/OrbitService"    //实时获取司机轨迹
#define LBS_Enter                @"Enter_Service/v1/enter"         //程序启动接口，LBS 线上

//#define LBS_DriverTrajectory_POI @"lbs/v1/OrbitService"


