//
//  RequestManager.m
//  Parity Cube -IOS Assignment
//
//  Created by Kiran Gaware on 16/05/16.
//  Copyright © 2016 XYZ Technologies. All rights reserved.
//

#import "RequestManager.h"

@implementation RequestManager

+(NSMutableURLRequest *)getDealsRequest
{
    NSURL *url = [NSURL URLWithString:@"http://www.desidime.com/api/v1/premium_deals/list/"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue:@"text/javascript" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    
    return request;
}

+(NSURLSession *)getSession
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    return session;
}
@end
