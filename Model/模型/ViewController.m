//
//  ViewController.m
//  模型
//
//  Created by _祀梦 on 2019/5/26.
//  Copyright © 2019 涂强尧. All rights reserved.
//
#import "ViewController.h"
#import "ImagesAnalyzer.h"
#include "AnalyzeViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
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
    _commentView = [[CommentView alloc] init];
    _commentView.frame = self.view.bounds;
    [_commentView.takePicturesButton addTarget:self action:@selector(ClickedTakePictureButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_commentView];
    
    self.picker.delegate = self;
    self.picker.allowsEditing = YES;
    
//    NSURL *modelUrl = [[NSBundle mainBundle] URLForResource:@"ImageClassifier" withExtension:@"mlmodel"];
//    _imageAnalyze = [[ImagesAnalyzer alloc] initWithUrl:modelUrl];

}

- (UIImagePickerController *)picker
{
    if (!_picker) {
        _picker = [[UIImagePickerController alloc] init];
    }
    return _picker;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //    获取图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
//    [_commentView.takePicturesButton setImage:image forState:UIControlStateNormal];
    
    //    获取图片后返回
//    [picker dismissViewControllerAnimated:YES completion:nil];
    AnalyzeViewController *viewController = [[AnalyzeViewController alloc] init];
    viewController.analyzeImage = [[UIImage alloc] init];
    viewController.analyzeImage = image;
    [picker presentViewController:viewController animated:YES completion:nil];
}

//按取消按钮时候的功能
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //    返回
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)ClickedTakePictureButton:(UIButton *)sender {
    BOOL isPicker = NO;
    //            判断相机是否可用
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        isPicker = true;
    }
    
    if (isPicker) {
        [self presentViewController:self.picker animated:YES completion:nil];
    }else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"错误" message:@"相机不可用" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
