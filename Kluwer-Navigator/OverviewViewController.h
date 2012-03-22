//
//  OverviewViewController.h
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 12/3/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollViewCell.h"
#import <QuickLook/QuickLook.h>


enum ConnectionState {
    ConnectionStateFetchContent,
    ConnectionStateFetchMediaUrl
};

@interface OverviewViewController : UIViewController <NSURLConnectionDataDelegate, NSXMLParserDelegate, ScrollViewCellDelegate, QLPreviewControllerDataSource, QLPreviewControllerDelegate>
{
    NSMutableData *_data;
    NSDictionary *_currentMediaItem;
    NSString *_currentElementName;
    
    NSMutableArray *_mediaItems;
    ScrollViewCell *loadingCell;
    
    NSInteger connectionState;

}
@property (retain, nonatomic) IBOutlet UIView *backgroundView;
@property (retain, nonatomic) IBOutlet UIView *bottomLabelContainer;
@property (retain, nonatomic) IBOutlet UIView *topLabelContainer;
@property (retain, nonatomic) IBOutlet UIView *midLabelContainer;
@property (retain, nonatomic) IBOutlet UIView *labelsContainerLandscape;

@property (nonatomic, retain) IBOutlet UIScrollView *topScrollViewPortrait; 
@property (nonatomic, retain) IBOutlet UIScrollView *midScrollViewPortrait; 
@property (nonatomic, retain) IBOutlet UIScrollView *bottomScrollViewPortrait; 
@property (retain, nonatomic) IBOutlet UIScrollView *topScrollViewLandscape;
@property (retain, nonatomic) IBOutlet UIScrollView *midScrollViewLandscape;
@property (retain, nonatomic) IBOutlet UIScrollView *bottomScrollViewLandscape;

@property (nonatomic, retain) IBOutlet UILabel *topLabelPortrait; 
@property (nonatomic, retain) IBOutlet UILabel *midLabelPortrait; 
@property (nonatomic, retain) IBOutlet UILabel *bottomLabelPortrait; 
@property (retain, nonatomic) IBOutlet UILabel *topLabelLandscape;
@property (retain, nonatomic) IBOutlet UILabel *midLabelLandscape;
@property (retain, nonatomic) IBOutlet UILabel *bottomLabelLandscape;

@property (nonatomic, retain) NSArray *mediaItems;
@property (nonatomic, retain) NSDictionary *previewedMediaItem;


@property (nonatomic, assign) UIInterfaceOrientation viewOrientation;

@property (retain, nonatomic) IBOutlet UIView *portraitView;
@property (retain, nonatomic) IBOutlet UIView *landscapeView;


// Fetching content from the server
- (void) getContentFeed;

// Archiving/Unarchiving content
- (void) archiveMediaItems;
- (void) unarchiveMediaItems;

// preview Content 
- (void) previewMediaItem : (NSDictionary*) mediaItem;


- (IBAction)showAbout:(id)sender;

// adding media items to the scroll views

- (UIScrollView*) scrollViewForMediaType:(NSString*)type;
- (UIScrollView*) scrollViewForMediaType:(NSString*)type interfaceOrientation:(UIInterfaceOrientation)orientation;

- (CGSize) cellSizeForMediaType:(NSString*)type;

- (void) addNewCellWithMediaItem:(NSDictionary*)item;

- (void) replaceCellAtIndex:(NSInteger) index withMediaItem : (NSDictionary*) item;
- (void) insertCellAtIndex:(NSInteger) index withMediaItem : (NSDictionary*) item;

- (void) setBackgrounds;

@end
