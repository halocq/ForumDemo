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
#import "STTweetLabel.h"
#import "TopicCommentCell.h"

@interface TopicShowController ()

@property (nonatomic) UIView *contentView;
@property (nonatomic) STTweetLabel *contentLabel;
@property (nonatomic) UIWebView *vWeb;
@property (nonatomic) UILabel *lastBrief;

@property (nonatomic) UITableView *vTb;
@property (nonatomic) UIView *headerView;

@property (nonatomic) NSDictionary *headerData;
@property (nonatomic) NSMutableArray *commentDatas;

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
    
    [self initComments];
    [self initData];
}

- (void)initComments{
   [APIClient getData:[API commentsShowPath:_topicId] params:nil success:^(id data) {
       _commentDatas = [NSMutableArray arrayWithArray:data];
       //[self formatComments:_commentDatas];
       [_vTb reloadData];
   } failure:^(NSError *error) {
       okAlert(@"出错啦");
   }];
}

- (void)formatComments:(NSArray *)comments {
    [comments enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop){
        NSDictionary *item = (NSDictionary *)obj;
        NSMutableDictionary *newItem = [NSMutableDictionary dictionaryWithDictionary:item];
        [newItem setValue:[NSString stringWithFormat:@"%f", [TopicCommentCell cellHeight:newItem]] forKey:@"cell_height"];
        [_commentDatas addObject:newItem];
    }];
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
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, WIN_WIDTH, 10)];
    [_headerView addSubview:_contentView];
    
    _contentLabel = [[STTweetLabel alloc] initWithFrame:CGRectMake(10, 10, WIN_WIDTH - 20, 50)];
    [_contentView addSubview:_contentLabel];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 8;
    _contentLabel.number = 0;
    [_contentLabel setAttributes:@{NSForegroundColorAttributeName:C2, NSFontAttributeName: [UIFont systemFontOfSize:15.0], NSParagraphStyleAttributeName:paragraphStyle}];
    [_contentLabel setText:V(_headerData, @"content")];
    
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:[V(_headerData, @"last_touched") longLongValue]];
    NSString *str = [dateFormatter stringFromDate:date2];
    _lastBrief = [UIutils createLabelWithText:str frame:CGRectMake(10, _contentView.bottom, WIN_WIDTH, 15) withSize:12 withColor:C6];
    [_headerView addSubview:_lastBrief];
    _vTb.tableHeaderView = _headerView;
    
    [self showContent];

}

- (float)cellHeight:(NSDictionary *)data{
    if ([V(data, @"content") isEqualToString:@""]) {
        return 0;
    }
    
    NSString *content = V(data, @"content");
    
    float height = 15;
    if ([content length] > 0) {
        
        STTweetLabel *vContent = [[STTweetLabel alloc] initWithFrame:CGRectMake(10, 0, WIN_WIDTH - 20, 0)];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 8;
        [vContent setAttributes:@{NSForegroundColorAttributeName:C2, NSFontAttributeName: [UIFont systemFontOfSize: 15.0], NSParagraphStyleAttributeName:paragraphStyle}];
        [vContent setText:content];
        CGSize size = [vContent suggestedFrameSizeToFitEntireStringConstrainedToWidth:(WIN_WIDTH - 20)];
        height += (size.height);
    }
    
    return height;
}

- (void)showContent{
    [UIView animateWithDuration:0.35 animations:^{
        _contentLabel.height = [self cellHeight:_headerData];
        _contentView.height = _contentLabel.height + 10;
        _lastBrief.top = _contentView.bottom;
    } completion:^(BOOL finished) {
        _headerView.height = _contentLabel.height + 80;
        _vTb.tableHeaderView = _headerView;
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_commentDatas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TopicCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicCommentCell"];
    if (cell == nil) {
        cell = [[TopicCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TopicCommentCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *data = [_commentDatas objectAtIndex:indexPath.row];
    cell.data = data;
    [cell initViews];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *data = [_commentDatas objectAtIndex:indexPath.row];
    return [TopicCommentCell cellHeight:data];
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
