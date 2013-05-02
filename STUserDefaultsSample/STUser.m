//
//  STUser.m
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

#import "STUser.h"
#import "NSDictionary+STUserDefaultsSample.h"
#import "NSMutableDictionary+STUserDefaultsSample.h"

@implementation STUser

- (id)init
{
    self = [super init];
    if (self) {
        _isPrivate = YES;
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _username = [dict st_stringForKey:STMemberVariableToString(_username) defaultValue:nil];
        _age = [dict st_unsignedIntegerForKey:STMemberVariableToString(_age) defaultValue:0];
        _isPrivate = [dict st_boolForKey:STMemberVariableToString(_isPrivate) defaultValue:YES];
    }
    return self;
}

+ (STUser *)loadInstance
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [defaults dictionaryForKey:STAppUserDefaultsKey(@"user")];
    return [[STUser alloc] initWithDictionary:dict];
}

- (void)save
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:10];
    if (_username) {
        [dict setObject:_username forKey:STMemberVariableToString(_username)];
    }
    [dict st_setUnsignedInteger:_age forKey:STMemberVariableToString(_age)];
    [dict st_setBool:_isPrivate forKey:STMemberVariableToString(_isPrivate)];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:dict forKey:STAppUserDefaultsKey(@"user")];
    [defaults synchronize];
}

@end
