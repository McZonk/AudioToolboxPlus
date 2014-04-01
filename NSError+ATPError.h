//
//  NSError+CAPError.h
//  CoreAudio
//
//  Created by Maximilian Christ on 18/01/14.
//  Copyright (c) 2014 McZonk. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const ATPErrorDomain;


@interface NSError (ATPError)

+ (instancetype)audioToolboxErrorWithStatus:(OSStatus)status;

@end
