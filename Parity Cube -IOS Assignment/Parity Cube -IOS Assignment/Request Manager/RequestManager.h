//
//  RequestManager.h
//  Parity Cube -IOS Assignment
//
//  Created by Kiran Gaware on 16/05/16.
//  Copyright © 2016 XYZ Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestManager : NSObject
+(NSMutableURLRequest *)getDealsRequest;
+(NSURLSession *)getSession;
@end
