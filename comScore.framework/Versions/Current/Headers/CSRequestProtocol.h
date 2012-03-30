//
//  CSRequestProtocol.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <UIKit/UIKit.h>
#import "CSMeasurement.h"


@protocol CSRequestProtocol

-(NSURL *) process: (NSString *) basePixelURL;
-(NSURL *) process;
-(void) send;
-(BOOL) availableConnection;

@property (assign) CSMeasurement *measurement;

@end
