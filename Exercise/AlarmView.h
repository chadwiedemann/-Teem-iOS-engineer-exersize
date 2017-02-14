//
//  AlarmView.h
//  Exercise
//
//  Created by Donald Hays on 2/24/15.
//  Copyright (c) 2015 Ender Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

/// An AlarmView presents a visual representation of an alarm state.
///
/// An AlarmView instance is controlled through its active property. Instances
/// paint a colored circle, with the color of the circle dependent upon the
/// value of the active property.
IB_DESIGNABLE @interface AlarmView : UIView

/// A Boolean value that determines whether the AlarmView is active.
///
/// Setting the value of this property to true will make the AlarmView red,
/// and setting the value to false will make it grey. The default value is
/// false.
@property (nonatomic, getter=isActive) IBInspectable BOOL active;
@end
