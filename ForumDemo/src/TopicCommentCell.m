//
//  TopicCommentCell.m
//  ForumDemo
//
//  Created by lufly on 16/8/31.
//  Copyright © 2016年 lufly. All rights reserved.
//

#import "TopicCommentCell.h"
#import "STTweetLabel.h"

@interface TopicCommentCell()

@property (nonatomic) UIImageView *avatorImage;
@property (nonatomic) UILabel *nickName;
@property (nonatomic) UILabel *brief;
@property (nonatomic) STTweetLabel *contentLabel;
@property (nonatomic) UIView *vBottomLine;

@end

@implementation TopicCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _avatorImage = [UIutils createImageView:CGRectMake(10, 10, 36, 36)];
    [self addSubview:_avatorImage];
    
    _nickName = [UIutils createLabelWithText:@"nick name" frame:CGRectMake(_avatorImage.right + 8, 10, WIN_WIDTH - 50, 15)];
    [self addSubview:_nickName];
    
    _brief = [UIutils createLabelWithText:@"brief" frame:CGRectMake(_avatorImage.right + 8, _nickName.bottom + 5, WIN_WIDTH - 50, 15)];
    [self addSubview:_brief];
    
    _contentLabel = [[STTweetLabel alloc] initWithFrame:CGRectMake(10, _avatorImage.bottom + 10, WIN_WIDTH - 20, 20)];
    [self addSubview:_contentLabel];
    
    _vBottomLine = [UIutils createLineView:CGRectMake(0, 0, WIN_WIDTH, 0.5)];
    _vBottomLine.hidden = YES;
    [self addSubview:_vBottomLine];

    return self;
}

- (void)initViews{
    float h = [TopicCommentCell cellHeight:_data];

    NSDictionary *creator = V(_data, @"member");
    [UIutils updateImage:_avatorImage imageName:[NSString stringWithFormat:@"https:%@", V(creator, @"avatar_mini")] placeholderImage:nil options:nil];
    _nickName.text = V(creator, @"username");
    
    _contentLabel.height = h - 60;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;
    _contentLabel.number = 0;
    [_contentLabel setAttributes:@{NSForegroundColorAttributeName:C2, NSFontAttributeName: [UIFont systemFontOfSize:13.0], NSParagraphStyleAttributeName:paragraphStyle}];
    [_contentLabel setText:V(_data, @"content")];

    _vBottomLine.frame = CGRectMake(0, h - 0.5, WIN_WIDTH, 0.5);
    _vBottomLine.hidden = NO;

}


+ (float)cellHeight:(NSDictionary *)data{
    if ([V(data, @"content") isEqualToString:@""]) {
        return 0;
    }
    
    NSString *content = V(data, @"content");
    
    float height = 70;
    if ([content length] > 0) {
        
        STTweetLabel *vContent = [[STTweetLabel alloc] initWithFrame:CGRectMake(10, 0, WIN_WIDTH - 20, 0)];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 5;
        [vContent setAttributes:@{NSForegroundColorAttributeName:C2, NSFontAttributeName: [UIFont systemFontOfSize: 13.0], NSParagraphStyleAttributeName:paragraphStyle}];
        [vContent setText:content];
        CGSize size = [vContent suggestedFrameSizeToFitEntireStringConstrainedToWidth:(WIN_WIDTH - 20)];
        height += (size.height);
    }
    
    return height;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
