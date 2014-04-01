//
//  CAPAudioConverter.m
//  CoreAudio
//
//  Created by Maximilian Christ on 18/01/14.
//  Copyright (c) 2014 McZonk. All rights reserved.
//

#import "ATPAudioConverter.h"

#import "NSError+ATPError.h"

@interface ATPAudioConverter ()  {
@protected
	AudioConverterRef audioConverter;
}

@end


@implementation ATPAudioConverter

@synthesize AudioConverter = audioConverter;

- (id)initWithInputFormat:(AudioStreamBasicDescription)inputFormat outputFormat:(AudioStreamBasicDescription)outputFormat error:(out NSError **)error
{
	self = [super init];
	if(self != nil)
	{
		OSStatus status = AudioConverterNew(&inputFormat, &outputFormat, &audioConverter);
		if(status != noErr)
		{
			if(error != nil)
			{
				*error = [NSError audioToolboxErrorWithStatus:status];
			}
			return nil;
		}
	}
	return self;
}

- (void)dealloc
{
	AudioConverterDispose(audioConverter);
}

- (BOOL)getSize:(out UInt32 *)size writable:(out BOOL *)writable forProperty:(AudioConverterPropertyID)property error:(out NSError **)error;
{
	OSStatus status = AudioConverterGetPropertyInfo(audioConverter, property, size, (Boolean *)writable);
	if(status != noErr)
	{
		if(error != nil)
		{
			*error = [NSError audioToolboxErrorWithStatus:status];
		}
		
		return NO;
	}
	
	return YES;
}

- (BOOL)getValue:(out void *)value size:(inout UInt32 *)size forProperty:(AudioConverterPropertyID)property error:(out NSError **)error;
{
	OSStatus status = AudioConverterGetProperty(audioConverter, property, size, value);
	if(status != noErr)
	{
		if(error != nil)
		{
			*error = [NSError audioToolboxErrorWithStatus:status];
		}
		
		return NO;
	}
	
	return YES;
}

- (BOOL)setValue:(const void *)value size:(UInt32)size forProperty:(AudioConverterPropertyID)property error:(out NSError **)error;
{
	OSStatus status = AudioConverterSetProperty(audioConverter, property, size, value);
	if(status != noErr)
	{
		if(error != nil)
		{
			*error = [NSError audioToolboxErrorWithStatus:status];
		}
		
		return NO;
	}
	
	return YES;
}

@end
