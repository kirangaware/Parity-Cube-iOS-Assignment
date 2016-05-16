//
//  DictionaryWrapper.h
//  Parity Cube -IOS Assignment
//
//  Created by Kiran Gaware on 16/05/16.
//  Copyright © 2016 XYZ Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DictionaryWrapper : NSObject
@property (nonatomic,retain) NSMutableDictionary * dictionary;

- (id)init;
- (id)initWithDictionaryObject:(NSMutableDictionary *)dictionary;
- (void)initialize;
- (NSMutableArray *)getItems:(NSString*) key;
@end
