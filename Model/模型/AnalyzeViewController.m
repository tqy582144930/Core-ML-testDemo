//
//  AnalyzeViewController.m
//  模型
//
//  Created by _祀梦 on 2019/6/3.
//  Copyright © 2019 涂强尧. All rights reserved.
//

#import "AnalyzeViewController.h"
#include "ImagesAnalyzer.h"

@interface AnalyzeViewController ()
@property (nonatomic, strong) ImagesAnalyzer *analyzer;
@end

@implementation AnalyzeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _analyzeView = [[analyzeView alloc] init];
    _analyzeView.frame = self.view.bounds;
    [self.view addSubview:_analyzeView];
    _analyzeView.pictuerImageView.image = _analyzeImage;
    NSURL *modelUrl = [[NSBundle mainBundle] URLForResource:@"ImageClassifier" withExtension:@"mlmodelc"];
    _analyzer = [[ImagesAnalyzer alloc] initWithUrl:modelUrl];
    [self analyzePictures];
    
    [_analyzeView.cancelButton addTarget:self action:@selector(clickCancelButton:) forControlEvents:UIControlEventTouchUpInside];
    [_analyzeView.sureButton addTarget:self action:@selector(clickSureButton:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)analyzePictures {
    NSMutableString *messageString = [NSMutableString new];
    NSMutableDictionary *allDictionary = [NSMutableDictionary new];
    
    NSString *labelString = [_analyzer analyzeImage:_analyzeImage allPossible:allDictionary];
    
//    [[allDictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        [messageString appendFormat:@"%@  -  %.02f%%\n", key, obj.floatValue*100];
//    }];
    NSLog(@"labelString = %@", labelString);
    NSLog(@"allDictionary = %@", allDictionary);
}

- (void)clickCancelButton:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)clickSureButton:(UIButton *)button {
    
}

@end
