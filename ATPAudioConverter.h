//
//  CAPAudioConverter.h
//  CoreAudio
//
//  Created by Maximilian Christ on 18/01/14.
//  Copyright (c) 2014 McZonk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>


@interface ATPAudioConverter : NSObject

- (instancetype)initWithInputFormat:(const AudioStreamBasicDescription *)inputFormat outputFormat:(const AudioStreamBasicDescription *)outputFormat error:(out NSError **)error;

@property (nonatomic, assign, readonly) AudioConverterRef AudioConverter;

- (BOOL)getSize:(out UInt32 *)size writable:(out BOOL *)writable forProperty:(AudioConverterPropertyID)property error:(out NSError **)error;

- (BOOL)getValue:(out void *)value size:(inout UInt32 *)size forProperty:(AudioConverterPropertyID)property error:(out NSError **)error;

- (NSData *)dataForProperty:(AudioConverterPropertyID)property error:(NSError **)error;

- (BOOL)setValue:(const void *)value size:(UInt32)size forProperty:(AudioConverterPropertyID)property error:(out NSError **)error;

- (BOOL)setData:(NSData *)data forProperty:(AudioConverterPropertyID)property error:(out NSError **)error;

/**
 * Internally calls AudioConverterConvertComplexBuffer.
 */
- (BOOL)convertNumberOfPCMFrames:(UInt32)numberOfPCMFrames inputBufferList:(const AudioBufferList *)inputAudioBufferList outputBufferList:(AudioBufferList *)outputBufferList error:(out NSError **)error;

@end
