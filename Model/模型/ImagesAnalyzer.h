//
//  ImagesAnalyzer.h
//  模型
//
//  Created by _祀梦 on 2019/5/31.
//  Copyright © 2019 涂强尧. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImagesAnalyzer : NSObject
- (ImagesAnalyzer *)initWithUrl:(NSURL *)url;
- (NSString *)analyzeImage:(UIImage *)originImage allPossible:(NSMutableDictionary *)allPossibleDictionary;
@end

NS_ASSUME_NONNULL_END
