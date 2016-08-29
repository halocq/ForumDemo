//
//  APIClient.h
//  ForumDemo
//
//  Created by lufly on 16/5/10.
//  Copyright © 2016年 lufly. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface APIClient : AFHTTPRequestOperationManager

+ (void)setBaseURL:(NSString*)url;
+ (void)getData:(NSString *)url params:(NSDictionary *)params success:(void (^)(id data))success failure:(void (^)(NSError *error))failure;
+ (void)postData:(NSString *)url params:(NSDictionary *)params success:(void (^)(id data))success failure:(void (^)(NSError *error))failure;
+ (void)putData:(NSString *)url params:(NSDictionary *)params success:(void (^)(id data))success failure:(void (^)(NSError *error))failure;

@end
