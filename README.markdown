# Architecture Exercise

This exercise is designed to test your ability to architect code that accepts
input from multiple sources and do the correct thing with that input.

## The Application

The app simulates a visual alarm going off under certain conditions. If you
build and run the app, you'll see five grey circles along the bottom of the
screen. These are your alarm lights. When the alarm is on, they'll be red, when
the alarm is off, they'll be grey.

Near the top of the screen, you'll see a slider labeled "Danger Level." Once the
app works, the user should be able to drag this slider. Once the slider goes
above a certain threshold, the alarm will turn on.

The app also shows a "Settings" button. Tapping the "Settings" button presents
a settings screen. This screen has a slider for "Alarm Threshold" and a switch
for "Alarm Enabled." Once the app works, the "Alarm Threshold" slider will
control the threshold that the "Danger Level" slider is tested against to
determine whether or not to activate the alarm. The "Alarm Enabled" switch will
control whether or not the alarm can be activated at all, regardless of the
"Alarm Threshold" and "Danger Level" values.

Unfortunately, at present the "Danger Level" slider, the "Alarm Threshold"
slider, and the "Alarm Enabled" switch don't do anything. For the exercise, you
need to make them all work.

## Requirements

- Danger Level
    - Should be a floating point value that ranges from 0.0 to 1.0, inclusive.
    - Should default to 0.5.
    - Should not be saved, the value should reset to 0.5 on every app launch.
    - Should be bound to the "Danger Level" slider on the main screen.
- Alarm Threshold
    - Should be a floating point value that ranges from 0.0 to 1.0, inclusive.
    - Should default to 0.9.
    - Should be saved and persist between app launches.
    - Should be bound to the "Alarm Threshold" slider on the Settings screen.
- Alarm Enabled
    - Should be a boolean.
    - Should default to true.
    - Should be saved and persist between app launches.
    - Should be bound to the "Alarm Enabled" switch on the Settings screen.
- Alarm
    - Should activate whenever _all_ of the following are true:
        - Danger Level >= Alarm Threshold.
        - Alarm Enabled == true.
        - The app is in the foreground.
    - If _any_ of those conditions become false, the alarm should deactivate.
    - The alarm should change even if the alarm view is not currently visible.

## Implementation

Essentially all of the UI layer is already implemented for you. There's a
Storyboard and `UIViewController` subclasses, and those subclasses have already
had outlets and actions wired up. Your responsibility is to write the code that
manages the application's internal state.

The alarm is activated and deactivated via functions declared in `Alarm.h`. For
the purposes of the exercise, you should pretend that `Alarm.h/.m` are
not editable, as though they came from an external third-party library which 
controls a light or a horn. The exercise will ultimately test if you call
`activateAlarm` and `deactivateAlarm` in the correct situations.

`AlarmViewController` is already fully implemented, and reflects the state of
the alarm. You shouldn't need to modify this class to fulfill the requirements
of the exercise. Since it visually reflects the state of the alarm, it will also
help you when developing.

There is no existing code to manage the Danger Level, Alarm Threshold, or Alarm
Enabled values, nor code that calls `activateAlarm` or `deactivateAlarm`. You
are free to create any new classes that you feel are appropriate to fulfill the
app's requirements. You can also freely edit any source files that you haven't
otherwise been prohibited from editing.
