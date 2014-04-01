//
//  NSError+CAPError.m
//  CoreAudio
//
//  Created by Maximilian Christ on 18/01/14.
//  Copyright (c) 2014 McZonk. All rights reserved.
//

#import "NSError+ATPError.h"

NSString * const ATPErrorDomain = @"AudioToolboxError";


static NSString * DescriptionForStatus(OSStatus status)
{
	switch(status)
	{
	
	default:
		return @"Unknown Error";
	}
}

@implementation NSError (ATPError)

+ (instancetype)audioToolboxErrorWithStatus:(OSStatus)status
{
	if(status == noErr)
	{
		return nil;
	}
	
	NSString *description = DescriptionForStatus(status);
	
	NSDictionary *userInfo = @{
		NSLocalizedDescriptionKey: description,
	};
	
	return [self errorWithDomain:ATPErrorDomain code:(NSInteger)status userInfo:userInfo];
}

@end
