//
//  CSAnalyticsApplications.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSAnalytics.h"
#import "CSApplicationDispatcher.h"


@interface CSApplication : CSAnalytics {

}

-(id) init;

@property (assign) CSApplicationDispatcher *dispatcher;

@end
