//
//  AnalyzeViewController.m
//  模型
//
//  Created by _祀梦 on 2019/6/3.
//  Copyright © 2019 涂强尧. All rights reserved.
//

#import "AnalyzeViewController.h"

@interface AnalyzeViewController ()

@end

@implementation AnalyzeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _analyzeView = [[analyzeView alloc] init];
    _analyzeView.frame = self.view.bounds;\
    
    [self.view addSubview:_analyzeView];

}

@end
