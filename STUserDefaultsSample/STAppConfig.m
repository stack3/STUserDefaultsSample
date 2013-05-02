//
//  STAppConfig.m
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

#import "STAppConfig.h"
#import "NSDictionary+STUserDefaultsSample.h"
#import "NSMutableDictionary+STUserDefaultsSample.h"

@implementation STAppConfig

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _shareWithTwitter = [dict st_boolForKey:STMemberVariableToString(_shareWithTwitter) defaultValue:NO];
        _shareWithFacebook = [dict st_boolForKey:STMemberVariableToString(_shareWithFacebook) defaultValue:NO];
    }
    return self;
}

+ (STAppConfig *)loadInstance
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [defaults dictionaryForKey:STAppUserDefaultsKey(@"appConfig")];
    if (dict) {
        dict = [NSDictionary dictionary];
    }
    return [[STAppConfig alloc] initWithDictionary:dict];
}

- (void)save
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:10];
    [dict st_setBool:_shareWithTwitter forKey:STMemberVariableToString(_shareWithTwitter)];
    [dict st_setBool:_shareWithFacebook forKey:STMemberVariableToString(_shareWithFacebook)];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:dict forKey:STAppUserDefaultsKey(@"appConfig")];
    [defaults synchronize];
}

@end
