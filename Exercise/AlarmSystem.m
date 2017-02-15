//
//  AlarmSystem.m
//  Exercise
//
//  Created by Chad Wiedemann on 2/15/17.
//  Copyright © 2017 Ender Labs. All rights reserved.
//

#import "AlarmSystem.h"
#import "Alarm.h"
#import <UIKit/UIKit.h>

@implementation AlarmSystem

//Singleton implementation
+ (AlarmSystem*)sharedInstanceOfAlarmSystem
{
    static AlarmSystem *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[AlarmSystem alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //creates the notification center recievers
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillTerminate:) name:UIApplicationWillTerminateNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    }
    return self;
}


- (void)activateOrDeactivateAlarm
{
    //logic to activate or deactive the alarm
    if (self.alarmCurrentlyActive && (!self.alarmEnabled || !(self.dangerLevel >= self.alarmThreshold))) {
        deactivateAlarm();
        self.alarmCurrentlyActive = false;
    }else if(!self.alarmCurrentlyActive && (self.alarmEnabled && self.dangerLevel >= self.alarmThreshold)){
        activateAlarm();
        self.alarmCurrentlyActive = true;
    }
    
}

//turns alarm off when entering background
-(void)appWillResignActive:(NSNotification*)note
{
    if (self.alarmCurrentlyActive == true) {
        deactivateAlarm();
        self.alarmCurrentlyActive = false;
    }
}

//turns alarm off when exiting the app
-(void)appWillTerminate:(NSNotification*)note
{
    if (self.alarmCurrentlyActive == true) {
        deactivateAlarm();
    }
}

//turns alarm on if the conditions are met when the app enters the foreground
-(void)applicationWillEnterForeground:(NSNotification*)note
{
    [self activateOrDeactivateAlarm];
}


@end
