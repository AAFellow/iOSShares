//
//  LBSsendCDataInterface.h
//  AAyongche4.0_mainline
//
//  Created by 邵波 on 14-9-10.
//  Copyright (c) 2014年 邵波. All rights reserved.
//
typedef enum{
    LBS_enter,
    LBS_poi,
    LBS_driverTrajectory,//司机轨迹
}lbsRequestInterface;

#import <Foundation/Foundation.h>

@interface LBSsendCDataInterface : NSObject
+(NSString *)lbsRequestInterfaceWithFun:(lbsRequestInterface)interface;
@end
