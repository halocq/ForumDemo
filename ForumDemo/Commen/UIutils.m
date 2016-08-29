//
//  UIutil.m
//  DunkShoe
//
//  Created by yantong xie on 1/11/16.
//  Copyright © 2016 Dunkhome. All rights reserved.
//

#import "UIutils.h"
#import "UIImageView+WebCache.h"
#import "UIImage+animatedGIF.h"
#import "DhSignInController.h"
#import "DhWebShowController.h"
#import "AppDelegate.h"
#import "ChatViewController.h"
#import "ChatListViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
#import <LBBlurredImage/UIImageView+LBBlurredImage.h>
#import "DhToHotRuleController.h"
#import "DhNewsShowController.h"
#import "DhProductShowController.h"
#import "DhCategoryShowController.h"
#import "DhFeedShowController.h"
#import "DhTabBarController.h"
#import "DhEvaluationShowController.h"
#import "DhAppraiseShowController.h"
#import "DhDiscoverEvaluationCell.h"
#import "DhNavigationController.h"
#import "DhFeedShowCommentCell.h"
#import "DhFeedCommentsCell.h"
#import "DhFeedPhotoGroup.h"
#import "DhEmptyCell.h"
#import "DhLotteryShowController.h"
#import "DhLotteryController.h"
#import <QuartzCore/QuartzCore.h>
#import "DhProductTagShowController.h"
#import "DhTopicShowController.h"
#import "DhSAProductShowController.h"
#import "DhEvaluationAvatorCell.h"
#import "DhEvaluationContentCell.h"
#import "DhEvaluationPhotosCell.h"
#import "DhEvaluationButtonsCell.h"
#import "DhEvaluationCommentsCell.h"
#import "MyAPIClient.h"
#import "Helper.h"

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
    result.textColor = kNormalFontColor;
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
    UIColor *c = kBorderColor;
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
            imageView.image = [UIImage animatedImageWithAnimatedGIFData:data];
        } else if([imageName hasSuffix:@".png"]){
            imageView.image = [UIImage imageNamed:imageName];
        } else{
            imageView.image = [UIImage imageWithContentsOfFile:filePath];
        }
    }
}
//- (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0);


+ (void) redirectToSignIn:(UIViewController *)vc completion:(void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0) {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    DhSignInController *signInVC = [[DhSignInController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:signInVC];
    [vc presentViewController:nav animated:YES completion:completion];
}

+ (void)pushToWebShow:(UIViewController *)vc withUrl:(NSString *)url withTitle:(NSString *)title {
    DhWebShowController *webShowVC = [[DhWebShowController alloc] init];
    webShowVC.mTitle = title;
    webShowVC.mUrl = url;
    webShowVC.mTranslation = PushIn;
    [webShowVC setHidesBottomBarWhenPushed:YES];
    [vc.navigationController pushViewController:webShowVC animated:YES];
}

+ (void)presentToWebShow:(NSString *)url withTitle:(NSString *)title {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    DhTabBarController *rootVC = (DhTabBarController *)appDelegate.window.rootViewController;
    DhWebShowController *webShowVC = [[DhWebShowController alloc] init];
    webShowVC.mTitle = title;
    webShowVC.mUrl = url;
    webShowVC.mTranslation = PresentIn;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:webShowVC];
    [rootVC presentViewController:nav animated:YES completion:nil];
}

