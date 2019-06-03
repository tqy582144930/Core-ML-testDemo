//
//  analyzeView.m
//  模型
//
//  Created by _祀梦 on 2019/6/3.
//  Copyright © 2019 涂强尧. All rights reserved.
//

#import "analyzeView.h"

@implementation analyzeView

- (instancetype)init {
    self = [super init];
    if (self) {
        _pictuerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(130, 200, 150, 150)];
        [self addSubview:_pictuerImageView];
        
        _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 200 + 150 + 50, 50, 30)];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [self addSubview:_cancelButton];
        _cancelButton.backgroundColor = [UIColor greenColor];
        _cancelButton.layer.cornerRadius = 3;
        _cancelButton.layer.borderWidth = 0.8f;
        _cancelButton.layer.borderColor = [UIColor grayColor].CGColor;
        
        _sureButton = [[UIButton alloc] initWithFrame:CGRectMake(300, 200 + 150 + 50, 50, 30)];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [self addSubview:_sureButton];
        _sureButton.backgroundColor = [UIColor greenColor];
        _sureButton.layer.cornerRadius = 3;
        _sureButton.layer.borderWidth = 0.8f;
        _sureButton.layer.borderColor = [UIColor grayColor].CGColor;
        
    }
    return self;
}

@end
