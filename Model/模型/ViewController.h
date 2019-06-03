//
//  ViewController.h
//  模型
//
//  Created by _祀梦 on 2019/5/26.
//  Copyright © 2019 涂强尧. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "CommentView.h"

@protocol SendImage <NSObject>

- (void)sendImage:(UIImage *)image;

@end

@interface ViewController : UIViewController
@property (nonatomic, strong) CommentView *commentView;
@property (strong, nonatomic) UIImagePickerController *picker;
@property (nonatomic, weak) id <SendImage> delegate;
@end

