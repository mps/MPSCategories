//
//  NSDictionary+MPSAdditions.h
//  MPSCategories
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MPSAdditions)

- (NSArray *)mps_arrayForKey:(NSString *)key;

- (BOOL)mps_boolForKey:(NSString *)key;

- (NSDate *)mps_dateForKey:(NSString *)key;

- (NSDictionary *)mps_dictionaryForKey:(NSString *)key;

- (NSInteger)mps_integerForKey:(NSString *)key;

- (NSString *)mps_stringForKey:(NSString *)key;

@end
