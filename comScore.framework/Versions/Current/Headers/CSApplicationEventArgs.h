//
//  CSApplicationEventArgs.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSEventArgs.h"
#import "CSEventType.h"
#import "CSApplicationEvent.h"


@interface CSApplicationEventArgs : CSEventArgs {
	
}

-(id) initWithApplicationEventType: (CSApplicationEventType) appType appEvent: (CSApplicationEvent *) e andDictionary: (NSDictionary *) d;
-(id) initWithApplicationEvent: (CSApplicationEvent *) e andDetails: (NSDictionary *) d;
-(id) initWithApplicationEvent:(CSApplicationEvent *)e;
-(id) initWithApplicationEventType:(CSApplicationEventType) t;

@property (assign) NSString *pageName;
@property (assign) CSApplicationEventType appEventType;

@end
