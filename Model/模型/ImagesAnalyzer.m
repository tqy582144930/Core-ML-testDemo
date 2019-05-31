//
//  ImagesAnalyzer.m
//  模型
//
//  Created by _祀梦 on 2019/5/31.
//  Copyright © 2019 涂强尧. All rights reserved.
//

#import "ImagesAnalyzer.h"
#import "ImageClassifier.h"
#import <UIKit/UIKit.h>

@interface ImagesAnalyzer ()
@property (nonatomic, strong) ImageClassifier *model;
@end

@implementation ImagesAnalyzer
- (ImagesAnalyzer *)initWithUrl:(NSURL *)url {
    self = [super init];
    if (self) {
        self.model = [[ImageClassifier alloc] initWithContentsOfURL:url error:nil];
    }
    return self;
}

- (NSString *)analyzeImage:(UIImage *)originImage allPossible:(NSMutableDictionary *)allPossibleDictionary {
    CGSize size = CGSizeMake(299, 299);
    UIImage *image = [self image:originImage byScalingToSize:size];
    CVPixelBufferRef imageBuffer = [self GetpixelBufferWithCGImage:image.CGImage];
    ImageClassifierOutput *outPut = [_model predictionFromImage:imageBuffer error:nil];
    [allPossibleDictionary addEntriesFromDictionary:outPut.classLabelProbs];
    return outPut.classLabel;
}

- (CVPixelBufferRef)GetpixelBufferWithCGImage:(CGImageRef)cgimage
{
    NSDictionary *options = @{
                              (NSString*)kCVPixelBufferCGImageCompatibilityKey : @YES,
                              (NSString*)kCVPixelBufferCGBitmapContextCompatibilityKey : @YES,
                              (NSString*)kCVPixelBufferIOSurfacePropertiesKey: [NSDictionary dictionary]
                              };
    CVPixelBufferRef pxbuffer = NULL;
    
    CGFloat frameWidth = CGImageGetWidth(cgimage);
    CGFloat frameHeight = CGImageGetHeight(cgimage);
    
    CVReturn status = CVPixelBufferCreate(kCFAllocatorDefault,
                                          frameWidth,
                                          frameHeight,
                                          kCVPixelFormatType_32BGRA,
                                          (__bridge CFDictionaryRef) options,
                                          &pxbuffer);
    
    NSParameterAssert(status == kCVReturnSuccess && pxbuffer != NULL);
    
    CVPixelBufferLockBaseAddress(pxbuffer, 0);
    void *pxdata = CVPixelBufferGetBaseAddress(pxbuffer);
    NSParameterAssert(pxdata != NULL);
    
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(pxdata,
                                                 frameWidth,
                                                 frameHeight,
                                                 8,
                                                 CVPixelBufferGetBytesPerRow(pxbuffer),
                                                 rgbColorSpace,
                                                 (CGBitmapInfo)kCGImageAlphaNoneSkipFirst);
    NSParameterAssert(context);
    CGContextConcatCTM(context, CGAffineTransformIdentity);
    CGContextDrawImage(context, CGRectMake(0,
                                           0,
                                           frameWidth,
                                           frameHeight),
                       cgimage);
    CGColorSpaceRelease(rgbColorSpace);
    CGContextRelease(context);
    
    CVPixelBufferUnlockBaseAddress(pxbuffer, 0);
    
    return pxbuffer;
}

//需要传过来的参数有:图片 image 和 自定的尺寸
- (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize {
    //原始 iamge
    UIImage *sourceImage = image;
    //新的image用来接收裁剪后的image 开始时为 nil
    UIImage *newImage = nil;
    UIGraphicsBeginImageContext(targetSize);
    CGRect thumbnailRect = CGRectZero;
    //裁剪后的image 的原点和 裁剪前 的 image 的 原点相同
    thumbnailRect.origin = CGPointZero;
    //裁剪后的image 的宽和 指定的宽 相同
    thumbnailRect.size.width  = targetSize.width;
    //裁剪后的image 的长和 指定的长 相同
    thumbnailRect.size.height = targetSize.height;
    //将原始image 在设定的 位置上绘制（裁剪）
    [sourceImage drawInRect:thumbnailRect];
    //把裁剪好的 image 放在 新的image 上
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage ;
}
@end
