//
//  AddViewController.m
//  FMDB的使用
//
//  Created by fuYanan on 17/8/29.
//  Copyright © 2017年 fuYanan. All rights reserved.
//

#import "AddViewController.h"
#import "StudentFMDBModel.h"
#import "DataForFmdb.h"
#import <FMDB.h>

@interface AddViewController (){
    FMDatabase *fmdb;
}

@end

@implementation AddViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private

- (void)initView {
    for (int i = 0; i < 3; i++) {
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 80 + i*50, self.view.frame.size.width - 40, 40)];
        textField.tag = 100 + i;
        textField.backgroundColor = [UIColor colorWithRed:233 green:72 blue:0 alpha:1];
        [self.view addSubview:textField];

        if (i == 0) {
            textField.placeholder = @"学号(sId):";
        } else if(i == 1){
            textField.placeholder = @"名字(sname):";
        } else {
            textField.placeholder = @"年龄(sAge):";
        }
    }
    UITextField *tempTextField = (UITextField *)[self.view viewWithTag:102];
    //添加
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(20, CGRectGetMaxY(tempTextField.frame) + 20, self.view.frame.size.width - 40, 50);
    addButton.layer.cornerRadius = 3.0f;
    addButton.layer.masksToBounds = YES;
    [addButton setTitle:@"添加" forState:UIControlStateNormal];
    addButton.backgroundColor = [UIColor greenColor];
    [addButton addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
}

#pragma mark - Action

-(void)addAction{
    UITextField *studentIdTextField = (UITextField *)[self.view viewWithTag:100];
    UITextField *sNameTextField = (UITextField *)[self.view viewWithTag:101];
    UITextField *sAgeTextField = (UITextField *)[self.view viewWithTag:102];

    StudentFMDBModel *studentModel =[[StudentFMDBModel alloc] init];
    studentModel.studentId = [studentIdTextField.text integerValue];
    studentModel.sName= sNameTextField.text;
    studentModel.sAge = [sAgeTextField.text integerValue];
    
    [[DataForFmdb sharedDataBase] addStudent:studentModel]; //添加数据
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
