//
//  TopicCommentCell.h
//  ForumDemo
//
//  Created by lufly on 16/8/31.
//  Copyright © 2016年 lufly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicCommentCell : UITableViewCell

@property (nonatomic) NSDictionary *data;

- (void)initViews;
+ (float)cellHeight:(NSDictionary *)data;

@end

