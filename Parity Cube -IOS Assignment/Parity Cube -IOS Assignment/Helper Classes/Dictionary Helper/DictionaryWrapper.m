//
//  DictionaryWrapper.m
//  Parity Cube -IOS Assignment
//
//  Created by Kiran Gaware on 16/05/16.
//  Copyright © 2016 XYZ Technologies. All rights reserved.
//

#import "DictionaryWrapper.h"

@implementation DictionaryWrapper


- (void)initialize {
    
}

- (id)init {
    if(self = [super init]) {
        _dictionary = [[NSMutableDictionary alloc]init];
        [self initialize];
    }
    return self;
}

- (id)initWithDictionaryObject:(NSMutableDictionary *)tempDictionary {
    if(self = [super init]) {
        _dictionary = [[NSMutableDictionary alloc]init];
        //dictionary = [[NSMutableDictionary alloc] initWithDictionary:dictionary copyItems:NO];
        _dictionary = tempDictionary;
        [self initialize];
    }
    return self;
}

- (NSMutableArray *)getItems:(NSString *)key {
    NSMutableArray *items = [_dictionary mutableArrayValueForKey:key];
    
    if (items == nil) {
        items = [[NSMutableArray alloc] init];
        [_dictionary setValue:items forKey:key];
    }
    return items;
}

@end
