//
//  CScomScore.h
//  comScore
//

// Copyright 2011 comScore, Inc. All right reserved.
//

#import <Foundation/Foundation.h>
#import "CSAnalytics.h"
#import "CSEventType.h"

@class CSComScoreDispatcher, CSCensus;


/**
 Nedstat ComScore analytics interface
 */
@interface CSComScore : CSAnalytics {
	NSString *customerID;
	NSString *visitorID;
	NSString *salt;
	NSString *appName;
	NSString *devModel;
	NSTimeInterval genesis;
	BOOL anonymous;
}


/**
 Returns CSComScore instance.
 */
+ (CSComScore *)comScore;

/**
 Returns CSCensus instance.
 */
+ (CSCensus *)census;

/**
 PixelURL setter.
 
 Parameters:
 
 - value: A NSString that contains the PixelURL.
 */
-(void) setPixelURL: (NSString *) value;

/**
 Notify Analytics View event with custom PixelURL.
 
 Parameters:
 
 - pixelUrl: A NSString that contains the PixelURL.
 */
-(void) notifyWithPixelURL: (NSString *) pixelUrl;

/**
 Notify Analytics View event with custom labels
 
 Parameters:
 
 - labels: A NSDictionary that contains a set of custom labels with key-value pairs.
 */
-(void) notifyWithLabels: (NSDictionary *) labels;

/**
 Notify Analytics View event with custom PixelURL and labels
 
 Parameters:
 
 - pixelUrl: A NSString that contains the PixelURL.
 - labels: A NSDictionary that contains a set of custom labels with key-value pairs.
 */
-(void) notifyWithPixelURL: (NSString *) pixelUrl andLabels: (NSDictionary *) labels;

/**
 Notify Analytics event (View / Hidden) with custom labels
 
 Parameters:
 
 - type: A CSAnalyticsEventType enum that value must be View or Hidden.
 - labels: A NSDictionary that contains a set of custom labels with key-value pairs.
 */
-(void) notifyWithEventType: (CSAnalyticsEventType) type andLabels: (NSDictionary *) labels;

/**
 Notify Analytics event (View / Hidden) with custom PixelURL and labels
 
 Parameters:
 
 - pixelUrl: A NSString that contains the PixelURL.
 - type: A CSAnalyticsEventType enum that value must be View or Hidden.
 - labels: A NSDictionary that contains a set of custom labels with key-value pairs.
 */
-(void) notifyWithPixelURL: (NSString *) pixelUrl eventType: (CSAnalyticsEventType) type andLabels: (NSDictionary *) labels;

/**
 Notify Application event (Start / Close / Aggregate) with custom labels
 
 Parameters:
 
 - type: A CSApplicationEventType enum that value must be Start, Close or Aggregate.
 - labels: A NSDictionary that contains a set of custom labels with key-value pairs.
 */
-(void) notifyWithApplicationEventType: (CSApplicationEventType) type andLabels: (NSDictionary *) labels;

-(id) init;
-(void) setVisitorId: (NSString *) value;
-(NSString *) getVisitorId;
-(void) setSalt: (NSString *) value;
-(NSString *) getSalt;
-(void) setAppName: (NSString *) value;
-(NSString *) getAppName;
-(NSString *) getDevModel;
-(void) setAnonymous: (BOOL) value;
-(BOOL) getAnonymous;
-(NSString *) getVersion;
-(NSTimeInterval) getGenesis;
-(NSString *) md5:(NSString *)str;

@property (assign) CSComScoreDispatcher *dispatcher;
@property (assign) NSMutableDictionary *responders;
@property (setter=setPixelURL:, nonatomic, assign) NSString *pixelURL;
@property (readwrite,assign) BOOL enabled;

@end
