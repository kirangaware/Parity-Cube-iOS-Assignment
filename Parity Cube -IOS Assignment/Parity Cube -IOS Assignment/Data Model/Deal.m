//
//  Deal.m
//  Parity Cube -IOS Assignment
//
//  Created by Kiran Gaware on 16/05/16.
//  Copyright © 2016 XYZ Technologies. All rights reserved.
//

#import "Deal.h"

@implementation Deal
-(NSString *)title
{
    return [self.dictionary valueForKey:@"title"];
}

-(NSString *)deal_detail
{
    return [self.dictionary valueForKey:@"deal_detail"];
}

-(NSString *)imageURL
{
    return [self.dictionary valueForKey:@"pic_thumb"];
}
@end
