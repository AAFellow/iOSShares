//
//  ViewController.m
//  FMDB的使用
//
//  Created by fuYanan on 17/8/28.
//  Copyright © 2017年 fuYanan. All rights reserved.
//

#import "ViewController.h"
#import "AddViewController.h"
#import "DataForFmdb.h"
#import "StudentFMDBModel.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *studentArr;
@property (nonatomic, strong) NSArray *classArr;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self inintView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self refreshData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private

- (void)inintView {
    self.view.backgroundColor = [UIColor whiteColor];
    //增加
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(20, 80, 50, 50);
    addButton.backgroundColor = [UIColor greenColor];
    [addButton setTitle:@"更新" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    //数组
    UIButton *addButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton2.frame = CGRectMake(CGRectGetMaxX(addButton.frame) + 20, 80, 120, 50);
    addButton2.backgroundColor = [UIColor yellowColor];
    [addButton2 setTitle:@"删除" forState:UIControlStateNormal];
    [addButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addButton2 addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton2];
    
    //参数为字典的update
    UIButton *addButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton3.frame = CGRectMake(CGRectGetMaxX(addButton2.frame) + 20, 80, 120, 50);
    addButton3.backgroundColor = [UIColor redColor];
    [addButton3 setTitle:@"更新(字典)" forState:UIControlStateNormal];
    [addButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addButton3 addTarget:self action:@selector(dicAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton3];
    
    //tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(addButton3.frame) + 20,self.view.frame.size.width , self.view.frame.size.height - CGRectGetMaxY(addButton3.frame) -20) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)refreshData {
    self.studentArr = [[DataForFmdb sharedDataBase] getAllStudent];
    self.classArr = [[DataForFmdb sharedDataBase] getAllClass];
    [self.tableView reloadData];
}

#pragma mark - Action

- (void)addAction {
    AddViewController *addControllerView = [[AddViewController alloc] init];
    [self.navigationController pushViewController:addControllerView animated:YES];
}

- (void)deleteAction{
    
//    [[DataForFmdb sharedDataBase] deleteAllStudent];
    
    if (self.studentArr.count > 1) {
        StudentFMDBModel *studentFMDBModel = self.studentArr[0];
        [[DataForFmdb sharedDataBase] deleteStudent:studentFMDBModel];
    }
    [self refreshData];

}

- (void)dicAction {
    [[DataForFmdb sharedDataBase] updateParameterDic];
}

#pragma mark - UIself.tableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"testCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    //数据
    if (self.studentArr.count > 0) {
        StudentFMDBModel *studentModel = self.studentArr[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"ID:%ld 名字:%@ 年龄:%ld",
                               studentModel.studentId,
                               studentModel.sName,
                               studentModel.sAge];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.studentArr.count > 0) {
        return self.studentArr.count;
    }
    return 0;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //添加课程
    StudentClassModel *studentClassModel = [[StudentClassModel alloc] init];
    StudentFMDBModel *studentModel = [[StudentFMDBModel alloc] init];
    studentModel = self.studentArr[indexPath.row];
    studentClassModel.className = @"数学";
    studentClassModel.sclassId = studentModel.studentId;
    [[DataForFmdb sharedDataBase] addClass:studentClassModel toStudent:studentModel];
    [self.tableView reloadData];
}

@end
