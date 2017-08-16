//
//  Student.h
//  FMDBDemo
//
//  Created by fuYanan on 17/6/22.
//  Copyright © 2017年 fuYanan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject <NSCoding>
@property (nonatomic,copy)NSString *name;

@property (nonatomic,assign)int age;
//1.我们要将自定义对象转化为二进制流 并写入沙盒 我们要进行以下操作
//2.创建一个归档对象
//NSKeyedArchiver *archive = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];

@end
