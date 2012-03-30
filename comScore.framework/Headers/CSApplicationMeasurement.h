//
//  CSApplicationMeasurement.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSComScoreMeasurement.h"
#import "CSApplicationEventArgs.h"


@interface CSApplicationMeasurement : CSComScoreMeasurement {

}

-(id) init;
-(id) initWithApplicationEventArgs: (CSApplicationEventArgs *) appArgs;

@end
