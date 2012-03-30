//
//  CSDispatcherProtocol.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <UIKit/UIKit.h>
#import "CSEventArgs.h"
#import "CSMeasurement.h"

// Interface for comScore events dispatchers.
@protocol CSDispatcherProtocol

-(void) notify: (CSEventArgs *) args :(CSMeasurement *) ms;
-(void) enqueueThread: (CSMeasurement *) m;

@end
