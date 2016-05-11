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
#import "FirstViewCell.h"
#import "MJRefresh.h"

@interface FirstViewController ()

@property (nonatomic) UITableView *vTb;
@property (nonatomic) NSMutableArray *mDatas;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"V2EX";
    
    _vTb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIN_WIDTH, WIN_HEIGHT)];
    _vTb.delegate = self;
    _vTb.dataSource = self;
    _vTb.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_vTb];
    
    [self initData];
}

- (void)initData{
    [APIClient getData:[API hotTopicsPath] params:nil success:^(id data) {
        _mDatas = data;
        [_vTb reloadData];
    } failure:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_mDatas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstViewCell"];
    if (cell == nil) {
        cell = [[FirstViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FirstViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.data = [_mDatas objectAtIndex:indexPath.row];
    [cell refreshView];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
