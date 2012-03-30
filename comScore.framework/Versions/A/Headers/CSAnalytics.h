//
//  CSAnalytics.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSDispatcherProtocol.h"
#import "CSProduct.h"
#import "CSEventType.h"


/// CSAnalytics class, provides the basic building block onto which 
/// comScore will operate.
/// Implements the comScore event dispatcher interface.
@interface CSAnalytics : CSProduct <CSDispatcherProtocol> {
	
}

-(id) init;
-(id) init: (CSComScore *) st;
-(void) onBeforeDispatch: (CSEventArgs *) a :(CSMeasurement *) m;
-(void) onDispatch: (CSEventArgs *) a :(CSMeasurement *) m;
-(void) enqueueThread:(CSMeasurement *) m;

@end
