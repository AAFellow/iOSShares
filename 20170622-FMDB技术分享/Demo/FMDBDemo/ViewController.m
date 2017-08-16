//
//  ViewController.m
//  FMDBDemo
//
//  Created by fuYanan on 17/6/20.
//  Copyright © 2017年 fuYanan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor yellowColor];
    [self xmlArchive];
    
}

#pragma mark 归档解档
-(void)xmlArchive{
/**** 1、NSString XML归解档 ****/
    NSString *str=@"Hello World!";
    NSString *pathStr=[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"Hello_World.txt"];
    [str writeToFile:pathStr
          atomically:YES
            encoding:NSUTF8StringEncoding
               error:nil];
    //pathStr直接获取pathStr路径下的内容
    NSString *contentStr = [NSString stringWithContentsOfFile:pathStr
                                               encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"str2:%@",contentStr);
    //2、
    NSString *testStr=@"AA租车";
    NSString *pathStr0=[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"AA租车.plist"];
    BOOL flog=[NSKeyedArchiver archiveRootObject:testStr toFile:pathStr0];
    NSString *testStr1=@"AA租车2";
    NSString *pathStr01=[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"AA租车2.plist"];
    BOOL flog2=[NSKeyedArchiver archiveRootObject:testStr1 toFile:pathStr01];
    NSString *str333=[NSKeyedUnarchiver unarchiveObjectWithFile:pathStr01];//解档
/**** NSData XML归解档 ****/
    // 任何对象都可以转化为NSData
   NSString *str2=@"data";
    NSString *pathStr2 = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingString:@"/data.txt"];
    NSLog(@"pathStr2:%@",pathStr2);
    NSData *data=[str2 dataUsingEncoding:NSUTF8StringEncoding];
    [data writeToFile:pathStr2 atomically:YES];// 归档
    [NSData dataWithContentsOfFile:pathStr2];// 解档
/**** NSArray及NSMutableArray XML归解档 ****/
    NSArray *array = @[@"test",@"test2"];
    NSString *pathStr3 = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]stringByAppendingPathComponent:@"array.plist"];
    [array writeToFile:pathStr3 atomically:YES];// 归档
    NSArray *array3 = [NSArray arrayWithContentsOfFile:pathStr3];// 解档
/**** NSDictionary XML归解档 ****/
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"one",@"1",@"two",@"2", nil];
    NSString *path4 = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]stringByAppendingPathComponent:@"dic.plist"];
    [dic writeToFile:path4 atomically:YES];// 归档
    NSDictionary *dic4 = [NSDictionary dictionaryWithContentsOfFile:path4];// 解档
}

/**
 就是利用NSKeyedArchiver类创建带键(keyed)的档案来完成。实现对我们自定义的类进行归档。
 */
#pragma mark NSKeyedArchiver归档
-(void)nsKeyedArchiver{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
