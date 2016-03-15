//
//  ViewController.m
//  KTAvoidingEmojiText
//
//  Created by tujinqiu on 16/3/15.
//  Copyright © 2016年 tujinqiu. All rights reserved.
//

#import "ViewController.h"
#import "KTAvoidingEmojiTextView.h"
#import "KTAvoidingEmojiTextField.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet KTAvoidingEmojiTextField *textField;
@property (weak, nonatomic) IBOutlet KTAvoidingEmojiTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.textView.layer.cornerRadius = 5.0;
    self.textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textView.layer.borderWidth = 1.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
