//
//  DangerViewController.m
//  Exercise
//
//  Created by Donald Hays on 2/24/15.
//  Copyright (c) 2015 Ender Labs. All rights reserved.
//

#import "DangerViewController.h"
#import "Alarm.h"

@interface DangerViewController()
@property (nonatomic, weak) IBOutlet UISlider *dangerSlider;
@property BOOL alarmCurrentlyActive;
@end

@implementation DangerViewController

#pragma mark - view controller lifecycle methods
-(void)viewDidLoad
{
    //retrieves last settins
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    //sets the default state of the alarm and activates the alarm if conditions are met
    self.dangerSlider.value = .5;
    if(![settings boolForKey:@"firstLaunch"]){
        [settings setBool:true forKey:@"firstLaunch"];
        [settings setBool:true forKey:@"Alarm Enabled"];
        [settings setFloat:.9 forKey:@"Alarm Threshold"];
        self.alarmCurrentlyActive = false;
    }else if ([settings floatForKey:@"Alarm Threshold"] < self.dangerSlider.value && [settings boolForKey:@"Alarm Enabled"] && !self.alarmCurrentlyActive){
        activateAlarm();
        self.alarmCurrentlyActive = true;
    }
    
    //saves the initial danger level of the alarm
    [settings setFloat:.5 forKey:@"Danger Level"];
}

-(void)viewWillAppear:(BOOL)animated
{
    //retrieves the settins of the alarm
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    //captures and stores the state of the alarm when the view appears
    if (self.dangerSlider.value >= [settings floatForKey:@"Alarm Threshold"] && [settings boolForKey:@"Alarm Enabled"]) {
        self.alarmCurrentlyActive = true;
    }else{
        self.alarmCurrentlyActive = false;
    }
}

#pragma mark Actions
- (IBAction)dangerSliderValueChanged:(UISlider *)sender
{
    // TODO: Change the danger value.
    
    //retrieves the settings of the alarm
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    //turns the alarm on or off if the conditions are met
    if (sender.value >= [settings floatForKey:@"Alarm Threshold"] && [settings boolForKey:@"Alarm Enabled"] && !self.alarmCurrentlyActive) {
        activateAlarm();
        self.alarmCurrentlyActive = true;
    } else if (sender.value < [settings floatForKey:@"Alarm Threshold"] && [settings boolForKey:@"Alarm Enabled"] && self.alarmCurrentlyActive){
        deactivateAlarm();
        self.alarmCurrentlyActive = false;
    }
    
    //saves the new danger level of the alarm
    [settings setFloat:sender.value forKey:@"Danger Level"];
}
@end
