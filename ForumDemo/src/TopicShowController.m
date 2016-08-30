//
//  TopicShowController.m
//  ForumDemo
//
//  Created by lufly on 16/5/11.
//  Copyright © 2016年 lufly. All rights reserved.
//

#import "TopicShowController.h"
#import "API.h"
#import "APIClient.h"

@interface TopicShowController ()

@property (nonatomic) UIWebView *vWeb;
@property (nonatomic) UILabel *lastBrief;

@property (nonatomic) UITableView *vTb;
@property (nonatomic) UIView *headerView;

@property (nonatomic) NSDictionary *headerData;

@end

@implementation TopicShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"帖子详情";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    _vTb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIN_WIDTH, WIN_HEIGHT)];
    _vTb.delegate = self;
    _vTb.dataSource = self;
    _vTb.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_vTb];
    
    [self initData];
}

- (void)initData{
   [APIClient getData:[API topicShowPath:_topicId] params:nil success:^(id data) {
       _headerData = [data objectAtIndex:0];
       [self initTableViewHeader];
   } failure:^(NSError *error) {
       okAlert(@"出错啦");
   }];
}

- (void)initTableViewHeader{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];

    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIN_WIDTH, 50)];
    [self.view addSubview:_headerView];
    NSDictionary *creator = V(_headerData, @"member");
    
    UIImageView *avator = [UIutils createImageView:CGRectMake(10, 8, 36, 36)];
    NSString *avatarUrl = [NSString stringWithFormat:@"https:%@", V(creator, @"avatar_normal")];
    [UIutils updateImage:avator imageName:avatarUrl placeholderImage:nil options:nil];
    [_headerView addSubview:avator];
    
    UILabel *nickName = [UIutils createLabelWithText:V(creator, @"username") frame:CGRectMake(avator.right + 8, avator.top + 2, 0, 15) withSize:12 withColor:C2];
    [nickName sizeToFit];
    [_headerView addSubview:nickName];
    
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:[V(_headerData, @"created") longLongValue]];
    NSString *str1 = [dateFormatter stringFromDate:date1];

    UILabel *brief = [UIutils createLabelWithText:[NSString stringWithFormat:@"at %@",str1] frame:CGRectMake(nickName.left, nickName.bottom + 5, WIN_WIDTH, 14) withSize:12 withColor:C6];
    [_headerView addSubview:brief];
    
    _vWeb = [[UIWebView alloc] initWithFrame:CGRectMake(10, 50, WIN_WIDTH - 20, 30)];
    _vWeb.backgroundColor = [UIColor whiteColor];
    _vWeb.delegate = self;
    _vWeb.scalesPageToFit = YES;
    [_vWeb setOpaque:NO];
    [_headerView addSubview:_vWeb];
    
    [_vWeb loadHTMLString:V(_headerData, @"content_rendered") baseURL:nil];
    
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:[V(_headerData, @"last_touched") longLongValue]];
    NSString *str = [dateFormatter stringFromDate:date2];
    _lastBrief = [UIutils createLabelWithText:str frame:CGRectMake(10, _vWeb.bottom, WIN_WIDTH, 15) withSize:12 withColor:C6];
    [_headerView addSubview:_lastBrief];
    _vTb.tableHeaderView = _headerView;

}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    CGSize fittingSize = [webView sizeThatFits:CGSizeZero];
    [UIView animateWithDuration:0.35 animations:^{
        _vWeb.height = fittingSize.height;
        _lastBrief.top = _vWeb.bottom;
    } completion:^(BOOL finished) {
        _headerView.height = _vWeb.height + 100;
        _vTb.tableHeaderView = _headerView;
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
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
