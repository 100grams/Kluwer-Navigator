//
//  CSEventType.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	View,
	Hidden
} CSAnalyticsEventType;

typedef enum {
	BeforeDispatch,
	Dispatch
} CSDispatchingEventType;

typedef enum {
	Start,
	AppView,
	Close,
	Aggregate
} CSApplicationEventType;

typedef enum {
	Play,
	Pause,
	End,
	KeepAlive,
	HeartBeat,
    Custom,
    AdPlay,
    AdPause,
    AdEnd,
    AdClick
} CSStreamSenseEventType;

extern NSString* const AnalyticsEventType_toString[2];
extern NSString* const DispatchingEventType_toString[2];
extern NSString* const ApplicationEventType_toString[4];
extern NSString* const StreamSenseEventType_toString[10];


@interface CSEventType : NSObject {

}

@end
