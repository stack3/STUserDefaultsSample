//
//  STContentView.m
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

#import "STContentView.h"
#import "STAppContext.h"

@implementation STContentView {
    IBOutlet __weak UISwitch *_shareWithTwitterSwitch;
    IBOutlet __weak UISwitch *_shareWithFacebookSwitch;
    IBOutlet __weak UIButton *_saveAppConfigButton;
    
    IBOutlet __weak UILabel *_userHeaderLabel;
    IBOutlet __weak UITextField *_usernameTextField;
    IBOutlet __weak UITextField *_ageTextField;
    IBOutlet __weak UISwitch *_isPrivateSwitch;
    IBOutlet __weak UIButton *_saveUserButton;
}

+ (id)loadFromNib
{
    UINib *nib = [UINib nibWithNibName:@"STContentView" bundle:nil];
    return [[nib instantiateWithOwner:nil options:nil] objectAtIndex:0];
}

- (void)awakeFromNib
{
    STAppContext *context = [STAppContext sharedContext];
    
    _shareWithTwitterSwitch.on = context.appConfig.shareWithTwitter;
    _shareWithFacebookSwitch.on = context.appConfig.shareWithFacebook;
    [_saveAppConfigButton addTarget:self action:@selector(didTapSaveAppConfigButton) forControlEvents:UIControlEventTouchUpInside];
    
    _usernameTextField.text = context.user.username;
    _usernameTextField.delegate = self;
    _ageTextField.text = [NSString stringWithFormat:@"%u", context.user.age];
    _ageTextField.delegate = self;
    _isPrivateSwitch.on = context.user.isPrivate;
    [_saveUserButton addTarget:self action:@selector(didTapSaveUserButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didTapSaveAppConfigButton
{
    STAppContext *context = [STAppContext sharedContext];
    context.appConfig.shareWithTwitter = _shareWithTwitterSwitch.on;
    context.appConfig.shareWithFacebook = _shareWithFacebookSwitch.on;
    [context.appConfig save];
}

- (void)didTapSaveUserButton
{
    STAppContext *context = [STAppContext sharedContext];
    context.user.username = _usernameTextField.text;
    context.user.age = (NSUInteger)[_ageTextField.text integerValue];
    context.user.isPrivate = _isPrivateSwitch.on;
    [context.user save];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGPoint contentOffset;
    contentOffset.x = 0;
    contentOffset.y = _userHeaderLabel.frame.origin.y - 20;
    [self setContentOffset:contentOffset animated:YES];
}

@end