+ (void)pushToWebShow:(NSString *)url withTitle:(NSString *)title {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    DhTabBarController *rootVC = (DhTabBarController *)appDelegate.window.rootViewController;

    DhWebShowController *webShowVC = [[DhWebShowController alloc] init];
    webShowVC.mTitle = title;
    webShowVC.mUrl = url;
    webShowVC.mTranslation = PushIn;
    [webShowVC setHidesBottomBarWhenPushed:YES];

    DhNavigationController *nav = (DhNavigationController *)[rootVC selectedViewController];
    [nav pushViewController:webShowVC animated:YES];
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

+ (void)redirectToSignIn {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    DhTabBarController *rootVC = (DhTabBarController *)appDelegate.window.rootViewController;
    DhSignInController *signInVC = [[DhSignInController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:signInVC];
    [rootVC presentViewController:nav animated:YES completion:nil];
}

+ (void)redirectToChat:(NSString *)userId withUserName:(NSString *)userName withUserAvator:(NSString *)userAvator withMyAvator:(NSString *)myAvator backTo:(NSString *)backName {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    DhTabBarController *rootVC = (DhTabBarController *)appDelegate.window.rootViewController;
    
    ChatViewController *chatVC = [[ChatViewController alloc] initWithUserParams:userId user_name:userName user_avator:userAvator my_avator:myAvator return_to:backName];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:chatVC];
    [rootVC presentViewController:nav animated:YES completion:nil];
}

+ (void)presentFeedRuleController {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    DhTabBarController *rootVC = (DhTabBarController *)appDelegate.window.rootViewController;
    DhToHotRuleController *ruleVC = [[DhToHotRuleController alloc] init];
    ruleVC.navigationItem.title = @"上热门规则";
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:ruleVC];
    [rootVC presentViewController:nav animated:YES completion:nil];

}

+ (UIImage *)boxblurImage:(UIImage *)image WithBlur:(float)blur {
    
    NSData *imageData = UIImageJPEGRepresentation(image, 1); // convert to jpeg
    UIImage* destImage = [UIImage imageWithData:imageData];
    
    
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = destImage.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    
    vImage_Error error;
    
    void *pixelBuffer;
    
    //create vImage_Buffer with data from CGImageRef
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //create vImage_Buffer for output
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    // Create a third buffer for intermediate processing
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    
    //perform convolution
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    
    CGImageRelease(imageRef);
    
    return returnImage;
}

