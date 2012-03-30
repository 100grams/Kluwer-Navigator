//
//  CSQueue.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSRequest.h"
#import "CSAggregateMeasurement.h"

extern char const *CSComScoreDispatchQueue;
extern bool const CSComScoreAsyncDispatch;

@interface CSQueue : NSObject {
	CSRequest *last;
	
	/// List of non-dispatched Request(s) contained in the queue.
	NSMutableArray *queue;
	
	//Aggregate measurement in memory
	CSAggregateMeasurement *aggr;
    
    dispatch_queue_t dispatchQueue;
}

+(CSQueue *) queue;
-(CSRequest *) getLast;
-(void) engage;
-(CSRequest *) peek;
-(void) enqueueRequest: (CSRequest *) r;
-(void) enqueueMeasurement: (CSMeasurement *) m;
-(CSRequest *) dequeue;
-(void) process;

@end
