//
//  HttpTools.m
//  DMInterest
//
//  Created by DEMAI on 14-11-25.
//  Copyright (c) 2014年 Today. All rights reserved.
//

#import "HttpTools.h"

@implementation HttpTools


DEFINE_SINGLETON_FOR_CLASS(HttpTools)

- (id)init
{
    self = [super init];
    if (self) {
        NSString *deviceId = [[UIDevice currentDevice] macaddress];
        NSString *type = [[UIDevice currentDevice] model];
        NSDictionary *client_info = @{@"version":@"1.0",@"type":type,@"device_id":deviceId};
        preFixparams = @{@"client_info":client_info};
        opManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:URL_SERVER_BASE]];
    }
    return self;
}


+(void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [[HttpTools sharedHttpTools] get:url params:params success:success failure:failure];
}

+(void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [[HttpTools sharedHttpTools] post:url params:params success:success failure:failure];
}

-(void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [opManager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            failure(error);
        }
    }];
}


-(void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [opManager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            failure(error);
        }
    }];
}


@end
