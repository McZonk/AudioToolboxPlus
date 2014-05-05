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

- (id)initWithInputFormat:(AudioStreamBasicDescription)inputFormat outputFormat:(AudioStreamBasicDescription)outputFormat error:(out NSError **)outError
{
	self = [super init];
	if(self != nil)
	{
		OSStatus status = AudioConverterNew(&inputFormat, &outputFormat, &audioConverter);
		if(status != noErr)
		{
			NSError *error = [NSError audioToolboxErrorWithStatus:status];
			if(outError != nil)
			{
				*outError = error;
			}
			else
			{
				NSLog(@"%s:%d: %@", __FUNCTION__, __LINE__, error);
			}
			return nil;
		}
	}
	return self;
}

- (void)dealloc
{
	if(audioConverter != NULL)
	{
		AudioConverterDispose(audioConverter);
	}
}

- (BOOL)getSize:(out UInt32 *)size writable:(out BOOL *)writable forProperty:(AudioConverterPropertyID)property error:(out NSError **)outError
{
	OSStatus status = AudioConverterGetPropertyInfo(audioConverter, property, size, (Boolean *)writable);
	if(status != noErr)
	{
		NSError *error = [NSError audioToolboxErrorWithStatus:status];
		if(outError != nil)
		{
			*outError = error;
		}
		else
		{
			NSLog(@"%s:%d: %@", __FUNCTION__, __LINE__, error);
		}
		return NO;
	}
	
	return YES;
}

- (BOOL)getValue:(out void *)value size:(inout UInt32 *)size forProperty:(AudioConverterPropertyID)property error:(out NSError **)outError
{
	OSStatus status = AudioConverterGetProperty(audioConverter, property, size, value);
	if(status != noErr)
	{
		NSError *error = [NSError audioToolboxErrorWithStatus:status];
		if(outError != nil)
		{
			*outError = error;
		}
		else
		{
			NSLog(@"%s:%d: %@", __FUNCTION__, __LINE__, error);
		}
		return NO;
	}
	
	return YES;
}

- (NSData *)dataForProperty:(AudioConverterPropertyID)property error:(NSError **)error
{
	UInt32 size = 0;
	if(![self getSize:&size writable:NULL forProperty:property error:error])
	{
		return nil;
	}
	
	void *data = malloc(size);
	if(![self getValue:data size:&size forProperty:property error:error])
	{
		free(data);
		return nil;
	}
	
	return [NSData dataWithBytesNoCopy:data length:size freeWhenDone:YES];
}

- (BOOL)setValue:(const void *)value size:(UInt32)size forProperty:(AudioConverterPropertyID)property error:(out NSError **)outError
{
	OSStatus status = AudioConverterSetProperty(audioConverter, property, size, value);
	if(status != noErr)
	{
		NSError *error = [NSError audioToolboxErrorWithStatus:status];
		if(outError != nil)
		{
			*outError = error;
		}
		else
		{
			NSLog(@"%s:%d: %@", __FUNCTION__, __LINE__, error);
		}
		return NO;
	}
	
	return YES;
}

- (BOOL)setData:(NSData *)data forProperty:(AudioConverterPropertyID)property error:(out NSError **)error
{
	return [self setValue:data.bytes size:(UInt32)data.length forProperty:property error:error];
}

@end
