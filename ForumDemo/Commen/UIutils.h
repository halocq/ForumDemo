//
//  UIutil.h
//  DunkShoe
//
//  Created by yantong xie on 1/11/16.
//  Copyright © 2016 Dunkhome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIutils : NSObject

+ (UIView *)createLineView:(CGRect)frame;

+ (UIImageView *)createImageView:(CGRect)frame;
+ (UIImageView *)createImageView:(CGRect)frame withImage:(NSString *)imageName;

+ (UIImageView *)createCircleImageView:(CGRect)frame;
+ (UIImageView *)createBorderCircleImageView:(CGRect)frame;

+ (UILabel*)createBoldLabelWithText:(NSString*)string frame:(CGRect)frame withSize:(float)size;

+ (UILabel*)createLabelWithText:(NSString*)string frame:(CGRect)frame;
+ (UILabel*)createLabelWithText:(NSString*)string frame:(CGRect)frame withSize:(float)size;
+ (UILabel*)createLabelWithText:(NSString*)string frame:(CGRect)frame withSize:(float)size withColor:(UIColor *)color;

+ (void) updateImage:(UIImageView*)imageView imageName:(NSString *)imageName placeholderImage:(NSString *)placeholderImageName options:(NSDictionary *)options;

+ (void)popViewController;
+ (void)pushToController:(UIViewController *)vc;
+ (void)presentToController:(UIViewController *)vc;
@end
