//
//  Student.h
//  testAf
//
//  Created by 晓磊 on 2017/7/6.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^Study)();
@interface Student : NSObject
@property (copy , nonatomic) NSString *name;
@property (copy , nonatomic) Study study;
@end
