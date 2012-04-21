//
//  AppDelegate.m
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 12/3/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import "AppDelegate.h"

#import "OverviewViewController.h"
#import <comScore/CSComScore.h>
#import "defines.h"


@implementation AppDelegate

@synthesize window = _window;
@synthesize navigationController;

- (void)dealloc
{
    [_window release];
    [navigationController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    OverviewViewController *viewController = [[[OverviewViewController alloc] initWithNibName:@"OverviewViewController" bundle:nil] autorelease];

    navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent]; 
    navigationController.navigationBarHidden = YES; 
    
    // setup comscore
    [[CSComScore comScore] setSalt:@"b5e95cf21f7e00eb6b3f055323edd7e7"];
    [[CSComScore comScore] setPixelURL:kComScoreBasePixelURL];
    
    // report comscore app start
    NSString *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Bundle version"];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:appVersion, @"version", nil];
    [[CSComScore comScore] notifyWithApplicationEventType:Start andLabels:dict];
    
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
