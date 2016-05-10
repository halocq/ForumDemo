//
//  FirstViewController.m
//  ForumDemo
//
//  Created by lufly on 16/5/9.
//  Copyright © 2016年 lufly. All rights reserved.
//

#import "FirstViewController.h"
#import "APIClient.h"
#import "API.h"

@interface FirstViewController ()

@property (nonatomic) UITableView *vTb;
@property (nonatomic) NSMutableArray *mDatas;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"第一个view";
    
    _vTb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIN_WIDTH, WIN_HEIGHT)];
    _vTb.delegate = self;
    _vTb.dataSource = self;
    _vTb.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_vTb];
    
    [self initData];
}

- (void)initData{
    [APIClient getData:[API hotTopicsPath] params:nil success:^(id data) {
        
    } failure:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_mDatas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return NULL;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 135;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
