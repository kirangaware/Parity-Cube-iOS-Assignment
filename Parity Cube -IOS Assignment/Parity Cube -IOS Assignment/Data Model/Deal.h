//
//  Deal.h
//  Parity Cube -IOS Assignment
//
//  Created by Kiran Gaware on 16/05/16.
//  Copyright © 2016 XYZ Technologies. All rights reserved.
//

#import "DictionaryWrapper.h"

@interface Deal : DictionaryWrapper
@property(strong, nonatomic) NSString *deal_detail;
@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *imageURL;

@end