+ (void)schemeRedirect:(NSString *)resourceType withId:(NSString *)resourceId {
    if (!resourceType) {
        return;
    }
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    DhTabBarController *rootVC = (DhTabBarController *)appDelegate.window.rootViewController;
    NSString *kind = [resourceType lowercaseString];
    if ([kind isEqualToString:@"news"] || [kind isEqualToString:@"newsitem"]){
        [rootVC setSelectedIndex:1];
        UINavigationController *nav = (UINavigationController *)rootVC.selectedViewController;
        [nav popToRootViewControllerAnimated:YES];
        if (resourceId) {
            DhNewsShowController *vc = [[DhNewsShowController alloc] init];
            vc.mNewsId = resourceId;
            vc.mNewsUrl = [NSString stringWithFormat:@"http://app.dunkhome.com/v2/news/%@", resourceId];
            [vc setHidesBottomBarWhenPushed:YES];
            [nav pushViewController:vc animated:YES];
        }
        
    } else if ([kind isEqualToString:@"product"]){
        [rootVC setSelectedIndex:3];
        UINavigationController *nav = (UINavigationController *)rootVC.selectedViewController;
        [nav popToRootViewControllerAnimated:YES];
        if (resourceId) {
            DhProductShowController *vc = [[DhProductShowController alloc] init];
            vc.mProductId = resourceId;
            [vc setHidesBottomBarWhenPushed:YES];
            [nav pushViewController:vc animated:YES];
        }
        
    } else if ([kind isEqualToString:@"feed"]){
        [rootVC setSelectedIndex:0];
        UINavigationController *nav = (UINavigationController *)rootVC.selectedViewController;
        [nav popToRootViewControllerAnimated:YES];
        if (resourceId) {
            DhFeedShowController *vc = [[DhFeedShowController alloc] init];
            vc.mFeedId = resourceId;
            [vc setHidesBottomBarWhenPushed:YES];
            [nav pushViewController:vc animated:YES];
        }
        
    } else if ([kind isEqualToString:@"videos"]){
        [rootVC setSelectedIndex:1];
        UINavigationController *nav = (UINavigationController *)rootVC.selectedViewController;
        [nav popToRootViewControllerAnimated:YES];
        if (resourceId) {
            DhNewsShowController *vc = [[DhNewsShowController alloc] init];
            vc.mNewsId = resourceId;
            vc.mNewsUrl = [NSString stringWithFormat:@"http://app.dunkhome.com/v2/videos/%@", resourceId];
            [vc setHidesBottomBarWhenPushed:YES];
            [nav pushViewController:vc animated:YES];
        }
    } else if ([kind isEqualToString:@"haitao"]){
        DhSAProductShowController *vc = [[DhSAProductShowController alloc] init];
        vc.mProductId = resourceId;
        [vc setHidesBottomBarWhenPushed:YES];
        [UIutils pushToController:vc];
    }
    
}
+ (void)bannerTouchAction:(UIViewController *)nav withType:(NSString * _Nonnull)resourceType withId:(NSString * _Nonnull)resourceId{
    if ([resourceType isEqualToString:@"Feed"]) {
        DhFeedShowController *vc = [[DhFeedShowController alloc] init];
        vc.mFeedId = resourceId;
        [vc setHidesBottomBarWhenPushed:YES];
        [nav.navigationController pushViewController:vc animated:YES];
    }else if ([resourceType isEqualToString:@"News"] || [resourceType isEqualToString:@"Newsitem"]){
        DhNewsShowController *vc = [[DhNewsShowController alloc] init];
        vc.mNewsId = resourceId;
        vc.mNewsUrl = [NSString stringWithFormat:@"http://app.dunkhome.com/v2/news/%@", resourceId];
        [vc setHidesBottomBarWhenPushed:YES];
        [nav.navigationController pushViewController:vc animated:YES];
    }else if ([resourceType isEqualToString:@"Video"]){
        DhNewsShowController *vc = [[DhNewsShowController alloc] init];
        vc.mNewsId = resourceId;
        vc.mNewsUrl = [NSString stringWithFormat:@"http://app.dunkhome.com/v2/videos/%@", resourceId];
        [vc setHidesBottomBarWhenPushed:YES];
        [nav.navigationController pushViewController:vc animated:YES];
 
    }else if ([resourceType isEqualToString:@"Product"]){
        DhProductShowController *vc = [[DhProductShowController alloc] init];
        vc.mProductId = resourceId;
        [vc setHidesBottomBarWhenPushed:YES];
        [nav.navigationController pushViewController:vc animated:YES];
    }else if ([resourceType isEqualToString:@"Post"]){
        DhAppraiseShowController *vc = [[DhAppraiseShowController alloc] init];
        vc.mId = resourceId;
        vc.mUrl = [NSString stringWithFormat:@"http://www.dunkhome.com/app_appraise/%@", resourceId];
        [vc setHidesBottomBarWhenPushed:YES];
        [nav.navigationController pushViewController:vc animated:YES];
    }else if ([resourceType isEqualToString:@"Evaluation"]){
        DhEvaluationShowController *vc = [[DhEvaluationShowController alloc] init];
        vc.evaluation_Id = resourceId;
        [vc setHidesBottomBarWhenPushed:YES];
        [nav.navigationController pushViewController:vc animated:YES];
    }else if ([resourceType isEqualToString:@"Lottery"]){
        DhLotteryShowController *vc = [[DhLotteryShowController alloc] init];
        vc.lotteryId = resourceId;
        [vc setHidesBottomBarWhenPushed:YES];
        [nav.navigationController pushViewController:vc animated:YES];
    }else if ([resourceType isEqualToString:@"LotteryIndex"]){
        DhLotteryController *vc = [[DhLotteryController alloc] init];
        [vc setHidesBottomBarWhenPushed:YES];
        [nav.navigationController pushViewController:vc animated:YES];
    }
}

