#import <Foundation/Foundation.h>

#import <AudioToolbox/AudioToolbox.h>


@interface NSValue (ATPAudioValueRange)

+ (NSValue *)valueWithAudioValueRange:(AudioValueRange)audioValueRange;

- (AudioValueRange)audioValueRange;

- (Float64)audioValueRangeMinimum;
- (Float64)audioValueRangeMaximum;

@end
