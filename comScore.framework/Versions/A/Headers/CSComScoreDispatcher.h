//
//  CSDispatcher.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSDispatcherProtocol.h"
#import "CSEventType.h"

@interface CSComScoreDispatcher : NSObject <CSDispatcherProtocol> {
	
}

-(id) init;

//comScore notifies
-(void) notify: (CSAnalyticsEventType) type;
-(void) notify: (CSAnalyticsEventType) type withDictionary:(NSDictionary *) details;

@end
