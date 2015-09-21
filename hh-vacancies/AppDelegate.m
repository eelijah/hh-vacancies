//
//  AppDelegate.m
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import "AppDelegate.h"
#import "ServiceLayer.h"
#import "VacanciesTableViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) VacanciesTableViewController *tableViewController;
@property (nonatomic, strong) UINavigationController *navigationController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Init Service layer as spine of all system
    [ServiceLayer sharedServiceLayer];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    UIWindow *window = [[UIWindow alloc]initWithFrame:screenBounds];
    self.tableViewController = [[VacanciesTableViewController alloc]initWithStyle:UITableViewStylePlain];
    self.navigationController = [[UINavigationController alloc]initWithRootViewController:self.tableViewController];
    [window setRootViewController:self.navigationController];
    [window makeKeyAndVisible];
    [self setWindow:window];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
