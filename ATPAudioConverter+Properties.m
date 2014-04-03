#import "ATPAudioConverter+Properties.h"

#import "NSValue+ATPAudioValueRange.h"


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

- (NSData *)magicCookie
{
	return [self magicCookieWithError:nil];
}

- (NSData *)magicCookieWithError:(NSError **)error
{
	return [self dataForProperty:kAudioConverterCompressionMagicCookie error:error];
}

- (UInt32)codecQuality
{
	return [self codecQualityWithError:nil];
}

- (UInt32)codecQualityWithError:(NSError **)error
{
	UInt32 value = { 0 };
	UInt32 size = sizeof(value);
	
	[self getValue:&value size:&size forProperty:kAudioConverterCodecQuality error:error];
	
	return value;
}

- (void)setCodecQuality:(UInt32)codecQuality
{
	[self setCodecQuality:codecQuality error:nil];
}

- (void)setCodecQuality:(UInt32)codecQuality error:(NSError **)error
{
	UInt32 value = codecQuality;
	
	[self setValue:&value size:sizeof(value) forProperty:kAudioConverterCodecQuality error:error];
}

- (UInt32)encodeBitRate
{
	return [self encodeBitRateWithError:nil];
}

- (UInt32)encodeBitRateWithError:(NSError **)error
{
	UInt32 value = { 0 };
	UInt32 size = sizeof(value);
	
	[self getValue:&value size:&size forProperty:kAudioConverterEncodeBitRate error:error];
	
	return value;
}

- (void)setEncodeBitRate:(UInt32)encodeBitRate
{
	[self setEncodeBitRate:encodeBitRate error:nil];
}

- (void)setEncodeBitRate:(UInt32)encodeBitRate error:(NSError **)error
{
	UInt32 value = encodeBitRate;
	
	[self setValue:&value size:sizeof(value) forProperty:kAudioConverterEncodeBitRate error:error];
}

- (NSArray *)applicableEncodeBitRates
{
	return [self applicableEncodeBitRatesWithError:nil];
}

- (NSArray *)applicableEncodeBitRatesWithError:(NSError **)error
{
	NSData *data = [self dataForProperty:kAudioConverterApplicableEncodeBitRates error:error];
	
	const AudioValueRange *bytes = data.bytes;
	const NSUInteger count = data.length / sizeof(AudioValueRange);
	
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:count];
	for(NSUInteger i = 0; i < count; ++i)
	{
		NSValue *value = [NSValue valueWithAudioValueRange:bytes[i]];
		[values addObject:value];
	}
	
	return [values copy];
}

- (NSArray *)availableEncodeBitRates
{
	return [self availableEncodeBitRatesWithError:nil];
}

- (NSArray *)availableEncodeBitRatesWithError:(NSError **)error
{
	NSData *data = [self dataForProperty:kAudioConverterAvailableEncodeBitRates error:error];
	
	const AudioValueRange *bytes = data.bytes;
	const NSUInteger count = data.length / sizeof(AudioValueRange);
	
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:count];
	for(NSUInteger i = 0; i < count; ++i)
	{
		NSValue *value = [NSValue valueWithAudioValueRange:bytes[i]];
		[values addObject:value];
	}
	
	return [values copy];
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
