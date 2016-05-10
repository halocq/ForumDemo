//
//  TabBarController.m
//  ForumDemo
//
//  Created by lufly on 16/5/10.
//  Copyright © 2016年 lufly. All rights reserved.
//

#import "TabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.selectedIndex = 1;
    
    self.tabBar.layer.borderWidth = 0.50;
    self.tabBar.layer.borderColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1].CGColor;
    
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firstVC];
    firstNav.tabBarItem.title = @"首页";
    firstNav.tabBarItem.image = [UIImage imageNamed:@"icon_home_default"];
    firstNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [firstNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:MENU_ITEM_SELECTED_COLOR, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];

    SecondViewController *secondVC = [[SecondViewController alloc] init];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:secondVC];
    secondNav.tabBarItem.title = @"我";
    secondNav.tabBarItem.image = [UIImage imageNamed:@"icon_mine_default"];
    secondNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [secondNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:MENU_ITEM_SELECTED_COLOR, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];

    self.viewControllers = [NSArray arrayWithObjects:firstNav, secondNav, nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
