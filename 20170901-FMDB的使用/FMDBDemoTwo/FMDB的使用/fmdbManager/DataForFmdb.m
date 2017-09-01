//
//  DataForFmdb.m
//  FMDB的使用
//
//  Created by fuYanan on 17/8/29.
//  Copyright © 2017年 fuYanan. All rights reserved.
//

#import "DataForFmdb.h"
@implementation DataForFmdb

static DataForFmdb *data = nil;

//创建FMDB单例全局共享
+ (instancetype)sharedDataBase {
    @synchronized (self) {
        if (!data) {
            data = [[DataForFmdb alloc] init];
            [data initDataBase];
        }
    }
    return data;
}

#pragma mark - Private

- (void)initDataBase {
    //获得Documents目录路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    //获取文件路径
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"student.db"];
    //实例化FMDataBase对象
    self.fmdbBase= [FMDatabase databaseWithPath:filePath];
    self.fmdbBase.shouldCacheStatements = YES;

    if([ self.fmdbBase open]) {
        //初始化数据表
        [self addStudentTable];
        [self addClassTable];
        [ self.fmdbBase close];
    } else {
        NSLog(@"数据库打开失败---%@",  self.fmdbBase.lastErrorMessage);
    }
}

#pragma mark - update

// 插入表格
- (void)addStudentTable {
    //SQL语句
    NSString *studentSQL =@"create table if not exists student (studentId integer, sName text, sAge integer, sClassArray  )";
    //创建表格
    BOOL studentSuccess = [self.fmdbBase executeUpdate:studentSQL];
    if(!studentSuccess) {
        NSLog(@"studentTable表格创建失败---%@",self.fmdbBase.lastErrorMessage);
    }
}

- (void)addClassTable {
    NSString*classSQL =@"create table if not exists class (sclassId integer, className text)";
    BOOL classSuccess = [self.fmdbBase executeUpdate:classSQL];
    if(!classSuccess) {
        NSLog(@"classTable创建失败---%@",self.fmdbBase.lastErrorMessage);
    }
}

// 添加
- (void)addStudent:(StudentFMDBModel*)student {
    [self.fmdbBase open];
    NSString *SQL = @"insert into student(studentId,sName,sAge) values(?,?,?)";
    BOOL isAddSuccess = [self.fmdbBase executeUpdate:SQL,
                         @(student.studentId),
                         student.sName,
                         @(student.sAge)];
    [self.fmdbBase close];
    if (isAddSuccess) {
        NSLog(@"studentTable插入信息成功");
    } else {
        NSLog(@"studentTable插入信息失败:%@",self.fmdbBase.lastErrorMessage);
    }
}

//给class表添加课程
- (void)addClass:(StudentClassModel*)clas toStudent:(StudentFMDBModel*)student {
    /**
       注意[self.fmdbBase executeUpdate:@"INSERT INTO myTable VALUES (?)", 42] 是错误的，
       [NSNumber numberWithInt:42] 参数必须是一个对象
        ? 在SQLite中表示占位符
    */
    [self.fmdbBase open];
    NSString *SQL = [NSString stringWithFormat:@"insert into class (sclassId, className) values (%ld,?)", student.studentId];
    BOOL isSuccess = [self.fmdbBase executeUpdate:SQL, clas.className];
    if(!isSuccess) {
        NSLog(@"classTable插入信息失败--%@",self.fmdbBase.lastErrorMessage);
    } else {
        NSLog(@"给class表添加课程成功");
    }
    [self.fmdbBase close];
}

- (void)updateParameterDic {
    // 命名参数语法,这些参数必须以：开头 ，但是命名时字典的键内部以冒号开头，就不能在你的字典的键中包含冒号。
    [self.fmdbBase open];
    NSDictionary *argsDict = [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"sclassId",
                              @"数学", @"className", nil];
    BOOL isSuccess = [self.fmdbBase executeUpdate:@"insert into class (sclassId,className) values (:sclassId, :className)" withParameterDictionary:argsDict];
    
    if(!isSuccess) {
        NSLog(@"classTable插入信息失败--%@",self.fmdbBase.lastErrorMessage);
    } else {
        NSLog(@"给class表添加课程成功");
    }
    [self.fmdbBase close];
}

