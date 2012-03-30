//
//  CSApplicationDispatcher.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSDispatcherProtocol.h"


@interface CSApplicationDispatcher : NSObject <CSDispatcherProtocol> {
	
}

-(id) init;

//Application notifies
-(void) notify: (CSApplicationEventType) type;
-(void) notify: (CSApplicationEventType) type withDictionary:(NSDictionary *) details;

@end
