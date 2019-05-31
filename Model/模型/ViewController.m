//
//  ViewController.m
//  模型
//
//  Created by _祀梦 on 2019/5/26.
//  Copyright © 2019 涂强尧. All rights reserved.
//

#import "ViewController.h"
#import "ImagesAnalyzer.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationBarDelegate>
@property (nonatomic, strong) UITextView *allPossibleView;
@property (nonatomic, strong) UILabel *mostLikelyLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) ImagesAnalyzer *imageAnalyze;
@property (nonatomic, strong) UIImagePickerController *pickerController;
@end

//

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *modelUrl = [[NSBundle mainBundle] URLForResource:@"ImageClassifier" withExtension:@"mlmodel"];
    _imageAnalyze = [[ImagesAnalyzer alloc] initWithUrl:modelUrl];

}


@end
