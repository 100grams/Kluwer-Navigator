//
//  CSProductProtocol.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <UIKit/UIKit.h>
#import "CSComScoreDispatcher.h"

@class CSComScore;

// Interface for Nedstat's Products
@protocol CSProductProtocol

// Every product has a comScore Parent
@property (assign) CSComScore *parent;

// Every product has a Dispatcher
@property (assign) CSComScoreDispatcher *dispatcher;


@end
