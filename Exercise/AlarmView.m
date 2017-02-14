//
//  AlarmView.m
//  Exercise
//
//  Created by Donald Hays on 2/24/15.
//  Copyright (c) 2015 Ender Labs. All rights reserved.
//

#import "AlarmView.h"

@implementation AlarmView
#pragma mark -
#pragma mark Lifecycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
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
    [self addObserver:self forKeyPath:@"active" options:0 context:nil];
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"active" context:nil];
}

#pragma mark -
#pragma mark Observing
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"active"]) {
        [self setNeedsDisplay];
    }
}

#pragma mark -
#pragma mark UIView
- (void)drawRect:(CGRect)rect
{
    CGRect const circleRect = CGRectInset(self.bounds, 0.5, 0.5);
    
    [self.fillColor set];
    [[UIBezierPath bezierPathWithOvalInRect:circleRect] fill];
    
    [self.strokeColor set];
    [[UIBezierPath bezierPathWithOvalInRect:circleRect] stroke];
}

#pragma mark -
#pragma mark Private API
- (UIColor *)fillColor
{
    if(self.isActive) {
        return [UIColor colorWithRed:0.9 green:0.3 blue:0.15 alpha:1.0];
    } else {
        return [UIColor colorWithWhite:0.8 alpha:1.0];
    }
}

- (UIColor *)strokeColor
{
    if(self.isActive) {
        return [UIColor colorWithRed:0.7 green:0.1 blue:0.05 alpha:1.0];
    } else {
        return [UIColor colorWithWhite:0.6 alpha:1.0];
    }
}
@end
