//
//  TabBarViewController.m
//  Autohaus
//
//  Created by IOS Developer on 3/16/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "TabBarViewController.h"
#import "BaseConfig.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    
//    NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:self.viewControllers];
//    NSInteger TabViewControllerIndex = 0;
//    if (!TABVIEW_SHOW_HOME) {
//        [viewControllers removeObjectAtIndex:TabViewControllerIndex];
//    }
//    else {
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).title = @"Home";
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).image = TAB_HOME_LOGO_NORMAL;
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).selectedImage = TAB_HOME_LOGO_SELECTED;
//        TabViewControllerIndex += 1;
//    }
//    
//    if (!TABVIEW_SHOW_SHOP) {
//        [viewControllers removeObjectAtIndex:TabViewControllerIndex];
//    }
//    else {
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).title = @"Shop";
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).image = TAB_SHOP_LOGO_NORMAL;
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).selectedImage = TAB_SHOP_LOGO_SELECTED;
//        TabViewControllerIndex += 1;
//    }
//    
//    if (!TABVIEW_SHOW_CART) {
//        [viewControllers removeObjectAtIndex:TabViewControllerIndex];
//    }
//    else {
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).title = @"Cart";
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).image = TAB_CART_LOGO_NORMAL;
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).selectedImage = TAB_CART_LOGO_SELECTED;
//        TabViewControllerIndex += 1;
//    }
//    
//    if (!TABVIEW_SHOW_TESTIMONIAL) {
//        [viewControllers removeObjectAtIndex:TabViewControllerIndex];
//    }
//    else {
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).title = @"Testimonials";
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).image = TAB_TESTIMONIALS_LOGO_NORMAL;
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).selectedImage = TAB_TESTIMONIALS_LOGO_SELECTED;
//        TabViewControllerIndex += 1;
//    }
//    
//    if (!TABVIEW_SHOW_MORE) {
//        [viewControllers removeObjectAtIndex:TabViewControllerIndex];
//    }
//    else {
//        
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).title = @"More";
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).image = TAB_MORE_LOGO_NORMAL;
//        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).selectedImage = TAB_MORE_LOGO_SELECTED;
//    }
//    
//    
//    [self setViewControllers: viewControllers];
    
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    NSInteger TabViewControllerIndex = 0;
    
    if (TABVIEW_SHOW_HOME) {
        UIViewController *vc = kStoryboard(@"navHome");
        [viewControllers addObject:vc];
        [self setViewControllers: viewControllers];
        
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).title = @"Home";
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).image = TAB_HOME_LOGO_NORMAL;
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).selectedImage = TAB_HOME_LOGO_SELECTED;
        TabViewControllerIndex += 1;
    }
    
    if (TABVIEW_SHOW_SHOP) {
        UIViewController *vc = kStoryboard(@"navCollect");
        [viewControllers addObject:vc];
        [self setViewControllers: viewControllers];
        
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).title = @"Shop";
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).image = TAB_SHOP_LOGO_NORMAL;
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).selectedImage = TAB_SHOP_LOGO_SELECTED;
        TabViewControllerIndex += 1;
    }
    
    if (TABVIEW_SHOW_CART) {
        UIViewController *vc = kStoryboard(@"navCart");
        [viewControllers addObject:vc];
        [self setViewControllers: viewControllers];
        
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).title = @"Cart";
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).image = TAB_CART_LOGO_NORMAL;
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).selectedImage = TAB_CART_LOGO_SELECTED;
        TabViewControllerIndex += 1;
    }
    
    if (TABVIEW_SHOW_TESTIMONIAL) {
        UIViewController *vc = kStoryboard(@"navAbout");
        [viewControllers addObject:vc];
        [self setViewControllers: viewControllers];
        
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).title = @"Testimonials";
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).image = TAB_TESTIMONIALS_LOGO_NORMAL;
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).selectedImage = TAB_TESTIMONIALS_LOGO_SELECTED;
        TabViewControllerIndex += 1;
    }
    
    if (TABVIEW_SHOW_MORE) {
        UIViewController *vc = kStoryboard(@"navMore");
        [viewControllers addObject:vc];
        [self setViewControllers: viewControllers];
        
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).title = @"More";
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).image = TAB_MORE_LOGO_NORMAL;
        ((UITabBarItem*)self.tabBar.items[TabViewControllerIndex]).selectedImage = TAB_MORE_LOGO_SELECTED;
    }
    
    
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
