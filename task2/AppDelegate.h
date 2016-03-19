//
//  AppDelegate.h
//  task2
//
//  Created by lncsikkel on 15/03/16.
//  Copyright © 2016 LodewijkSikkel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
//    UINavigationController *navController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) UINavigationController *navController; // ARC will keep track of the retain count and releases this object accordingly
@property (nonatomic) ViewController *viewController; // " " 

@end

