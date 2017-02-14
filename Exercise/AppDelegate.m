//
//  AppDelegate.m
//  Exercise
//
//  Created by Donald Hays on 2/24/15.
//  Copyright (c) 2015 Ender Labs. All rights reserved.
//

#import "AppDelegate.h"
#import "Alarm.h"

@interface AppDelegate ()
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    //deactivates the alarm if the app enters the background and it is active
    [self deactiveAlarmIfConditionsMet];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    //activates the alarm when the phone returns to the foreground if conditions met
    [self activateAlarmIfConditionsMet];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    //deactivates the alarm if the app is terminated
    [self deactiveAlarmIfConditionsMet];
}

#pragma mark - methods for setting alarm

//runs the logic to determine if the alarm should be deactivated
-(void)deactiveAlarmIfConditionsMet
{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    if ([settings floatForKey:@"Danger Level"] >= [settings floatForKey:@"Alarm Threshold"] && [settings boolForKey:@"Alarm Enabled"]) {
        deactivateAlarm();
    }
}

//runs the logic to see if the alarm should be activated
-(void)activateAlarmIfConditionsMet
{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    if ([settings floatForKey:@"Danger Level"] >= [settings floatForKey:@"Alarm Threshold"] && [settings boolForKey:@"Alarm Enabled"]) {
        activateAlarm();
    }
}

@end
