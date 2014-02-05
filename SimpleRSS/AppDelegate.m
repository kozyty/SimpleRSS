//
//  AppDelegate.m
//  SimpleRSS
//
//  Created by kozyty on 2014/01/28.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [UIApplication sharedApplication].statusBarHidden = NO;
    [self fadeSplashScreen];
    // Override point for customization after application launch.
    return YES;
}

- (void)fadeSplashScreen {
    UIImage *splash = [UIImage imageNamed:@"Default-568h@2x"];
    NSLog(@"%@", splash);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0.0, 640, 1136)];
    imageView.image = splash;
    [self.window addSubview:imageView];
    
    self.window.alpha = 1.0f;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.9f];
    imageView.alpha = 0.0f;
    [UIView commitAnimations];
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
