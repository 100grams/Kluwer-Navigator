//
//  CSApplicationEvent.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSEvent.h"
#import "CSEventType.h"


@interface CSApplicationEvent : CSEvent {
	
}

-(id) initWithApplicationEventType: (CSApplicationEventType) appType andAnalyticsEventType: (CSAnalyticsEventType) stType;
-(id) initWithApplicationEventType:(CSApplicationEventType) appType;

@property (assign) NSString *name;

@end
