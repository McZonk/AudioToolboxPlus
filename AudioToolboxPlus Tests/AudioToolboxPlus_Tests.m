//
//  AudioToolboxPlus_Tests.m
//  AudioToolboxPlus Tests
//
//  Created by Maximilian Christ on 20/03/15.
//  Copyright (c) 2015 McZonk. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import <AudioToolbox/AudioToolbox.h>
#import "ATPAudioConverter.h"


@interface AudioToolboxPlus_Tests : XCTestCase

@end

@implementation AudioToolboxPlus_Tests

- (void)setUp
{
	[super setUp];
}

- (void)tearDown
{
	[super tearDown];
}

- (void)testSimplePCMConvert
{
	AudioStreamBasicDescription inASBD = { 0 };
	inASBD.mSampleRate = 44100.0;
	inASBD.mFormatID = kAudioFormatLinearPCM;
	inASBD.mFormatFlags = kAudioFormatFlagIsFloat | kAudioFormatFlagIsPacked;
	inASBD.mBytesPerPacket = 4;
	inASBD.mFramesPerPacket = 1;
	inASBD.mBytesPerFrame = 4;
	inASBD.mChannelsPerFrame = 1;
	inASBD.mBitsPerChannel = 32;
	inASBD.mReserved = 0;
	
	AudioStreamBasicDescription outASBD = { 0 };
	outASBD.mSampleRate = 44100.0;
	outASBD.mFormatID = kAudioFormatLinearPCM;
	outASBD.mFormatFlags = kAudioFormatFlagIsSignedInteger | kAudioFormatFlagIsPacked;
	outASBD.mBytesPerPacket = 2;
	outASBD.mFramesPerPacket = 1;
	outASBD.mBytesPerFrame = 2;
	outASBD.mChannelsPerFrame = 1;
	outASBD.mBitsPerChannel = 16;
	outASBD.mReserved = 0;
	
	NSError *error = nil;
	
	ATPAudioConverter *audioConverter = [[ATPAudioConverter alloc] initWithInputFormat:&inASBD outputFormat:&outASBD error:&error];
	XCTAssert(audioConverter != nil);
	XCTAssert(error == nil, @"%@", error);
	
	float inData[2] = { 0.0, 1.0 };
	short convertedData[2] = { 0, 0 };
	short outData[2] = { 0, SHRT_MAX };
	
	AudioBufferList inBufferList;
	inBufferList.mNumberBuffers = 1;
	inBufferList.mBuffers[0].mData = inData;
	inBufferList.mBuffers[0].mDataByteSize = sizeof(inData);
	inBufferList.mBuffers[0].mNumberChannels = 1;
	
	AudioBufferList outBufferList;
	outBufferList.mNumberBuffers = 1;
	outBufferList.mBuffers[0].mData = convertedData;
	outBufferList.mBuffers[0].mDataByteSize = sizeof(convertedData);
	outBufferList.mBuffers[0].mNumberChannels = 1;
	
	XCTAssert([audioConverter convertNumberOfPCMFrames:2 inputBufferList:&inBufferList outputBufferList:&outBufferList error:&error]);
	XCTAssert(error == nil, @"%@", error);
	
	XCTAssert(memcmp(convertedData, outData, sizeof(convertedData)) == 0);
}

@end