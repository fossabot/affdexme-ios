//
//  UIDeviceHardware.h
//
//  Used to determine EXACT version of device software is running on.
//  Copyright (c) 2016 Affectiva Inc.
//

#import <Foundation/Foundation.h>

@interface UIDeviceHardware : NSObject

- (NSString *)platform;
- (NSString *)platformString;

@end
