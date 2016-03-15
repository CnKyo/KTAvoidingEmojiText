//
//  KTAvoidingEmojiTextField.m
//  KTAvoidingEmojiText
//
//  Created by tujinqiu on 16/3/15.
//  Copyright © 2016年 tujinqiu. All rights reserved.
//

#import "KTAvoidingEmojiTextField.h"
#import "NSString+Emoji.h"

@interface KTAvoidingEmojiTextField ()

@property (nonatomic, copy) NSString *lastText;

@end

@implementation KTAvoidingEmojiTextField

#pragma mark -- life cycle --

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setup];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [self setup];
    self.lastText = self.text;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:self];
}

#pragma mark -- helpers --

- (void)setup
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextFieldTextDidChangeNotification object:self];
}

#pragma mark -- notifs --

- (void)textDidChange:(NSNotification *)notif
{
    if (!self.shouldAvoidEmoji)
    {
        return;
    }
    
    UITextView *textField = notif.object;
    NSString *addText = [textField.text stringByReplacingOccurrencesOfString:self.lastText withString:@""];
    if ([addText containsEmoji])
    {
        textField.text = self.lastText;
    }
    else
    {
        self.lastText = textField.text;
    }
}

@end
