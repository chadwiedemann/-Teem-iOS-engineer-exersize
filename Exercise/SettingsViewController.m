//
//  SettingsViewController.m
//  Exercise
//
//  Created by Donald Hays on 2/24/15.
//  Copyright (c) 2015 Ender Labs. All rights reserved.
//

#import "SettingsViewController.h"
#import "Alarm.h"

@interface SettingsViewController()
@property (nonatomic, weak) IBOutlet UISlider *alarmThresholdSlider;
@property (nonatomic, weak) IBOutlet UISwitch *alarmEnabledSwitch;
@property BOOL alarmCurrentlyActive;
@end

@implementation SettingsViewController
#pragma mark - view controller life cycle methods

-(void)viewWillAppear:(BOOL)animated
{
    //retrieves the last settings
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    //sets the switch to the last selected position
    self.alarmEnabledSwitch.on = [settings boolForKey:@"Alarm Enabled"];
    
    //sets the sliders value to the last selected value
    self.alarmThresholdSlider.value = [settings floatForKey:@"Alarm Threshold"];
    
    //tracks if the alarm state is active or deactive
    if([settings floatForKey:@"Danger Level"] >= self.alarmThresholdSlider.value && [settings boolForKey:@"Alarm Enabled"]){
        self.alarmCurrentlyActive = true;
    }else{
        self.alarmCurrentlyActive = false;
    }
}

#pragma mark Actions
- (IBAction)done:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)alarmThresholdSliderValueChanged:(UISlider *)sender
{
    // TODO: Change the alarm activation threshold.
    
    //retrieves last settings
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    //This code activates or deactivates the alarm if the slider is moved into or out of the dange zone and the alarm is enabled
    if ([settings floatForKey:@"Danger Level"] >= sender.value && [settings boolForKey:@"Alarm Enabled"] && !self.alarmCurrentlyActive) {
        activateAlarm();
        self.alarmCurrentlyActive = true;
    }else if ([settings floatForKey:@"Danger Level"] < sender.value && self.alarmCurrentlyActive){
        deactivateAlarm();
        self.alarmCurrentlyActive = false;
    }
    
    //this saves the new alarm threshold
    [settings setFloat:sender.value forKey:@"Alarm Threshold"];
}

- (IBAction)alarmEnabledSwitchValueChanged:(UISwitch *)sender
{
    // TODO: Toggle whether the alarm is enabled.
    
    //retrieves last settings
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    //this activates or deactivates the alarm if the alarm is enabled and the threshold is in the danger zone
    if ([sender isOn] && [settings floatForKey:@"Danger Level"] >= self.alarmThresholdSlider.value) {
        activateAlarm();
        self.alarmCurrentlyActive = true;
    }else if (self.alarmCurrentlyActive){
        deactivateAlarm();
        self.alarmCurrentlyActive = false;
    }
    
    //saves the new alarm enabled status
    [settings setBool:self.alarmEnabledSwitch.on forKey:@"Alarm Enabled"];
}
@end
