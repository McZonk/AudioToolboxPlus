#import <Foundation/Foundation.h>

#import <AudioToolbox/AudioToolbox.h>
#import <CoreMedia/CoreMedia.h>


@class ATPAudioCompressionSession;


@protocol ATPAudioCompressionSessionDelegate <NSObject>
@required

- (void)audioCompressionSession:(ATPAudioCompressionSession *)compressionSession didEncodeSampleBuffer:(CMSampleBufferRef)sampleBuffer;

@end


@interface ATPAudioCompressionSession : NSObject

- (instancetype)initWithOutputFormat:(AudioStreamBasicDescription)outputFormat;

@property (nonatomic, assign, readonly) AudioStreamBasicDescription outputFormat;

@property (nonatomic, weak, readonly) id<ATPAudioCompressionSessionDelegate> delegate;
@property (nonatomic, strong, readonly) dispatch_queue_t delegateQueue;

- (void)setDelegate:(id<ATPAudioCompressionSessionDelegate>)delegate queue:(dispatch_queue_t)queue;

- (BOOL)encodeSampleBuffer:(CMSampleBufferRef)sampleBuffer;
//- (void)encodeAudioBufferList:(const AudioBufferList *)audioBufferList;

@end
