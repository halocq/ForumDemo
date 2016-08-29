//
//  APIClient.m
//  ForumDemo
//
//  Created by lufly on 16/5/10.
//  Copyright © 2016年 lufly. All rights reserved.
//

#import "APIClient.h"

#define API_UNAUTHORIZED 401
#define INT_VAL(...) ((NSNumber *)__VA_ARGS__).intValue

NSString *baseURL;

@implementation APIClient

+ (void)setBaseURL:(NSString*)url
{
    baseURL = url;
}

+ (void)getData:(NSString *)url params:(NSDictionary *)params success:(void (^)(id data))success failure:(void (^)(NSError *error))failure
{
    NSLog(@"\nAPI REQUEST: %@ %@\nPARAMS: %@", @"GET", url, params);
    [[self sharedClient] GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id result) {
        success(result);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self defaultFailureHandler:failure AFHTTPRequestOperation:operation NSError:error];
    }];
}

+ (void)postData:(NSString *)url params:(NSDictionary *)params success:(void (^)(id data))success failure:(void (^)(NSError *error))failure
{
    NSLog(@"\nAPI REQUEST: %@ %@\nPARAMS: %@", @"POST", url, params);
    [[self sharedClient] POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id result) {
        if(success) success(result);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self defaultFailureHandler:failure AFHTTPRequestOperation:operation NSError:error];
    }];
}

+ (void)putData:(NSString *)url params:(NSDictionary *)params success:(void (^)(id data))success failure:(void (^)(NSError *error))failure
{
    NSLog(@"\nAPI REQUEST: %@ %@\nPARAMS: %@", @"PUT", url, params);
    [[self sharedClient] PUT:url parameters:params success:^(AFHTTPRequestOperation *operation, id result) {
        if(success) success(result);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self defaultFailureHandler:failure AFHTTPRequestOperation:operation NSError:error];
    }];
}

+ (id) defaultFailureHandler:(void (^)(NSError *error))failure AFHTTPRequestOperation:(AFHTTPRequestOperation *)operation NSError:(NSError *)error {
    long statusCode = [operation.response statusCode];
    NSURL  *url  = [operation.request URL];
    NSLog(@"\nLoad API ERROR: \n** URL: %@ \n** ERROR CODE: %ld", url, statusCode);
    
    switch (statusCode) {
        case API_UNAUTHORIZED:
            [self unAuthenticationHandler:error];
            break;
        default:
            [self unExceptedServerErrorHandler:error];
            break;
    };
    if (failure) {
        failure(error);
    };
    
    return false;
}

+ (id) unAuthenticationHandler:(NSError *)error {
    okAlert(@"APClient#unAuthenticationHandler doesn't implement yet");
    return false;
}

+ (id) unExceptedServerErrorHandler:(NSError *)error {
    okAlert(@"APClient#unExceptedServerErrorHandler doesn't implement yet");
    return false;
}

+ (APIClient *)sharedClient {
    static APIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[APIClient alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
    });
    
    return _sharedClient;
}

@end
