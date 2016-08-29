//
//  TopicShowController.m
//  ForumDemo
//
//  Created by lufly on 16/5/11.
//  Copyright © 2016年 lufly. All rights reserved.
//

#import "TopicShowController.h"

@interface TopicShowController ()

@property (nonatomic) UIWebView *vWeb;

@property (nonatomic) UITableView *vTb;

@property (nonatomic) NSDictionary *headerData;

@end

@implementation TopicShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _vTb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIN_WIDTH, WIN_HEIGHT)];
    _vTb.delegate = self;
    _vTb.dataSource = self;
    _vTb.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_vTb];
}

- (void)initTableViewHeader{
    
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
