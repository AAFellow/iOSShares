//
//  StudentFMDBModel.h
//  FMDB的使用
//
//  Created by fuYanan on 17/8/28.
//  Copyright © 2017年 fuYanan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentFMDBModel : NSObject

@property (nonatomic, assign) NSInteger      studentId;          // id
@property (nonatomic, copy)   NSString       *sName;       // 名字
@property (nonatomic, assign) NSInteger      sAge;         // 年龄
@property (nonatomic, strong) NSMutableArray *sClassArray; // 课程

@end


@interface StudentClassModel : NSObject

@property (nonatomic, assign) NSInteger      sclassId;      // 所属学生ID
@property (nonatomic, strong) NSString       *className;   // 课程名字

@end
