//
//  SendDataInterface.m
//  AAyongche
//
//  Created by  邵波 on 14-2-11.
//  Copyright (c) 2014年  邵波. All rights reserved.
//

#import "SendDataInterface.h"
#import "Interface_Define.h"

@implementation SendDataInterface
+(NSString *)requestInterfaceWithFun:(requestInterface)interface{
    NSString * interfaceStr = Nil;
    switch (interface) {
        case AA_services:
            interfaceStr = Services_URL;
            break;
        case AA_cities:
            interfaceStr = CityList_URL;
            break;
        case AA_cars:
            interfaceStr = Cars_URL;
            break;
        case AA_aircars:
            interfaceStr =AirCars_URL;
            break;
        case AA_airports:
            interfaceStr = Airports_URL;
            break;
        case AA_login:
            interfaceStr = Login_URL;
            break;
        case AA_contacts:
            interfaceStr = Contacts_URL;
            break;
        case AA_current_orders:
            interfaceStr = All_Orders_URL;
            break;
        case AA_finish_orders:
            interfaceStr = Finish_Orders_URL;
            break;
        case AA_company_orders:
            interfaceStr = Company_Orders_URL;
            break;
        case AA_concle_order:
            interfaceStr = Concle_Orders_ULR;
            break;
        case AA_going_orders:
            interfaceStr = Going_Orders_URL;
            break;
        case AA_orderToken:
            interfaceStr = OrderToken_URL;
            break;
        case AA_makeOrder:
            interfaceStr = MakeOrder_URL;
            break;
        case AA_personShow:
            interfaceStr = PersonalShow_URL;
            break;
        case AA_pick:
            interfaceStr = Pick_URL;
            break;
        case AA_orderDetial:
            interfaceStr = OredrDetial_URL;
            break;
        case AA_babySubmitOrder:
            interfaceStr = BabySubmitOrder_URL;
            break;
        case AA_checkCode:
            interfaceStr = CheckCode_URL;
            break;
        case AA_checkPhone:
            interfaceStr = CheckPhone_URL;
            break;
        case AA_fast_register:
            interfaceStr =FastRegister_URL;
            break;
        case AA_changePassword:
            interfaceStr = ChangePassword_URL;
            break;
        case AA_passengerUpdate:
            interfaceStr = PassengerUpdate_URL;
            break;
        case AA_alipay:
            interfaceStr = Alipay_URL;
            break;
        case AA_alipayWeb:
            interfaceStr = AlipayWeb_URL;
            break;
        case AA_UPMPpay:
            interfaceStr = UPMPpay_URL;
            break;
        case AA_ucfPay:
            interfaceStr = UCFCard_URL;
            break;
        case AA_paypal:
            interfaceStr = Paypal_URL;
            break;
        case AA_historyAdress:
            interfaceStr = History_Address_URL;
            break;
        case AA_invoiceList:
            interfaceStr = Invoice_URL;
            break;
        case AA_invoiceShow:
            interfaceStr = InvoiceShow_URL;
            break;
        case AA_invoiceSubmit:
            interfaceStr = InvoiceSubmit_URL;
            break;
        case AA_invoiceCheck:
            interfaceStr=InvoiceCheck_URL;
            break;
        case AA_complainSubmit:
            interfaceStr = ComplainSubmit_URL;
            break;
        case AA_driverScore:
            interfaceStr =OrderGrade_URL;
            break;
        case AA_location_driver:
            interfaceStr = Driver_Location_URL;
            break;
        case AA_XFPay_bind:
            interfaceStr = XFpay_Bind_URL;
            break;
        case AA_XFPay_unbind:
            interfaceStr = XFpay_Unbind_URL;
            break;
        case AA_XFPay_boundcard:
            interfaceStr = XFpay_Boundcard_URL;
            break;
        case AA_Vacher:
            interfaceStr =Vacher_Pay_URL;
            break;
        case AA_CouponAvailable:
            interfaceStr = CouponAvailable_URL;
            break;
        case AA_CouponIsreceived:
            interfaceStr = CouponIsreceived_URL;
            break;
        case AA_CouponExchange:
            interfaceStr = CouponExchange_URL;
            break;
        case AA_shareText:
            interfaceStr = ShareText_URL;
            break;
        case AA_PassengerCouponList:
            interfaceStr = PassengerCouponList_URL;
            break;
        case AA_CouponActivity:
            interfaceStr = CouponActivity_URL;
            break;
        case AA_CouponRecieve:
            interfaceStr = CouponRecieve_URL;
            break;
        case AA_CouponShow:
            interfaceStr = CouponShow_URL;
            break;
        case AA_forgetPassword:
            interfaceStr = ForgetPassword_URL;
            break;
        case AA_orderIndicator:
            interfaceStr = OrderIndicator_URL;
            break;
        case AA_CommonVersion:
            interfaceStr = CommonVersion_URL;
            break;
        case AA_instructions:
            interfaceStr = Instructions_URL;
            break;
        case AA_baidu_push:
            interfaceStr = BaiduPushBind_URL;
            break;
        case AA_driverList:
            interfaceStr = Nearby_DriverList_URL;
            break;
        case AA_promo_screen:
            interfaceStr = PromoScreen_URL;
            break;
        case AA_Paylist:
            interfaceStr = Paylist_URL;
            break;
        case AA_FeedBack:
            interfaceStr = FeedBack_URL;
            break;
        case AA_Getgift:
            interfaceStr = Getgift_URL;
            break;
        case AA_GetgiftAmount:
            interfaceStr = GetgiftAmount_URL;
            break;
        case AA_InvoiceHistor:
            interfaceStr =InvoiceHistor_URL;
            break;
        case AA_orderView:
            interfaceStr = OrderView_URL;
            break;
        case AA_GetIMId:
            interfaceStr = GetImId_URL;
            break;
        case AA_GetIMDriver:
            interfaceStr=GetImDriver_URL;
            break;
        case AA_PriceList:
            interfaceStr = Price_list_URL;
            break;
        case AA_weixinPay:
            interfaceStr = WeixinPay_URL;
            break;
        case AA_orderAd:
            interfaceStr = OrderAd_URL;
            break;
        case AA_NavigationCommon:
            interfaceStr =NavigationCommon_URL;
            break;
        case AA_getSpeachCode:
            interfaceStr=SpeachCode_URL;
            break;
        case AA_ChagerType:
            interfaceStr=ChargeType_URL;
            break;
        case AA_NowCoupn:
            interfaceStr=GetNowCoupn_URL;
            break;
        case AA_CommonAddressShow:
            interfaceStr=CommonAddressShow_URL;
            break;
        case AA_CommonAddressEdit:
            interfaceStr=CommonAddressEdit_URL;
            break;
        case AA_CommonAddressDelete:
            interfaceStr = CommonAddressDelete_URL;
            break;
        case AA_getPrePrice:
            interfaceStr=GetPrePrice_URL;
            break;
        case AA_GetComplaints://获取投诉标签列表
            interfaceStr=GetOrderComplaints;
            break;
        case AA_OrderComplain:
            interfaceStr = OrderComplain;
            break;
        case AA_DriverCollectList:
            interfaceStr = GetCollectList_URL;
            break;
        case AA_DriverRefuseList:
            interfaceStr = GetRefuseList_URL;
            break;
        case AA_BlackDriver:
            interfaceStr = RefuseDriver_URL;
            break;
        case AA_CollectDricer:
            interfaceStr = CollectDriver_URL;
            break;
        case AA_FastOrderSetting:
            interfaceStr = FastOrderSetting_URL;
            break;
        case AA_ApplePay:
            interfaceStr = ApplePay_URL;
            break;
        case  AA_SoonMakeOrder:
            interfaceStr = SoonMakeOrder_URL;
            break;
        case AA_getColectDriverList:
            interfaceStr = GetCanSevericeDriverList_URL;
            break;
        case GetPassengerAppraiseList:
            interfaceStr = GetPassengerAppraise_URL;
            break;
        case GetOrderAppraiseList:
            interfaceStr = GetOrderAppraiseList_URL;
            break;
        case AA_CityCodeMatch:
             interfaceStr = GetCityCode_url;
            break;
        case AA_getDriverInfor:
            interfaceStr = DriverInfor_URL;
            break;
        case AA_ShareCoupon:
            interfaceStr = ShareOrderCoupon_URL;
            break;
        case AA_ShareTrip_URL:
            interfaceStr = AAShareTrip_URL;
            break;
        case AA_CheckOrder:
            interfaceStr=CheckCancelOrder_URL;
            break;
        case AA_EmergencyHelp:
            interfaceStr=EmergencyHelp_URL;
            break;
        case AA_CancelList:
            interfaceStr = AACancelList_URL;
            break;
        case AA_CancelReport:
            interfaceStr = AACancelReport_URL;
            break;
        case AA_PostRout:
              interfaceStr = AARoutPost_URL;
            break;
        case AA_ZHPay:
            interfaceStr = ZHPay_URL;
            break;
        case AA_SKinDownLoad:
            interfaceStr = AASkinDownLoad_URL;
            break;
        case AA_UpLoadUserLocation:
            interfaceStr=UpLoadUserLocation_URL;
            break;
        case AA_NewCreatOrder:
            interfaceStr=CreatOrder_URL;
            break;
        case AA_NewSoonCreatOrder:
            interfaceStr=NewSoonCreatOrder;
            break;
        case AA_SetID:
             interfaceStr=SetID_URL;
            break;
        case AA_SetMail:
             interfaceStr=SetMail_URL;
            break;
        case AA_getMailCode:
            interfaceStr=GetMailCode_URL;
            break;
        case AA_User_Check:
            interfaceStr = AAUserCheck_URL;
            break;
        case AA_SetPassWord:
            interfaceStr = AASetPsd_URL;
            break;
        case AA_SMSCode:
            interfaceStr = AASMSCode_URL;
            break;
        case AA_GetIDType:
            interfaceStr = AAGetIDtype_URL;
            break;
        case AA_GetSecurityWay:
            interfaceStr= AAGetSecurityway_URL;
            break;
        case AA_UserRegister:
            interfaceStr = AARegister_URL;
            break;
        case AA_UserLogin:
            interfaceStr = AAUserLogin_URL;
            break;
        case AA_UserForgetPsd_ID:
            interfaceStr = AAForgetPsd_Identify_URL;
            break;
        case AA_UserForgetPsd_Email:
            interfaceStr = AAForgetPsd_Email_URL;
            break;
        case AA_ModifyPsd:
            interfaceStr = AAModifyPsd_URL;
            break;
        case AA_SetWarnAgain:
            interfaceStr=AASetWarnAgain_URL;
            break;
        case AA_PreferenceSet:
            interfaceStr = AAPreferenceSet_URL;
            break;
        case AA_SetOffAdress:
            interfaceStr=AASetOffAdress_URL;
            break;
        case AA_UserCheckPhone:
            interfaceStr=AAUserCheckPhone;
            break;
        case AA_NoticeList:
            interfaceStr = AANoticeList_URL;
            break;
        case AA_Notice_SetRead:
            interfaceStr = AANotice_SetRead_URL;
            break;
        case AA_Notice_SetDelete:
            interfaceStr = AANotice_SetDelete_URL;
            break;
        case AA_User_Logout:
            interfaceStr = AAUser_Logout_URL;
            break;
        case AA_UserPsdLogin:
            interfaceStr = AAUser_PsdLogin_URL;
            break;
        case AA_User_VipList:
            interfaceStr = AAUser_VIPList_URL;
            break;
        case AA_UserCard_Unbind:
            interfaceStr = AA_UserCardUnbind_URL;
            break;
        case AA_KQ_VerifyCardInfo:
            interfaceStr = AA_KQVerifyCard_URL;
            break;
        case AA_UserCard_Bind:
            interfaceStr = AA_UserCardBind_URL;
            break;
        case AA_SignIn_IM:
            interfaceStr = AA_SignInIM_URL;
            break;
        default:
            break;
    }
    return interfaceStr;
}


