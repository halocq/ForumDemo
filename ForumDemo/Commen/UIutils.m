//
//  UIutil.m
//  DunkShoe
//
//  Created by yantong xie on 1/11/16.
//  Copyright © 2016 Dunkhome. All rights reserved.
//

#import "UIutils.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>
#import "APIClient.h"
#import "AppDelegate.h"
#import "TabBarController.h"

#define kdefaultFont [UIFont systemFontOfSize:14.0f]
//无数据时的文字颜色
#define kNoDataTitleColor      kColor(160,160,160,1)
#define kBackGrayColor         kColor(221,221,221,1)
#define kNormalFontColor kColor(74, 74, 74,1)


//无数据时的文字大小
#define kNoDataTitleSize 18

@implementation UIutils

+ (UILabel*)createLabelWithText:(NSString*)string frame:(CGRect)frame {
    UILabel *result = [[UILabel alloc] initWithFrame:frame];
    result.numberOfLines = 0;
    result.backgroundColor = [UIColor clearColor];
    result.textColor = C2;
    result.text = string;
    result.font = kdefaultFont;
    
    return result ;
}

+ (UILabel*)createLabelWithText:(NSString*)string frame:(CGRect)frame withSize:(float)size {
    UILabel *result = [[UILabel alloc] initWithFrame:frame];
    result.numberOfLines = 0;
    result.backgroundColor = [UIColor clearColor];
    result.textColor = C2;
    result.text = string;
    result.font = [UIFont systemFontOfSize:size];
    
    return result ;
}

+ (UILabel*)createBoldLabelWithText:(NSString*)string frame:(CGRect)frame withSize:(float)size {
    UILabel *result = [[UILabel alloc] initWithFrame:frame];
    result.numberOfLines = 0;
    result.backgroundColor = [UIColor clearColor];
    result.textColor = C2;
    result.text = string;
    result.font = [UIFont boldSystemFontOfSize:size];
    
    return result ;
}

+ (UILabel*)createLabelWithText:(NSString*)string frame:(CGRect)frame withSize:(float)size withColor:(UIColor *)color {
    UILabel *result = [[UILabel alloc] initWithFrame:frame];
    result.numberOfLines = 0;
    result.backgroundColor = [UIColor clearColor];
    result.textColor = color;
    result.text = string;
    result.font = [UIFont systemFontOfSize:size];
    
    return result ;
}


+ (UILabel*)createCircleLabel:(CGRect)frame withBGColor:(UIColor *)bgColor withFontColor:(UIColor *)fontColor withFontSize:(CGFloat)fontSize {
    UILabel *result = [[UILabel alloc] initWithFrame:frame];
    result.numberOfLines = 1;
    result.textAlignment = NSTextAlignmentCenter;
    result.backgroundColor = bgColor;
    result.textColor = fontColor;
    result.text = @"";
    result.font = [UIFont systemFontOfSize:fontSize];
    result.layer.masksToBounds = YES;
    result.layer.cornerRadius = frame.size.height/2.0;
    
    return result ;
}

+ (UIView *)createTipDot:(CGRect)frame{
    UIView *result = [[UIView alloc] initWithFrame:frame];
    result.backgroundColor = [UIColor redColor];
    result.layer.masksToBounds = YES;
    result.layer.cornerRadius = frame.size.height/2.0;
    return result;
}

+ (UITextView*)createTextViewWithText:(NSString*)string frame:(CGRect)frame {
    UITextView *result = [[UITextView alloc] initWithFrame:frame];
    result.text = string;
    result.backgroundColor = [UIColor clearColor];
    result.textColor = [UIColor blackColor];
    result.font = kdefaultFont;
    
    return result;
}

+ (UITextField*)createTextFieldWithText:(NSString*)string frame:(CGRect)frame {
    UITextField *result = [[UITextField alloc] initWithFrame:frame];
    //result.text = string;
    result.placeholder = string;
    result.font = [UIFont systemFontOfSize:12.0f];
    result.backgroundColor = [UIColor clearColor];
    result.textColor = C2;
    result.font = kdefaultFont;
    
    return result;
}

