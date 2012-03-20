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




@interface OverviewViewController : UIViewController <NSURLConnectionDataDelegate, NSXMLParserDelegate, ScrollViewCellDelegate, QLPreviewControllerDataSource, QLPreviewControllerDelegate>
{
    NSMutableData *_data;
    NSDictionary *_currentMediaItem;
    NSString *_currentElementName;
    
    NSMutableArray *_mediaItems;
    
    NSDictionary *previewedMediaItem;

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

@property (nonatomic, assign) UIInterfaceOrientation viewOrientation;

@property (retain, nonatomic) IBOutlet UIView *portraitView;
@property (retain, nonatomic) IBOutlet UIView *landscapeView;


- (void) archiveMediaItems;
- (void) unarchiveMediaItems;

- (void) setBackgrounds;

- (IBAction)showAbout:(id)sender;

// adding media items to the scroll views

- (UIScrollView*) scrollViewForMediaType:(NSString*)type;
- (UIScrollView*) scrollViewForMediaType:(NSString*)type interfaceOrientation:(UIInterfaceOrientation)orientation;

- (CGSize) cellSizeForMediaType:(NSString*)type;

- (void) addNewCellWithMediaItem:(NSDictionary*)item;

- (void) replaceCellAtIndex:(NSInteger) index withMediaItem : (NSDictionary*) item;
- (void) insertCellAtIndex:(NSInteger) index withMediaItem : (NSDictionary*) item;

@end
