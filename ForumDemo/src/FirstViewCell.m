//
//  FirstViewCell.m
//  ForumDemo
//
//  Created by lufly on 16/5/10.
//  Copyright © 2016年 lufly. All rights reserved.
//

#import "FirstViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface FirstViewCell()

@property (nonatomic) UIImageView *creatorAvator;
@property (nonatomic) UILabel *creatorName;
@property (nonatomic) UILabel *timeLabel;
@property (nonatomic) UILabel *content;

@end

@implementation FirstViewCell

@synthesize data;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _creatorAvator = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 40, 40)];
    [self.contentView addSubview:_creatorAvator];
    
    _creatorName = [[UILabel alloc] initWithFrame:CGRectMake(_creatorAvator.right + 10,  10, WIN_WIDTH - 100, 14)];
    _creatorName.font = [UIFont systemFontOfSize:14.f];
    _creatorName.textColor = mainTextColor;
    [self.contentView addSubview:_creatorName];
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_creatorAvator.right + 10, _creatorName.bottom + 8, WIN_WIDTH - 100, 12)];
    _timeLabel.font = [UIFont systemFontOfSize:12.f];
    _timeLabel.textColor = C6;
    [self.contentView addSubview:_timeLabel];
    
    _content = [[UILabel alloc] initWithFrame:CGRectMake(10, _creatorAvator.bottom + 15, WIN_WIDTH - 20, 14)];
    _content.font = [UIFont systemFontOfSize:14.f];
    _content.textColor = C2;
    [self.contentView addSubview:_content];
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 89.5, WIN_WIDTH, 0.5)];
    bottomLine.backgroundColor = C7;
    [self.contentView addSubview:bottomLine];
 
    return self;
}

- (void)refreshView{
    NSDictionary *creator = V(data, @"member");
    NSString *avatarUrl = [NSString stringWithFormat:@"https:%@", V(creator, @"avatar_normal")];
    [_creatorAvator sd_setImageWithURL:[NSURL URLWithString:avatarUrl] placeholderImage:nil];
    
    _creatorName.text = V(creator, @"username");
    _timeLabel.text = [self timeFormmate:V(data, @"created")];
    _content.text = V(data, @"title");
}

- (NSString *)timeFormmate: (NSString *)time{
    NSString *timeLabel = @"";
    NSDate *timeNow = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    long nowSp = [timeNow timeIntervalSince1970];
    long publishSp = [time longLongValue];
    long tc = nowSp - publishSp;
    if (tc >= 604800) {
        NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:publishSp];
        timeLabel = [dateFormatter stringFromDate:date2];
    }else if(tc >= 24 * 60 * 60 && tc < 604800){
        timeLabel = [NSString stringWithFormat:@"%ld天前", tc / (24 * 60 * 60)];
    }else if (tc >= 60 * 60 && tc < 24 * 60 * 60) {
        timeLabel = [NSString stringWithFormat:@"%ld小时前", tc / (60 * 60)];
    }else if(tc >= 60 && tc < 60 * 60){
        timeLabel = [NSString stringWithFormat:@"%ld分钟前", tc / 60];
    }else{
        timeLabel = @"刚刚";
    }
    return timeLabel;
}
@end