+ (UIButton*)createButtonWithText:(NSString*)string frame:(CGRect)frame {
    UIButton *result = [UIButton buttonWithType:UIButtonTypeCustom];
    [result setFrame:frame];
    [result setTitle: string forState:UIControlStateNormal];
    result.backgroundColor = [UIColor clearColor];
    [result setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    return result;
}

+ (UIImageView *)createImageView:(CGRect)frame {
    return [self createImageView:frame withImage:@""];
}

+ (UIImageView *)createImageView:(CGRect)frame withImage:(NSString *)imageName {
    UIImageView *result = [[UIImageView alloc] initWithFrame:frame];
    result.contentMode = UIViewContentModeScaleAspectFill;
    result.clipsToBounds = YES;
    if (imageName == nil) {
        result.image = [UIImage imageNamed:@"default.png"];
    } else {
        result.image = [UIImage imageNamed:imageName];
    }
    
    return result;
}

+ (UIView *)createLineView:(CGRect)frame{
    UIView *result = [[UIView alloc] initWithFrame:frame];
    result.backgroundColor = C7;
    return result;
}

+ (UIImageView *)createCircleImageView:(CGRect)frame {
    UIImageView *result = [[UIImageView alloc] initWithFrame:frame];
    result.contentMode = UIViewContentModeScaleAspectFill;
    result.clipsToBounds = YES;
    result.image = [UIImage imageNamed:@"Default.png"];
    result.layer.masksToBounds = YES;
    result.layer.cornerRadius = frame.size.height/2.0;
    
    return result;
}

+ (UIImageView *)createBorderCircleImageView:(CGRect)frame {
    UIImageView *result = [[UIImageView alloc] initWithFrame:frame];
    result.contentMode = UIViewContentModeScaleAspectFill;
    result.clipsToBounds = YES;
    result.image = [UIImage imageNamed:@"default.png"];
    result.layer.masksToBounds = YES;
    result.layer.cornerRadius = frame.size.height/2.0;
    UIColor *c = C8;
    result.layer.borderColor = [c CGColor];
    result.layer.borderWidth = 0.5f;
    
    return result;
}


+ (void) updateImage:(UIImageView*)imageView imageName:(NSString *)imageName placeholderImage:(NSString *)placeholderImageName options:(NSDictionary *)options
{
    UIImage *placeholderImage;
    if (placeholderImageName != nil) {
        placeholderImage = [UIImage imageNamed:placeholderImageName];
    }
    if (([imageName isEqual:@""] || imageName == nil || [imageName isEqual:[NSNull null]]) && ![placeholderImageName isEqual:@""]) {
        imageName = placeholderImageName;
    }
    
    if ([imageName hasPrefix:@"http"]) {
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:@"default"]];
        /*
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            imageView.alpha = 1.0;
            [UIView transitionWithView:imageView duration:0.5 options:UIViewAnimationOptionCurveEaseIn  animations:^{
                imageView.alpha = 1.0;
            } completion:NULL];
        }];
         */
    } else {
        if ([imageName isEqual:@""]) return;
        NSArray *fileAttrs = [imageName componentsSeparatedByString:@"."];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileAttrs objectAtIndex:0] ofType:[fileAttrs objectAtIndex:1]];
        if ([imageName hasSuffix:@".gif"]) {
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            //imageView.image = [UIImage animatedImageWithAnimatedGIFData:data];
        } else if([imageName hasSuffix:@".png"]){
            imageView.image = [UIImage imageNamed:imageName];
        } else{
            imageView.image = [UIImage imageWithContentsOfFile:filePath];
        }
    }
}

+ (UIButton *)createBackButton:(UIViewController *)vc {
    UIButton *vBackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    vBackBtn.frame = CGRectMake(0, 0, 60, 40);
    [vBackBtn setImage:[UIImage imageNamed:@"icon_nav_back.png"] forState:UIControlStateNormal];
    [vBackBtn setImageEdgeInsets:UIEdgeInsetsMake(5, -15, 5, 40)]; // top,left,bottom,right
    [vBackBtn setTitle:@"" forState:UIControlStateNormal];
    [vBackBtn addTarget:vc action:@selector(handleBackAction:) forControlEvents:UIControlEventTouchUpInside];
    [vBackBtn setTintColor:[UIColor grayColor]];
    return vBackBtn;
}

+ (void)pushToController:(UIViewController *)vc {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    TabBarController *rootVC = (TabBarController *)appDelegate.window.rootViewController;
    if ([[rootVC selectedViewController] isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)[rootVC selectedViewController];
        [nav pushViewController:vc animated:YES];
    } else {
        okAlert(@"can not find the navigation controller");
    }
}

+ (void)popViewController {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    TabBarController *rootVC = (TabBarController *)appDelegate.window.rootViewController;
    if ([[rootVC selectedViewController] isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)[rootVC selectedViewController];
        [nav popViewControllerAnimated:YES];
    } else {
        okAlert(@"can not find the navigation controller");
    }
}

+ (void)presentToController:(UIViewController *)vc {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    TabBarController *rootVC = (TabBarController *)appDelegate.window.rootViewController;
    [rootVC presentViewController:vc animated:YES completion:nil];
}

@end

