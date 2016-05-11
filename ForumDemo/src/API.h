//
//  API.h
//  ForumDemo
//
//  Created by lufly on 16/5/10.
//  Copyright © 2016年 lufly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface API : NSObject

+(NSString *) basePath;

//=========================first page
+(NSString *) hotTopicsPath;
+(NSString *) newTopicsPath;
@end
