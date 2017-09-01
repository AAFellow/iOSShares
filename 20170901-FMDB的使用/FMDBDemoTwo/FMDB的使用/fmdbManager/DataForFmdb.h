//
//  DataForFmdb.h
//  FMDB的使用
//
//  Created by fuYanan on 17/8/29.
//  Copyright © 2017年 fuYanan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>
#import "StudentFMDBModel.h"
@interface DataForFmdb : NSObject

@property (nonatomic, strong) FMDatabase *fmdbBase;

+ (instancetype)sharedDataBase;
- (void)addStudent:(StudentFMDBModel*)student;
- (NSMutableArray*)getAllStudent;
- (NSMutableArray *)getAllClass;
- (void)updateStudent:(StudentFMDBModel*)student;
- (void)addClass:(StudentClassModel*)clas toStudent:(StudentFMDBModel*)student;
- (void)updateParameterDic;//参数为字典
- (void)deleteAllStudent;//删除student上的所有数据
- (void)deleteStudent:(StudentFMDBModel*)student;

@end
