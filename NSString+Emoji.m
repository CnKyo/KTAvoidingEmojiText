//
//  NSString+Emoji.m
//  KTAvodingEmojiText
//
//  Created by tujinqiu on 16/3/15.
//  Copyright © 2016年 tujinqiu. All rights reserved.
//

#import "NSString+Emoji.h"

@implementation NSString (Emoji)

- (BOOL)containsEmoji
{
    __block BOOL containsEmoji = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
                              unichar hs = [substring characterAtIndex:0];
                              if (0xd800 <= hs && hs <= 0xdbff)
                              {
                                  if (substring.length > 1)
                                  {
                                      unichar ls = [substring characterAtIndex:1];
                                      int uc = (hs - 0xd800) * 0x400 + (ls - 0xdc00) + 0x10000;
                                      if (0x1d000 <= uc && uc <= 0x1f77f)
                                      {
                                          *stop = YES;
                                          containsEmoji = YES;
                                      }
                                  }
                              }
                              else if (substring.length > 1)
                              {
                                  unichar ls = [substring characterAtIndex:1];
                                  if (ls == 0x20e3)
                                  {
                                      *stop = YES;
                                      containsEmoji = YES;
                                  }
                              }
                              else
                              {
                                  if ((0x2100 <= hs && hs <= 0x27ff) ||
                                      (0x2b05 <= hs && hs <= 0x2b07) ||
                                      (0x2934 <= hs && hs <= 0x2935) ||
                                      (0x3297 <= hs && hs <= 0x3299) ||
                                      hs == 0xa9 || hs == 0xae ||
                                      hs == 0x303d || hs == 0x3030 ||
                                      hs == 0x2b55 || hs == 0x2b1c ||
                                      hs == 0x2b1b || hs == 0x2b50)
                                  {
                                      *stop = YES;
                                      containsEmoji = YES;
                                  }
                              }
                          }];
    
    return containsEmoji;
}

@end
