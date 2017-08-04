//
//  LBSsendCDataInterface.m
//  AAyongche4.0_mainline
//
//  Created by 邵波 on 14-9-10.
//  Copyright (c) 2014年 邵波. All rights reserved.
//

#import "LBSsendCDataInterface.h"
#import "Interface_Define.h"

@implementation LBSsendCDataInterface
+(NSString *)lbsRequestInterfaceWithFun:(lbsRequestInterface)interface;{
    NSString * interfaceStr = nil;
    switch (interface) {
        case LBS_enter:
            interfaceStr = LBS_Enter;
            break;
        case LBS_poi:
            interfaceStr = LBS_POI;
            break;
        case LBS_driverTrajectory:
            interfaceStr = LBS_DriverTrajectory_POI;
            break;
        default:
            break;
    }
    return interfaceStr;
}
@end