+ (void)bannerTouchAction:(NSDictionary * _Nonnull)data {
    NSString *resourceType = V(data, @"resourceable_type");
    NSString *resourceId = V(data, @"resourceable_id");

    if ([resourceType isEqualToString:@"Feed"]) {
        DhFeedShowController *vc = [[DhFeedShowController alloc] init];
        vc.mFeedId = resourceId;
        [vc setHidesBottomBarWhenPushed:YES];
        [UIutils pushToController:vc];
        
    }else if ([resourceType isEqualToString:@"News"] || [resourceType isEqualToString:@"Newsitem"]){
        DhNewsShowController *vc = [[DhNewsShowController alloc] init];
        vc.mNewsId = resourceId;
        vc.mNewsUrl = [NSString stringWithFormat:@"http://app.dunkhome.com/v2/news/%@", resourceId];
        [vc setHidesBottomBarWhenPushed:YES];
        [UIutils pushToController:vc];
        
    }else if ([resourceType isEqualToString:@"Video"]){
        DhNewsShowController *vc = [[DhNewsShowController alloc] init];
        vc.mNewsId = resourceId;
        vc.mNewsUrl = [NSString stringWithFormat:@"http://app.dunkhome.com/v2/videos/%@", resourceId];
        [vc setHidesBottomBarWhenPushed:YES];
        [UIutils pushToController:vc];
        
    }else if ([resourceType isEqualToString:@"Product"]){
        DhProductShowController *vc = [[DhProductShowController alloc] init];
        vc.mProductId = resourceId;
        [vc setHidesBottomBarWhenPushed:YES];
        [UIutils pushToController:vc];

    }else if ([resourceType isEqualToString:@"Post"]){
        DhAppraiseShowController *vc = [[DhAppraiseShowController alloc] init];
        vc.mId = resourceId;
        vc.mUrl = [NSString stringWithFormat:@"http://www.dunkhome.com/app_appraise/%@", resourceId];
        [vc setHidesBottomBarWhenPushed:YES];
        [UIutils pushToController:vc];
        
    }else if ([resourceType isEqualToString:@"Evaluation"]){
        DhEvaluationShowController *vc = [[DhEvaluationShowController alloc] init];
        vc.evaluation_Id = resourceId;
        [vc setHidesBottomBarWhenPushed:YES];
        [UIutils pushToController:vc];
        
    }else if ([resourceType isEqualToString:@"Lottery"]){
        [MyAPIClient mobEvent:@"v25_banner_lottery"];
        DhLotteryShowController *vc = [[DhLotteryShowController alloc] init];
        vc.lotteryId = resourceId;
        [vc setHidesBottomBarWhenPushed:YES];
        [UIutils pushToController:vc];
        
    }else if ([resourceType isEqualToString:@"LotteryIndex"]){
        [MyAPIClient mobEvent:@"v25_lottery"];
        DhLotteryController *vc = [[DhLotteryController alloc] init];
        [vc setHidesBottomBarWhenPushed:YES];
        [UIutils pushToController:vc];
        
    }else if ([resourceType isEqualToString:@"ProductTag"]) {
        DhProductTagShowController *vc = [[DhProductTagShowController alloc] init];
        vc.mTagId = V(data, @"resourceable_id");
        vc.tagName = V(data, @"resourceable_name");
        [vc setHidesBottomBarWhenPushed:YES];
        [UIutils pushToController:vc];
        
    }else if([resourceType isEqualToString:@"Url"]){
        [UIutils pushToWebShow:V(data, @"url") withTitle:V(data, @"resourceable_name")];
        
    }else if([resourceType isEqualToString:@"FeedTopic"]){
        DhTopicShowController *vc = [[DhTopicShowController alloc] init];
        vc.mTitle = V(data, @"resourceable_name");
        vc.topicId = V(data, @"resourceable_id");
        [UIutils pushToController:vc];
        
    } else if([resourceType isEqualToString:@"ProductCategory"]){
        DhCategoryShowController *vc = [[DhCategoryShowController alloc] init];
        vc.typeData = @{@"category_id":V(data, @"resourceable_id"), @"category_name":V(data, @"resourceable_name")};
        [vc setHidesBottomBarWhenPushed:YES];
        [UIutils pushToController:vc];
    }
}