//更新数据库
- (void)updateStudent:(StudentFMDBModel*)student {
    [self.fmdbBase open];
    // ? 不确定的参数用问号来占位
    NSString*SQL1 =@"update student set sName = ? where studentId = ?";
    NSString*SQL2 =@"update student set sAge = ? where studentId = ?";
    BOOL isSuccess1 = [self.fmdbBase executeUpdate: SQL1, student.sName,@(student.studentId)];
    BOOL isSuccess2 = [self.fmdbBase executeUpdate: SQL2,@(student.sAge),@(student.studentId)];
    if(!isSuccess1) {
        NSLog(@"student.sName修改失败--%@",self.fmdbBase.lastErrorMessage);
    }
    if(!isSuccess2) {
        NSLog(@"student.sAge修改失败--%@",self.fmdbBase.lastErrorMessage);
    }
    [self.fmdbBase close];
}

- (void)deleteStudent:(StudentFMDBModel*)student {
    [self.fmdbBase open];
    NSString*SQL =@"delete from student where studentId = ?";
    BOOL isDeleteSuccess = [self.fmdbBase executeUpdate:SQL,@(student.studentId)];
    if(!isDeleteSuccess) {
        NSLog(@"studentTable删除某信息失败:%@",self.fmdbBase.lastErrorMessage);
    } else {
        NSLog(@"信息删除成功!");
    }
    [self.fmdbBase close];
}

- (void)deleteAllStudent {
    [self.fmdbBase open];
    NSString *SQL =@"delete from student";
    BOOL isSuccess = [self.fmdbBase executeUpdate:SQL];
    if(!isSuccess) {
        NSLog(@"studentTable全部删除失败--%@",self.fmdbBase.lastErrorMessage);
    }
    //student表删除以后，对应的class也要删除
    [self deleteAllClass];
    [self.fmdbBase close];
}

- (void)deleteAllClass {
    NSString*SQL =@"delete from class";
    BOOL isSuccess = [self.fmdbBase executeUpdate:SQL];
    if(!isSuccess) {
        NSLog(@"classt全部删除失败--%@",self.fmdbBase.lastErrorMessage);
    }
}

#pragma mark - Query

- (NSMutableArray *)getAllStudent {
    [self.fmdbBase open];
    NSMutableArray *array = [NSMutableArray new];
    FMResultSet *result = [self.fmdbBase executeQuery:@"select * from student"];
    while([result next]) {
        StudentFMDBModel *student = [[StudentFMDBModel alloc] init];
        student.studentId= [[result stringForColumn:@"studentId"] integerValue];
        student.sName= [result stringForColumn:@"sName"];
        student.sAge= [[result stringForColumn:@"sAge"] integerValue];
        [array addObject:student];
    }
    [self.fmdbBase close];
    return array;
}

- (NSMutableArray *)getAllClass {
    [self.fmdbBase open];
    NSMutableArray *array = [NSMutableArray new];
    FMResultSet *result = [self.fmdbBase executeQuery:@"select * from class"];
    while([result next]) {
        StudentFMDBModel *student = [[StudentFMDBModel alloc] init];
        student.studentId= [[result stringForColumn:@"sclassId"] integerValue];
        student.sName= [result stringForColumn:@"className"];
        [array addObject:student];
    }
    [self.fmdbBase close];
    return array;
}

- (NSMutableArray*)seachAllInfoWith:(NSString*)str {
    [self.fmdbBase open];
    NSMutableArray*array = [NSMutableArray new];
    //通过名字查询学生信息
    NSString *SQL = [NSString stringWithFormat:@"select * from student where sName = '%@' ", str]; // '%@' 可以查询中文
    FMResultSet *result = [self.fmdbBase executeQuery:SQL];
    while([result next]) {
        StudentFMDBModel *student = [[StudentFMDBModel alloc] init];
        student.studentId= [result intForColumn:@"studentId"];
        student.sName= [result stringForColumn:@"sName"];
        [array addObject:student];
    }
    [self.fmdbBase close];
    return array;
}

@end
