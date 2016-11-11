#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [FIRApp configure];
    
//    for (NSString *family in [UIFont familyNames]){
//        NSLog(@"Family name: %@", family);
//        for (NSString *fontName in [UIFont fontNamesForFamilyName:family]) {
//            NSLog(@"    >Font name: %@", fontName);
//        }
//    }
    
    // NavigationBar
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.78 green:0.18 blue:0.56 alpha:1.0], NSForegroundColorAttributeName, [UIFont fontWithName:@"ArialRoundedMTBold" size:20.0], NSFontAttributeName,nil]];
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0.82 green:0.39 blue:0.65 alpha:1.0]];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    // TabBar
    [[UITabBar appearance] setTintColor:[UIColor darkGrayColor]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setTranslucent:NO];
    [[UITabBar appearance] setUnselectedItemTintColor:[UIColor lightGrayColor]];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
