#import "ATPAudioConverter+PropertiesFromDictionary.h"

#import "ATPAudioConverter+Properties.h"


@implementation ATPAudioConverter (PropertiesFromDictionary)

- (void)setPropertiesFromDictionary:(NSDictionary *)dictionary error:(NSError **)error
{
	[dictionary enumerateKeysAndObjectsUsingBlock:^(NSNumber *propertyValue, id value, BOOL *stop) {
		UInt32 property = propertyValue.intValue;
		
		if(property == kAudioConverterEncodeBitRate)
		{
			NSNumber *encodeBitRate = value;
			[self setEncodeBitRate:encodeBitRate.intValue error:error];
		}
	}];
}

@end
