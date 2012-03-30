//
//  CSStore.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSStoreProp.h"


@interface CSStore : NSObject {
	
}

+(CSStore *) store;

@property (readonly) CSStoreProp *runs;
@property (assign) BOOL firstRun;

@end
