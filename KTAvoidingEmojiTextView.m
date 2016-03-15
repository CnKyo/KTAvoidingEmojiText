//
//  KTAvoidingEmojiTextView.m
//  KTAvoidingEmojiText
//
//  Created by tujinqiu on 16/3/15.
//  Copyright © 2016年 tujinqiu. All rights reserved.
//

#import "KTAvoidingEmojiTextView.h"
#import "NSString+Emoji.h"

@interface KTAvoidingEmojiTextView ()

@property (nonatomic, copy) NSString *lastText;

@end

@implementation KTAvoidingEmojiTextView

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
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
}

#pragma mark -- helpers --

- (void)setup
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
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
