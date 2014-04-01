//
//  CAPAudioConverter+Properties.h
//  CoreAudio
//
//  Created by Maximilian Christ on 18/01/14.
//  Copyright (c) 2014 McZonk. All rights reserved.
//

#import "ATPAudioConverter.h"

@interface ATPAudioConverter (Properties)

- (UInt32)minimumInputBufferSize;
- (UInt32)minimumInputBufferSizeWithError:(NSError **)error;

- (UInt32)minimumOutputBufferSize;
- (UInt32)minimumOutputBufferSizeWithError:(NSError **)error;

- (UInt32)maximumInputBufferSize;
- (UInt32)maximumInputBufferSizeWithError:(NSError **)error;

- (UInt32)maximumInputPacketSize;
- (UInt32)maximumInputPacketSizeWithError:(NSError **)error;

- (UInt32)maximumOutputPacketSize;
- (UInt32)maximumOutputPacketSizeWithError:(NSError **)error;

- (AudioStreamBasicDescription)inputFormat;
- (AudioStreamBasicDescription)inputFormatWithError:(NSError **)error;

- (AudioStreamBasicDescription)outputFormat;
- (AudioStreamBasicDescription)outputFormatWithError:(NSError **)error;

- (NSData *)magicCookie;
- (NSData *)magicCookieWithError:(NSError **)error;

@end
