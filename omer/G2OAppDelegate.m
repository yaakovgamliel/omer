//
//  AppDelegate.m
//  omer
//
//  Created by yaakov gamliel on 4/6/14.
//  Copyright (c) 2014 Yaakov Gamliel. All rights reserved.
//

#import "G2OAppDelegate.h"
//#import "CounterStoreManager.h"

@implementation G2OAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];

    [[UIApplication sharedApplication]setApplicationIconBadgeNumber:0];

    [self schduleNotifications];
    [self updateBadgeCount];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [self updateBadgeCount];

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self updateBadgeCount];

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
    [self updateBadgeCount];
}
- (void)schduleNotifications {
    
	[[UIApplication sharedApplication] cancelAllLocalNotifications];
    
	Class cls = NSClassFromString(@"UILocalNotification");
	if (cls != nil) {
		
		UILocalNotification *notif = [[cls alloc] init];
        
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setHour:20];
        [comps setMinute:30];
        
        NSCalendar *hebrewCalendar = [[NSCalendar alloc]
                                      initWithCalendarIdentifier:NSGregorianCalendar];
        
        NSDate *date = [hebrewCalendar dateFromComponents:comps];

    
		notif.fireDate = date;
		notif.timeZone = [NSTimeZone defaultTimeZone];
		
		notif.alertBody = NSLocalizedString(@"Please count the Omer", nil);
		notif.soundName = UILocalNotificationDefaultSoundName;
    
        notif.repeatInterval = NSCalendarUnitDay;
						
		[[UIApplication sharedApplication] scheduleLocalNotification:notif];
	}
    
    if (cls != nil) {
		
		UILocalNotification *notif = [[cls alloc] init];
        
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setHour:22];
        [comps setMinute:00];
        
        NSCalendar *hebrewCalendar = [[NSCalendar alloc]
                                      initWithCalendarIdentifier:NSGregorianCalendar];
        
        NSDate *date = [hebrewCalendar dateFromComponents:comps];
        
        
		notif.fireDate = date;
		notif.timeZone = [NSTimeZone defaultTimeZone];
		
		notif.alertBody = NSLocalizedString(@"Please count the Omer", nil);
		notif.soundName = UILocalNotificationDefaultSoundName;
        
        notif.repeatInterval = NSCalendarUnitDay;
        
		[[UIApplication sharedApplication] scheduleLocalNotification:notif];
	}


}

- (void)updateBadgeCount {
//    [[CounterStoreManager sharedManager]updateCount];
//    [[UIApplication sharedApplication]setApplicationIconBadgeNumber:[[CounterStoreManager sharedManager]dayCount]];
}
@end
