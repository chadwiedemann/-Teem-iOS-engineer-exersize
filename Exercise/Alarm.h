//
//  Alarm.h
//  Exercise
//
//  Created by Donald Hays on 2/24/15.
//  Copyright (c) 2015 Ender Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

// =============================================================================
// For the exercise, use the notifications and public functions declared in this
// header file to implement the required app logic. Do not modify Alarm.m.
//
// In a normal application, this alarm functionality would not be exposed
// through global C functions. The exercise partially tests your ability to
// encapsulate uneditable external code's interfaces in a way that's well suited
// to your application's requirements.
// =============================================================================

/// Posted when the alarm activates.
NSString * const AlarmDidActivateNotification;

/// Posted when the alarm deactivates.
NSString * const AlarmDidDeactivateNotification;

/// Activates the alarm.
///
/// If the alarm is already active when called, an exception will be thrown.
void activateAlarm();

/// Deactivates the alarm.
///
/// If the alarm is not active when called, an exception will be thrown.
void deactivateAlarm();

/// Returns a Boolean indicating whether or not the alarm is currently active.
BOOL isAlarmActive();
