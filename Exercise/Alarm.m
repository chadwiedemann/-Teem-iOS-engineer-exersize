//
//  Alarm.m
//  Exercise
//
//  Created by Donald Hays on 2/24/15.
//  Copyright (c) 2015 Ender Labs. All rights reserved.
//

#import "Alarm.h"

// =============================================================================
// For the exercise, do not modify this file.
// =============================================================================

NSString * const AlarmDidActivateNotification = @"AlarmDidActivateNotification";
NSString * const AlarmDidDeactivateNotification = @"AlarmDidDeactivateNotification";

static BOOL alarmActive = NO;

void activateAlarm() {
    if(isAlarmActive() == YES) {
        [NSException raise:NSGenericException format:@"Cannot call `activateAlarm` while the alarm is already active"];
    }
    
    NSLog(@"Activating Alarm ...");
    alarmActive = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:AlarmDidActivateNotification object:nil];
}

void deactivateAlarm() {
    if(isAlarmActive() == NO) {
        [NSException raise:NSGenericException format:@"Cannot call `deactivateAlarm` while the alarm is already deactived"];
    }
    
    NSLog(@"Deactivating Alarm ...");
    alarmActive = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:AlarmDidDeactivateNotification object:nil];
}

BOOL isAlarmActive() {
    return alarmActive;
}
