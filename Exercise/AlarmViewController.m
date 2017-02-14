//
//  AlarmViewController.m
//  Exercise
//
//  Created by Donald Hays on 2/24/15.
//  Copyright (c) 2015 Ender Labs. All rights reserved.
//

#import "AlarmViewController.h"
#import "AlarmView.h"
#import "Alarm.h"

// =============================================================================
// This view controller has already been implemented for you. It will
// automatically respond to changes in the alarm state. You should not need to
// make any changes to this file in order to complete the exercise.
// =============================================================================

@interface AlarmViewController()
@property (nonatomic, copy) IBOutletCollection(AlarmView) NSArray *alarmViews;
@end

@implementation AlarmViewController
#pragma mark -
#pragma mark Lifecycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        [self finishInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self finishInit];
    }
    return self;
}

- (void)finishInit
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alarmDidActivate:) name:AlarmDidActivateNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alarmDidDeactivate:) name:AlarmDidDeactivateNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AlarmDidActivateNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AlarmDidDeactivateNotification object:nil];
}

#pragma mark -
#pragma mark UIViewController
- (void)viewDidLoad
{
    [self reloadAlarmViewStates];
}

#pragma mark -
#pragma mark Private API
- (void)reloadAlarmViewStates
{
    BOOL const alarmActive = isAlarmActive();
    
    for (AlarmView * const alarmView in self.alarmViews) {
        alarmView.active = alarmActive;
    }
}

#pragma mark -
#pragma mark Notifications
- (void)alarmDidActivate:(NSNotification *)notification
{
    [self reloadAlarmViewStates];
}

- (void)alarmDidDeactivate:(NSNotification *)notification
{
    [self reloadAlarmViewStates];
}
@end
