//
//  FirstViewCell.m
//  ForumDemo
//
//  Created by lufly on 16/5/10.
//  Copyright © 2016年 lufly. All rights reserved.
//

#import "FirstViewCell.h"

@interface FirstViewCell()

@property (nonatomic) UIImageView *creatorAvator;
@property (nonatomic) UILabel *creatorName;
@property (nonatomic) UILabel *timeLabel;
@property (nonatomic) UILabel *content;

@end

@implementation FirstViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _creatorAvator = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 50, 50)];
    [self.contentView addSubview:_creatorAvator];
    
    return self;
}

- (void)refreshView{
    
}

@end
