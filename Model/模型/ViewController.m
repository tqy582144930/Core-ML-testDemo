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


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *modelUrl = [[NSBundle mainBundle] URLForResource:@"ImageClassifier" withExtension:@"mlmodel"];
    _imageAnalyze = [[ImagesAnalyzer alloc] initWithUrl:modelUrl];

}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.pickerController.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
        UIBarButtonItem* button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(showCamera:)];
        viewController.navigationItem.leftBarButtonItems = [NSArray arrayWithObject:button];
        viewController.navigationController.navigationBarHidden = NO; // important
    } else {
        UIBarButtonItem* button = [[UIBarButtonItem alloc] initWithTitle:@"Library" style:UIBarButtonItemStylePlain target:self action:@selector(showLibrary:)];
        viewController.navigationItem.leftBarButtonItems = [NSArray arrayWithObject:button];
        viewController.navigationItem.title = @"Take Photo";
        viewController.navigationController.navigationBarHidden = NO; // important
    }
}

- (void) showCamera: (id) sender {
    self.pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
}

- (void) showLibrary: (id) sender {
    self.pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
}


@end
