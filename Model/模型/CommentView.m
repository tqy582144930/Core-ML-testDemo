//
//  CommentView.m
//  模型
//
//  Created by _祀梦 on 2019/6/3.
//  Copyright © 2019 涂强尧. All rights reserved.
//

#import "CommentView.h"


@interface CommentView ()<UITextViewDelegate>

@end

@implementation CommentView
- (instancetype)init {
    self = [super init];
    if (self) {
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 55, 200, 30)];
        _nameLabel.text = @"西安邮电大学";
        [self addSubview:_nameLabel];
        
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 90, [UIScreen mainScreen].bounds.size.width, 0.8)];
        [self addSubview:_lineView];
        _lineView.backgroundColor= [UIColor blackColor];
        
        _takePicturesButton = [[UIButton alloc] init];
        _takePicturesButton.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 120) / 2, 45+130, 120, 120);
        [_takePicturesButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [self addSubview:_takePicturesButton];
        _takePicturesButton.layer.cornerRadius = 60;
        _takePicturesButton.backgroundColor = [UIColor blackColor];
        
        self.commentTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 45+50+120+140, [UIScreen mainScreen].bounds.size.width - 40, 150)];
        [self addSubview:_commentTextView];
        self.commentTextView.delegate = self;
        self.commentTextView.font = [UIFont systemFontOfSize:16.5f];
        self.commentTextView.textColor = [UIColor blackColor];
        self.commentTextView.keyboardType = UIKeyboardTypeDefault;
        self.commentTextView.returnKeyType = UIReturnKeyDefault;
        _commentTextView.layer.cornerRadius = 15;
        _commentTextView.layer.borderWidth = 0.8f;
        _commentTextView.layer.borderColor = [UIColor grayColor].CGColor;

//        // 自定义文本框placeholder
//        self.placeHolderLabel = [[UILabel alloc] init];
//        self.placeHolderLabel.text = @"添加评论...";
//        self.placeHolderLabel.font = [UIFont fontWithName:@"Arial" size:16.5f];
//        self.placeHolderLabel.backgroundColor = [UIColor clearColor];
//        self.placeHolderLabel.enabled = NO;
//        [_commentTextView addSubview:_placeHolderLabel];
//        // 自定义文本框字数统计
//        self.countLabel = [[UILabel alloc] init];
//        self.countLabel.text = @"0/140";
//        self.countLabel.tintColor = [UIColor blackColor];
//        self.countLabel.textAlignment = NSTextAlignmentRight;
//        self.countLabel.font = [UIFont fontWithName:@"Arial" size:15.0f];
//        self.countLabel.backgroundColor = [UIColor clearColor];
//        self.countLabel.enabled = NO;
//        [_commentTextView addSubview:_countLabel];
    }
    return self;
}

@end