+ (void)showAlertWithImage:(NSString * _Nonnull)imageName duration:(CGFloat)duration withContent:(NSString * _Nonnull)content{
    UIView *wrapView = [[UIView alloc] initWithFrame:CGRectMake((WIN_WIDTH - 150) / 2, (WIN_HEIGHT - 150) / 2, 150, 150)];
    wrapView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    [wrapView.layer setMasksToBounds:YES];
    wrapView.layer.cornerRadius = 10.f;
    
    UIImageView *image = [UIutils createImageView:CGRectMake((150 - 40) / 2, 20, 40, 30) withImage:imageName];
    [wrapView addSubview:image];
    
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, image.bottom + 15, 120, 0)];
    messageLabel.font = [UIFont systemFontOfSize:12];
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.text = content;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:content];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.lineSpacing = 8;  //行自定义行高度
    [paragraphStyle setFirstLineHeadIndent: 0]; //首行缩进 根据用户昵称宽度在加5个像素
    [attributedString addAttribute: NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange (0 , [content length ])];
    messageLabel.attributedText = attributedString;
    
    messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
    messageLabel.numberOfLines = 0;

    CGSize size = [messageLabel sizeThatFits:CGSizeMake(120, MAXFLOAT)];
    CGRect newFrame = messageLabel.frame;
    newFrame.size.height = size.height;
    messageLabel.frame = newFrame;
    [wrapView addSubview:messageLabel];
    
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         wrapView.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.2
                                               delay: duration
                                             options:UIViewAnimationOptionCurveEaseIn
                                          animations:^{
                                              wrapView.alpha = 0.0;
                                          } completion:^(BOOL finished) {
                                              [wrapView removeFromSuperview];
                                          }];
                     }];

    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows){
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowLevelNormal = window.windowLevel == UIWindowLevelNormal;
        
        if (windowOnMainScreen && windowIsVisible && windowLevelNormal) {
            [window addSubview:wrapView];
            break;
        }
    }
}

