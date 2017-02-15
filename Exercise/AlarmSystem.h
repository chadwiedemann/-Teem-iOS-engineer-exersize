//
//  AlarmSystem.h
//  Exercise
//
//  Created by Chad Wiedemann on 2/15/17.
//  Copyright © 2017 Ender Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Alarm.h"

@interface AlarmSystem : NSObject

@property float dangerLevel;
@property float alarmThreshold;
@property BOOL alarmEnabled;
@property BOOL alarmCurrentlyActive;

+ (AlarmSystem*)sharedInstanceOfAlarmSystem;
- (void)activateOrDeactivateAlarm;

@end
