//
//  NSDictionary+STUserDefaultsSample.m
//  STUserDefaultsSample
//
//  Created by EIMEI on 2013/05/01.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "NSDictionary+STUserDefaultsSample.h"

@implementation NSDictionary (STUserDefaultsSample)

- (NSString*)st_stringForKey:(NSString*)key defaultValue:(NSString*)defaultValue
{
	id obj = [self objectForKey:key];
	if (!obj) {
		return defaultValue;
	}
    
    if ([obj isKindOfClass:[NSString class]]) {
		return obj;
	} else if ([obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj stringValue];
	} else {
		return defaultValue;
	}
}

- (NSInteger)st_integerForKey:(NSString*)key defaultValue:(NSInteger)defaultValue
{
	id obj = [self objectForKey:key];
	if (!obj) {
		return defaultValue;
	}
    
	if ([obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj integerValue];
	} else if ([obj isKindOfClass:[NSString class]]) {
		return (NSInteger)strtol([(NSString*)obj UTF8String], NULL, 0);
	} else {
		return defaultValue;
	}
}

- (NSUInteger)st_unsignedIntegerForKey:(NSString*)key defaultValue:(NSUInteger)defaultValue
{
	id obj = [self objectForKey:key];
	if (!obj) {
		return defaultValue;
	}
    
	if ([obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj unsignedIntegerValue];
	} else if ([obj isKindOfClass:[NSString class]]) {
		return (NSInteger)strtoul([(NSString*)obj UTF8String], NULL, 0);
	} else {
		return defaultValue;
	}
}

- (BOOL)st_boolForKey:(NSString*)key defaultValue:(BOOL)defaultValue
{
    id obj = [self objectForKey:key];
	if (obj && [obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj boolValue];
	} else {
		return defaultValue;
	}
}

@end
