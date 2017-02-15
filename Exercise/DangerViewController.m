//
//  DangerViewController.m
//  Exercise
//
//  Created by Donald Hays on 2/24/15.
//  Copyright (c) 2015 Ender Labs. All rights reserved.
//

#import "DangerViewController.h"
#import "Alarm.h"
#import "AlarmSystem.h"
#import "AlarmDictionaryKeys.h"

@interface DangerViewController()
@property (nonatomic, weak) IBOutlet UISlider *dangerSlider;
@end

@implementation DangerViewController

#pragma mark - view controller lifecycle methods
-(void)viewDidLoad
{
    //sets the slider at .5 on every launch
    self.dangerSlider.value = .5;
    
    //retrieves last settins
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    //sets the alarm activity state in the alarm system
    AlarmSystem *currentAlarmSettings = [AlarmSystem sharedInstanceOfAlarmSystem];
    currentAlarmSettings.dangerLevel = .5;
    //sets the default state of the alarm and activates the alarm if conditions are met
    if(![settings boolForKey:FirstLaunch]){
        [settings setBool:true forKey:FirstLaunch];
        [settings setBool:true forKey:AlarmEnabled];
        [settings setFloat:.9 forKey:AlarmThreshold];
        [settings setFloat:.5 forKey:AlarmDangerLevel];
        currentAlarmSettings.alarmEnabled = true;
        currentAlarmSettings.alarmThreshold = .9;
        [currentAlarmSettings activateOrDeactivateAlarm];
    }else {
        currentAlarmSettings.alarmThreshold = [settings floatForKey:AlarmThreshold];
        currentAlarmSettings.alarmEnabled = [settings boolForKey:AlarmEnabled];
        [currentAlarmSettings activateOrDeactivateAlarm];
    }
}

#pragma mark Actions
- (IBAction)dangerSliderValueChanged:(UISlider *)sender
{
    // TODO: Change the danger value.
    //activates or deactivates the alarm whenslider is moved
    AlarmSystem *currentAlarmSettings = [AlarmSystem sharedInstanceOfAlarmSystem];
    currentAlarmSettings.dangerLevel = sender.value;
    [currentAlarmSettings activateOrDeactivateAlarm];
    
    //retrieves the settings of the alarm
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    //saves the new danger level of the alarm
    [settings setFloat:sender.value forKey:AlarmDangerLevel];
}

@end
