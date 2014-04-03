#import "NSValue+ATPAudioValueRange.h"



@implementation NSValue (ATPAudioValueRange)

+ (NSValue *)valueWithAudioValueRange:(AudioValueRange)audioValueRange
{
	return [self value:&audioValueRange withObjCType:@encode(AudioValueRange)];
}

- (AudioValueRange)audioValueRange
{
	AudioValueRange audioValueRange;
	[self getValue:&audioValueRange];
	return audioValueRange;
}

- (Float64)audioValueRangeMinimum
{
	AudioValueRange audioValueRange = self.audioValueRange;
	return audioValueRange.mMinimum;
}

- (Float64)audioValueRangeMaximum
{
	AudioValueRange audioValueRange = self.audioValueRange;
	return audioValueRange.mMaximum;
}

@end
