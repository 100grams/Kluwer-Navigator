//
//  CSEventArgsProtocol.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <UIKit/UIKit.h>
#import "CSEvent.h"

// Interface definition for an Analytics Event Args.
@protocol CSEventArgsProtocol


// Referred event.
@property (assign) CSEvent *event;

// NSTimeInterval containing a UNIX timestamp for the creation date.
@property (assign) NSTimeInterval created;

// Tells if this event will cancel.
@property (assign) BOOL cancel;

@property (assign) NSMutableDictionary *details;

-(void) cancelEvent;

@end
