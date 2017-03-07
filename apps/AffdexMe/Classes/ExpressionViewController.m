//
//  ExpressionViewController.m
//  AffdexMe
//
//  Created by Boisy Pitre on 2/14/14.
//  Copyright (c) 2016 Affectiva Inc.
//
//  See the file license.txt for copying permission.

#import "ExpressionViewController.h"

@interface ExpressionViewController ()

@property (assign) CGRect indicatorBounds;

@end

@implementation ExpressionViewController

@dynamic metric;

- (id)initWithName:(NSString *)name horizontalSizeClass:(UIUserInterfaceSizeClass)horizontalSizeClass;
{
    if (horizontalSizeClass == UIUserInterfaceSizeClassCompact)
    {
        self = [super initWithNibName:@"ExpressionView_iPhone" bundle:nil];
    }
    else
    {
        self = [super initWithNibName:@"ExpressionView_iPad" bundle:nil];
    }

    if (self)
    {
        self.name = name;
    }
    
    return self;
}

- (void)reset;
{
//    self.view.alpha = 0.0;
}

- (void)viewDidLoad;
{
    [super viewDidLoad];
    
    CGFloat labelSize = self.expressionLabel.font.pointSize;
    CGFloat scoreSize = self.scoreLabel.font.pointSize;
    
    self.expressionLabel.font = [UIFont fontWithName:@"SquareFont" size:labelSize];
    self.expressionLabel.backgroundColor = [UIColor clearColor];
    self.expressionLabel.shadowColor = [UIColor blackColor];
    self.expressionLabel.shadowOffset = CGSizeMake(0.0, 1.0);
    self.expressionLabel.text = self.name;

    self.scoreLabel.font = [UIFont fontWithName:@"SquareFont" size:scoreSize];
    self.indicatorBounds = self.indicatorView.bounds;
    [self setMetric:0.0];
}

- (float)metric;
{
    return _metric;
}

- (void)setMetric:(float)value;
{
    _metric = value;
    if (!isnan(value))
    {
        CGRect bounds = self.indicatorBounds;
        if (isnan(value))
        {
            bounds.size.width = 0.0;
        }
        else
        {
            bounds.size.width *= (value / 100.0);
        }
        
        if (value < 0.0)
        {
            [self.indicatorView setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:0.0/255.0 blue:139.0/255.0 alpha:1.0]];  // Affectiva magenta
        }
        else
        {
            [self.indicatorView setBackgroundColor:[UIColor colorWithRed:132.0/255.0 green:223.0/255.0 blue:101.0/255.0 alpha:1.0]];  // Affectiva green
        }

        [self.indicatorView setBounds:bounds];
        if ([self.name length])
        {
            self.scoreLabel.text = [NSString stringWithFormat:@"%.0f%%", value];
        }
        else
        {
            self.scoreLabel.text = nil;
        }
    }
}

- (void)faceDetected;
{
}

- (void)faceUndetected;
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
//    [self.view setAlpha:0.0];
    [UIView commitAnimations];
}

@end
