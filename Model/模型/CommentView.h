//
//  CommentView.h
//  模型
//
//  Created by _祀梦 on 2019/6/3.
//  Copyright © 2019 涂强尧. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentView : UIView
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *takePicturesButton;
@property (nonatomic, strong) UITextView *commentTextView;
@property (nonatomic, strong) UILabel *placeHolderLabel;//自定义文本框placehoder
@property (nonatomic, strong) UILabel *countLabel;//自定义文本框字数统计
@end

NS_ASSUME_NONNULL_END
