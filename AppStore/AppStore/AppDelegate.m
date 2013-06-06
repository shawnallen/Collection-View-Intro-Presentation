//
//  AppDelegate.m
//  AppStore
//
//  Created by Shawn Allen on 10/30/12.
//  Copyright (c) 2012 Pearson, LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "StoreLayout.h"

@interface AppDelegate ()
@property (nonatomic) ViewController *viewController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] initWithCollectionViewLayout:[[StoreLayout alloc] init]];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
