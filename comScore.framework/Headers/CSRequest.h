//
//  CSRequest.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSRequestProtocol.h"
#import "CSMeasurement.h"


@interface CSRequest : NSObject <CSRequestProtocol> {
	NSURLRequest *req;
	NSURLConnection *conn;
	NSMutableData *receivedData;
}

-(id) init: (CSMeasurement *) m;

@end
