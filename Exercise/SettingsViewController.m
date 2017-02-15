//
//  SettingsViewController.m
//  Exercise
//
//  Created by Donald Hays on 2/24/15.
//  Copyright (c) 2015 Ender Labs. All rights reserved.
//

#import "SettingsViewController.h"
#import "Alarm.h"
#import "AlarmSystem.h"
#import "AlarmDictionaryKeys.h"

@interface SettingsViewController()
@property (nonatomic, weak) IBOutlet UISlider *alarmThresholdSlider;
@property (nonatomic, weak) IBOutlet UISwitch *alarmEnabledSwitch;
@end

@implementation SettingsViewController
#pragma mark - view controller life cycle methods

-(void)viewWillAppear:(BOOL)animated
{
    //retrieves the last settings
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    //sets the switch to the last selected position
    self.alarmEnabledSwitch.on = [settings boolForKey:AlarmEnabled];
    
    //sets the sliders value to the last selected value
    self.alarmThresholdSlider.value = [settings floatForKey:AlarmThreshold];
    
}

#pragma mark Actions
- (IBAction)done:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)alarmThresholdSliderValueChanged:(UISlider *)sender
{
    // TODO: Change the alarm activation threshold.
    
    //Activates or deactivates alarm when threshold slider moves
    AlarmSystem *currentAlarmSettings = [AlarmSystem sharedInstanceOfAlarmSystem];
    currentAlarmSettings.alarmThreshold = sender.value;
    [currentAlarmSettings activateOrDeactivateAlarm];
    
    //retrieves last settings
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    //this saves the new alarm threshold
    [settings setFloat:sender.value forKey:AlarmThreshold];
    
}

- (IBAction)alarmEnabledSwitchValueChanged:(UISwitch *)sender
{
    // TODO: Toggle whether the alarm is enabled.
    
    //activates or deactivates the alarm when enabled switch is tapped
    AlarmSystem *currentAlarmSettings = [AlarmSystem sharedInstanceOfAlarmSystem];
    currentAlarmSettings.alarmEnabled = sender.on;
    [currentAlarmSettings activateOrDeactivateAlarm];
    
    //retrieves last settings
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    //saves the new alarm enabled status
    [settings setBool:self.alarmEnabledSwitch.on forKey:AlarmEnabled];
    
}
@end
