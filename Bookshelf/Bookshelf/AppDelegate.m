//
//  AppDelegate.m
//  Bookshelf
//
//  Created by Shawn Allen on 10/10/12.
//  Copyright (c) 2012 Pearson, LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "BookshelfLayout.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] initWithCollectionViewLayout:[[BookshelfLayout alloc] init]];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
