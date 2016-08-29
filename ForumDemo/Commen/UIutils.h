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

+ (UILabel*)createCircleLabel:(CGRect)frame withBGColor:(UIColor *)bgColor withFontColor:(UIColor *)fontColor withFontSize:(CGFloat)fontSize;

+ (UIView *)createTipDot:(CGRect)frame;
    
+ (UITextView*)createTextViewWithText:(NSString*)string frame:(CGRect)frame;

+ (UITextField*)createTextFieldWithText:(NSString*)string frame:(CGRect)frame;

+ (UIButton*)createButtonWithText:(NSString*)string frame:(CGRect)frame;

+ (void)updateImage:(UIImageView*)imageView imageName:(NSString *)imageName placeholderImage:(NSString *)placeholderImageName options:(NSDictionary *)options;


+ (void)redirectToSignIn;

+ (void)schemeRedirect:(NSString *)resourceType withId:(NSString *)resourceId;


+ (void)redirectToSignIn:(UIViewController *)vc completion:(void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0);

+ (void)pushToWebShow:(UIViewController * _Nonnull)vc withUrl:(NSString * _Nonnull)url withTitle:(NSString * _Nullable)title;

+ (void)presentToWebShow:(NSString * _Nonnull)url withTitle:(NSString  * _Nullable)title;

+ (UIButton * _Nonnull)createBackButton:(UIViewController * _Nonnull)vc;

+ (void)presentFeedRuleController;

+ (void)redirectToChat:(NSString * _Nullable)userId withUserName:(NSString * _Nullable)userName withUserAvator:(NSString * _Nullable)userAvator withMyAvator:(NSString * _Nullable)myAvator backTo:(NSString * _Nullable)backName;

+ (UIImage *_Nullable)boxblurImage:(UIImage * _Nonnull)image WithBlur:(float)factor;

+ (void)bannerTouchAction:(UIViewController * _Nonnull)vc withType:(NSString * _Nonnull)resourceType withId:(NSString * _Nonnull)resourceId;
+ (void)bannerTouchAction:(NSDictionary * _Nonnull)data;

+ (void)showAlertWithImage:(NSString * _Nonnull)imageName duration:(CGFloat)duration withContent:(NSString * _Nonnull)content;

+ (UITableViewCell * _Nonnull)createFeedCell:(NSString * _Nonnull)identifier;
+ (NSString * _Nonnull)getFeedCellIdentifier:(NSString * _Nonnull)cellType;

+ (void)pushToController:(UIViewController * _Nonnull)vc;
+ (void)popViewController;
+ (void)presentToController:(UIViewController * _Nonnull)vc;

+ (void)pushToWebShow:(NSString * _Nonnull)url withTitle:(NSString * _Nonnull)title;

+ (BOOL)CheckIsIdentityCard: (NSString * _Nonnull)identityCard;

+ (NSString *)getFolatMoney:(NSString *)money;

@end
