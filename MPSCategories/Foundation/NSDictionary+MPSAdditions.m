//
//  NSDictionary+MPSAdditions.m
//  MPSCategories
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "NSDictionary+MPSAdditions.h"

@implementation NSDictionary (MPSAdditions)

- (id)valueForKey:(NSString *)key defaultValue:(id)defaultValue {
	id value = [self valueForKey:key];
	if (value == nil || value == NSNull.null) {
		return defaultValue;
	}
	return value;
}

- (NSArray *)mps_arrayForKey:(NSString *)key {
	id value = [self valueForKey:key defaultValue:@[]];
	if ([value isKindOfClass:[NSArray class]]) {
		return value;
	}
	return @[];
}

- (BOOL)mps_boolForKey:(NSString *)key {
	id value = [self valueForKey:key defaultValue:nil];
	if (!value || value == NSNull.null) {
		return NO;
	}
	return [value boolValue];
}

- (NSDate *)mps_dateForKey:(NSString *)key {
	id value = [self valueForKey:key defaultValue:nil];
	if ([value isKindOfClass:[NSDate class]]) {
		return value;
	}
	return [self.class parseDate:value];
}

- (NSDictionary *)mps_dictionaryForKey:(NSString *)key {
	id value = [self valueForKey:key defaultValue:@{}];
	if ([value isKindOfClass:[NSDictionary class]]) {
		return value;
	}
	return @{};
}

- (NSString *)mps_stringForKey:(NSString *)key {
	id value = [self valueForKey:key defaultValue:@""];
	if ([value isKindOfClass:[NSString class]]) {
		return value;
	}
	if ([value isKindOfClass:[NSNumber class]]) {
		return [NSString stringWithFormat:@"%@", value];
	}
	return @"";
}

- (NSInteger)mps_integerForKey:(NSString *)key {
	id value = [self valueForKey:key defaultValue:nil];
	if (!value || value == NSNull.null) {
		return 0;
	}
	return [value integerValue];
}

+ (NSDate *)parseDate:(NSString *)string {
	if ([string isKindOfClass:NSNull.class] || string == nil || [string isEqualToString:@""]) return nil;
	
	static NSDateFormatter *dateFormatter;
	
	if (dateFormatter == nil) {
		dateFormatter = [[NSDateFormatter alloc] init];
	}
	
	dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssz";
	
	// Fix for timezone format
	if ([string hasSuffix:@"Z"]) {
		string = [[string substringToIndex:[string length]-1] stringByAppendingString:@"+0000"];
	} else if ([string length] >= 24) {
		string = [string stringByReplacingOccurrencesOfString:@":" withString:@"" options:0 range:NSMakeRange(21,4)];
	}
	
	NSDate *date = [dateFormatter dateFromString:string];
	return date;
}

@end