+ (UITableViewCell * _Nonnull)createFeedCell:(NSString * _Nonnull)identifier {
    UITableViewCell *cell = nil;
    if ([identifier isEqualToString:@"DiscoverEvaluationCell"]) {
        cell = [[DhDiscoverEvaluationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:@"FeedAvatorCell"]) {
        cell = [[DhFeedAvatorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:@"FeedItemsCell"]) {
        cell = [[DhFeedPhotosCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:@"FeedContentCell"]) {
        cell = [[DhFeedContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:@"FeedLikersCell"]) {
        cell = [[DhFeedLikersCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:@"FeedButtonsCell"]) {
        cell = [[DhFeedButtonsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:@"FeedVoteButtonsCell"]) {
        cell = [[DhFeedVoteButtonsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:@"FeedVoteItemsCell"]) {
        cell = [[DhFeedVoteItemsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:@"FeedShowCommentCell"]){
        cell = [[DhFeedShowCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:@"FeedCommentsCell"]){
        cell = [[DhFeedCommentsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:@"EvaluationAvatorCell"]) {
        cell = [[DhEvaluationAvatorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:@"EvaluationContentCell"]) {
        cell = [[DhEvaluationContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:@"EvaluationPhotosCell"]) {
        cell = [[DhEvaluationPhotosCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:@"EvaluationButtonsCell"]) {
        cell = [[DhEvaluationButtonsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:@"EvaluationCommentsCell"]) {
        cell = [[DhEvaluationCommentsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else {
        cell = [[DhEmptyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FeedCommentCell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

+ (NSString *)getFeedCellIdentifier:(NSString *)cellType {
    NSString *identifier = @"";
    if ([cellType isEqualToString:@"evaluation"]){
        identifier = @"DiscoverEvaluationCell";
    } else if ([cellType isEqualToString:@"avator"]) {
        identifier = @"FeedAvatorCell";
    } else if ([cellType isEqualToString:@"items"]) {
        identifier = @"FeedItemsCell";
    } else if ([cellType isEqualToString:@"content"]) {
        identifier = @"FeedContentCell";
    } else if ([cellType isEqualToString:@"likers"]) {
        identifier = @"FeedLikersCell";
    } else if ([cellType isEqualToString:@"buttons"]) {
        identifier = @"FeedButtonsCell";
    } else if ([cellType isEqualToString:@"vote_buttons"]) {
        identifier = @"FeedVoteButtonsCell";
    } else if ([cellType isEqualToString:@"vote_items"]) {
        identifier = @"FeedVoteItemsCell";
    } else if ([cellType isEqualToString:@"comments"]) {
        identifier = @"FeedCommentsCell";
    } else if ([cellType isEqualToString:@"evaluation_avator"]) {
        identifier = @"EvaluationAvatorCell";
    } else if ([cellType isEqualToString:@"evaluation_content"]) {
        identifier = @"EvaluationContentCell";
    } else if ([cellType isEqualToString:@"evaluation_photos"]) {
        identifier = @"EvaluationPhotosCell";
    } else if ([cellType isEqualToString:@"evaluation_buttons"]) {
        identifier = @"EvaluationButtonsCell";
    } else if ([cellType isEqualToString:@"evaluation_comments"]) {
        identifier = @"EvaluationCommentsCell";
    } else {
        identifier = @"FeedShowCommentCell";
    }
    return identifier;
}

+ (void)pushToController:(UIViewController *)vc {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    DhTabBarController *rootVC = (DhTabBarController *)appDelegate.window.rootViewController;
    if ([[rootVC selectedViewController] isKindOfClass:[DhNavigationController class]]) {
        DhNavigationController *nav = (DhNavigationController *)[rootVC selectedViewController];
        [nav pushViewController:vc animated:YES];
    } else {
        okAlert(@"can not find the navigation controller");
    }
}

+ (void)popViewController {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    DhTabBarController *rootVC = (DhTabBarController *)appDelegate.window.rootViewController;
    if ([[rootVC selectedViewController] isKindOfClass:[DhNavigationController class]]) {
        DhNavigationController *nav = (DhNavigationController *)[rootVC selectedViewController];
        [nav popViewControllerAnimated:YES];
    } else {
        okAlert(@"can not find the navigation controller");
    }
}

+ (void)presentToController:(UIViewController *)vc {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    DhTabBarController *rootVC = (DhTabBarController *)appDelegate.window.rootViewController;
    [rootVC presentViewController:vc animated:YES completion:nil];
}

+ (BOOL)CheckIsIdentityCard: (NSString *)identityCard
{
    //判断是否为空
    if (identityCard==nil||identityCard.length <= 0) {
        return NO;
    }
    //判断是否是18位，末尾是否是x
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[X])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    if(![identityCardPredicate evaluateWithObject:identityCard]){
        return NO;
    }
    //判断生日是否合法
    NSRange range = NSMakeRange(6,8);
    NSString *datestr = [identityCard substringWithRange:range];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat : @"yyyyMMdd"];
    if([formatter dateFromString:datestr]==nil){
        return NO;
    }
    
    //判断校验位
    if(identityCard.length==18)
    {
        NSArray *idCardWi= @[ @"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2" ]; //将前17位加权因子保存在数组里
        NSArray * idCardY=@[ @"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2" ]; //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        int idCardWiSum=0; //用来保存前17位各自乖以加权因子后的总和
        for(int i=0;i<17;i++){
            idCardWiSum+=[[identityCard substringWithRange:NSMakeRange(i,1)] intValue]*[idCardWi[i] intValue];
        }
        
        int idCardMod=idCardWiSum%11;//计算出校验码所在数组的位置
        NSString *idCardLast=[identityCard substringWithRange:NSMakeRange(17,1)];//得到最后一位身份证号码
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2){
            if([idCardLast isEqualToString:@"X"]){
                return YES;
            }else{
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast intValue]==[idCardY[idCardMod] intValue]){
                return YES;
            }else{
                return NO;
            }
        }
    }
    return NO;
}

+ (NSString *)getFolatMoney:(NSString *)money{
    return [NSString stringWithFormat:@"%.2f", [money floatValue]];
}

@end

