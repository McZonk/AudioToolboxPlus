//
//  CAPAudioConverter+Properties.m
//  CoreAudio
//
//  Created by Maximilian Christ on 18/01/14.
//  Copyright (c) 2014 McZonk. All rights reserved.
//

#import "ATPAudioConverter+Properties.h"

@implementation ATPAudioConverter (Properties)

- (UInt32)minimumInputBufferSize
{
	return [self minimumInputBufferSizeWithError:nil];
}

- (UInt32)minimumInputBufferSizeWithError:(NSError **)error
{
	UInt32 value = 0;
	UInt32 size = sizeof(value);
	
	[self getValue:&value size:&size forProperty:kAudioConverterPropertyMinimumInputBufferSize error:error];
	
	return value;
}

- (UInt32)minimumOutputBufferSize
{
	return [self minimumOutputBufferSizeWithError:nil];
}

- (UInt32)minimumOutputBufferSizeWithError:(NSError **)error
{
	UInt32 value = 0;
	UInt32 size = sizeof(value);
	
	[self getValue:&value size:&size forProperty:kAudioConverterPropertyMinimumOutputBufferSize error:error];
	
	return value;
}

- (UInt32)maximumInputBufferSize
{
	return [self maximumInputBufferSizeWithError:nil];
}

- (UInt32)maximumInputBufferSizeWithError:(NSError **)error
{
	UInt32 value = 0;
	UInt32 size = sizeof(value);
	
	[self getValue:&value size:&size forProperty:kAudioConverterPropertyMaximumInputBufferSize error:error];
	
	return value;
}

- (UInt32)maximumInputPacketSize
{
	return [self maximumInputPacketSizeWithError:nil];
}

- (UInt32)maximumInputPacketSizeWithError:(NSError **)error
{
	UInt32 value = 0;
	UInt32 size = sizeof(value);
	
	[self getValue:&value size:&size forProperty:kAudioConverterPropertyMaximumInputPacketSize error:error];
	
	return value;
}

- (UInt32)maximumOutputPacketSize
{
	return [self maximumOutputPacketSizeWithError:nil];
}

- (UInt32)maximumOutputPacketSizeWithError:(NSError **)error
{
	UInt32 value = 0;
	UInt32 size = sizeof(value);
	
	[self getValue:&value size:&size forProperty:kAudioConverterPropertyMaximumOutputPacketSize error:error];
	
	return value;
}

- (AudioStreamBasicDescription)inputFormat
{
	return [self inputFormatWithError:nil];
}

- (AudioStreamBasicDescription)inputFormatWithError:(NSError **)error
{
	AudioStreamBasicDescription value = { 0 };
	UInt32 size = sizeof(value);
	
	[self getValue:&value size:&size forProperty:kAudioConverterCurrentInputStreamDescription error:error];
	
	return value;
}

- (AudioStreamBasicDescription)outputFormat
{
	return [self outputFormatWithError:nil];
}

- (AudioStreamBasicDescription)outputFormatWithError:(NSError **)error
{
	AudioStreamBasicDescription value = { 0 };
	UInt32 size = sizeof(value);
	
	[self getValue:&value size:&size forProperty:kAudioConverterCurrentOutputStreamDescription error:error];
	
	return value;
}

@end
