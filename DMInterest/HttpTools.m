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

    }
    return self;
}


+(void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [[HttpTools sharedHttpTools] post:url params:params success:success failure:failure];
}

+(void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [[HttpTools sharedHttpTools] post:url params:params success:success failure:failure];
}

-(void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{

}


@end
