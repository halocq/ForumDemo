//
//  RecentController.m
//  ForumDemo
//
//  Created by lufly on 16/5/11.
//  Copyright © 2016年 lufly. All rights reserved.
//

#import "RecentController.h"
#import "FirstViewCell.h"
#import "API.h"
#import "APIClient.h"

@interface RecentController ()

@property (nonatomic) UITableView *vTb;
@property (nonatomic) NSMutableArray *mDatas;

@end

@implementation RecentController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"最新";
    
    _vTb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIN_WIDTH, WIN_HEIGHT)];
    _vTb.delegate = self;
    _vTb.dataSource = self;
    _vTb.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_vTb];
    
    [self initData];

}

- (void)initData{
    [APIClient getData:[API newTopicsPath] params:nil success:^(id data) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
