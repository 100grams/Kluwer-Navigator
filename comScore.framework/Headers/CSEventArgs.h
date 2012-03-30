//
//  CSEventArgs.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSEventArgsProtocol.h"
#import "CSEvent.h"
#import "CSEventType.h"

@interface CSEventArgs : NSObject <CSEventArgsProtocol> {

}

-(id) initWithEventType: (CSAnalyticsEventType) type withEvent: (CSEvent *) e andDetails: (NSDictionary *) d;
-(id) initWithEvent: (CSEvent *) e andDetails: (NSDictionary *) d;
-(id) initWithEvent: (CSEvent *) e;

@property (assign) CSAnalyticsEventType eventType;

@end