+(NSString *)requestHtmlStringWithUrl:(NSString *)htmUrl{
    NSString * str = nil;
//    if (htmUrl&&htmUrl.length>0) {
//        NSArray * arr = [htmUrl componentsSeparatedByString:@"."];
//        NSString * lastName = nil;
//        if (arr&&arr.count==2) {
//            NSString * nameStr = [arr objectAtIndex:0];
//            lastName = [NSString stringWithFormat:@"%@_%@",nameStr,GETSERVICELANGUAGE];
//            NSString * ip = [Request_API stringByReplacingOccurrencesOfString:@"v3/" withString:@""];
//            str = [NSString stringWithFormat:@"%@agreement/%@.%@",ip,lastName,[arr objectAtIndex:1]];
//            
//            DLog(@"访问网页：%@",str);
//        }else{
//            DLog(@"错误url");
//        }
//    }
    return str;
}
+(NSString *)activityHtmlStringWithFile:(NSString *)fileName{
    NSString * str = nil;
//    NSString * ip = [Request_API stringByReplacingOccurrencesOfString:@"v3/" withString:@""];
//    str = [NSString stringWithFormat:@"%@agreement/%@?app_language=%@",ip,fileName,GETSERVICELANGUAGE];
    return str;
}
//新h5域名
+ (NSString *)htmlStringWithFile:(NSString *)fileName {
    NSString * str = nil;
    str = [NSString stringWithFormat:@"%@/%@",H5Request_API,fileName];
    return str;
}
+ (NSString *)htmlPriceRulStringWithService:(NSString *)service Level:(NSString*)level type:(NSString *)type{
    NSString * str = nil;
    str = [NSString stringWithFormat:@"%@rule/list?service_type=%@&service_id=%@&level_id=%@",H5Request_API,type,service,level];
    return str;

}

@end
