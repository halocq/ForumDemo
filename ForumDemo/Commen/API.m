//
//  API.m
//  ForumDemo
//
//  Created by lufly on 16/5/10.
//  Copyright © 2016年 lufly. All rights reserved.
//

#import "API.h"

@implementation API

+(NSString *) basePath {
    return @"https://www.v2ex.com/api/";
}

//======================= first page

+(NSString *) hotTopicsPath{
    return @"topics/hot.json";
}

+(NSString *) newTopicsPath{
    return @"topics/latest.json";
}

+(NSString *) topicShowPath:(NSString *)topicId{
    return [NSString stringWithFormat:@"topics/show.json?id=%@", topicId];
}

+(NSString *) commentsShowPath:(NSString *)topicId{
    return [NSString stringWithFormat:@"replies/show.json?topic_id=%@", topicId];
}

@end
