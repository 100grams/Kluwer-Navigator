//
//  OverviewViewController.m
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 12/3/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import "OverviewViewController.h"
#import "defines.h"

#import <QuartzCore/QuartzCore.h>
#import "AboutViewController.h"
#import <MediaPlayer/MediaPlayer.h>


@implementation OverviewViewController
@synthesize backgroundView;
@synthesize bottomLabelContainer;
@synthesize topLabelContainer;
@synthesize midLabelContainer;
@synthesize labelsContainerLandscape;
@synthesize topScrollViewLandscape;
@synthesize midScrollViewLandscape;
@synthesize bottomScrollViewLandscape;

@synthesize topScrollViewPortrait, midScrollViewPortrait, bottomScrollViewPortrait;
@synthesize topLabelPortrait, midLabelPortrait, bottomLabelPortrait;
@synthesize topLabelLandscape;
@synthesize midLabelLandscape;
@synthesize bottomLabelLandscape;
@synthesize mediaItems=_mediaItems;

@synthesize viewOrientation;
@synthesize portraitView;
@synthesize landscapeView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // load the media from cache
    
    [self unarchiveMediaItems];
    
    // set gradients
    [self setBackgrounds];

    [topScrollViewPortrait setContentInset:UIEdgeInsetsMake(0, 20, 0, 0)];
    [midScrollViewPortrait setContentInset:UIEdgeInsetsMake(0, 20, 0, 0)];
    [bottomScrollViewPortrait setContentInset:UIEdgeInsetsMake(0, 20, 0, 0)];
    

}

- (void) setBackgrounds
{
    
    CAGradientLayer *glayer = (CAGradientLayer*)backgroundView.layer;
    UIColor *topColor = [UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1.0];
    UIColor *bottomColor = [UIColor colorWithRed:216.0/255 green:216.0/255 blue:216.0/255 alpha:1.0];//UIColorFromRGBString(@"0b7ad0");
    glayer.colors = [NSArray arrayWithObjects:(id)[topColor CGColor], (id)[bottomColor CGColor], nil];
    
//    topColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
//    bottomColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];

//    glayer = (CAGradientLayer*)topLabelContainer.layer;
//    glayer.colors = [NSArray arrayWithObjects:(id)[topColor CGColor], (id)[bottomColor CGColor], nil];

//    glayer = (CAGradientLayer*)midLabelContainer.layer;
//    glayer.colors = [NSArray arrayWithObjects:(id)[topColor CGColor], (id)[bottomColor CGColor], nil];
//
//    glayer = (CAGradientLayer*)bottomLabelContainer.layer;
//    glayer.colors = [NSArray arrayWithObjects:(id)[topColor CGColor], (id)[bottomColor CGColor], nil];

    
}

- (IBAction)showAbout:(id)sender {
    
    AboutViewController *controller = [[[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil] autorelease];
    
    [self.navigationController pushViewController:controller animated:YES];
}




- (void)viewDidUnload
{
    [self setLandscapeView:nil];
    [self setPortraitView:nil];
    [self setTopLabelLandscape:nil];
    [self setMidLabelLandscape:nil];
    [self setBottomLabelLandscape:nil];
    [self setTopScrollViewLandscape:nil];
    [self setMidScrollViewLandscape:nil];
    [self setBottomScrollViewLandscape:nil];
    [self setBackgroundView:nil];
    [self setBottomLabelContainer:nil];
    [self setTopLabelContainer:nil];
    [self setMidLabelContainer:nil];
    [self setLabelsContainerLandscape:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.

    self.topLabelPortrait = nil;
    self.topScrollViewPortrait = nil;
    self.bottomLabelPortrait = nil;
    self.bottomScrollViewPortrait = nil;
    self.midLabelPortrait = nil;
    self.midScrollViewPortrait = nil;
    self.mediaItems = nil;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}



- (void) dealloc
{
    self.mediaItems = nil;
    
    self.topLabelPortrait = nil;
    self.topScrollViewPortrait = nil;
    self.bottomLabelPortrait = nil;
    self.bottomScrollViewPortrait = nil;
    self.midLabelPortrait = nil;
    self.midScrollViewPortrait = nil;
    
    [landscapeView release];
    [portraitView release];
    [topLabelLandscape release];
    [midLabelLandscape release];
    [bottomLabelLandscape release];
    [topScrollViewLandscape release];
    [midScrollViewLandscape release];
    [bottomScrollViewLandscape release];
    [backgroundView release];
    [bottomLabelContainer release];
    [topLabelContainer release];
    [midLabelContainer release];
    [labelsContainerLandscape release];
    [super dealloc];
}


#pragma mark - Orientation Changes

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (viewOrientation == UIDeviceOrientationUnknown || self.modalViewController) {
        self.viewOrientation = interfaceOrientation;
    }
    return YES;
}


- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration;
{
    self.viewOrientation = toInterfaceOrientation;
}

- (void) setViewOrientation:(UIInterfaceOrientation)orientation
{
    if (viewOrientation == orientation) {
        return;
    }
    
    if (orientation != UIDeviceOrientationUnknown && orientation != UIDeviceOrientationFaceUp && orientation != UIDeviceOrientationFaceDown) {
		viewOrientation = orientation;
	}
    
	
	if(UIInterfaceOrientationIsPortrait(orientation))
	{
		[landscapeView removeFromSuperview];
		[self.view insertSubview:portraitView aboveSubview:backgroundView];
	}
	else 
	{
		[portraitView removeFromSuperview];
		[self.view insertSubview:landscapeView aboveSubview:backgroundView];
	}
    
}



#pragma mark - Media Items



- (void) addMediaItem : (NSDictionary *) item
{
    // if item already exists - update it

    NSInteger index = [_mediaItems indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return *stop = [[obj valueForKey:@"id"] isEqualToString:[item valueForKey:@"id"]];
    }];
    if (index != NSNotFound) {
        NSMutableDictionary *revisedItem = [[[_mediaItems objectAtIndex:index] mutableCopy] autorelease];
        [revisedItem addEntriesFromDictionary:item];
        [_mediaItems replaceObjectAtIndex:index withObject:revisedItem];

        [self replaceCellAtIndex:index withMediaItem:revisedItem];

    }
    else{
        // item is new - add it
        [_mediaItems addObject:item];
        [self addNewCellWithMediaItem:item];
    }


}


- (void) insertCellAtIndex:(NSInteger) index withMediaItem : (NSDictionary*) item;
{
    // TODO
}



- (void) replaceCellAtIndex:(NSInteger) index withMediaItem : (NSDictionary*) item 
{
    NSString *type = [item valueForKey:@"type"];

    // handle portrait
    UIScrollView *scrollViewPortrait = [self scrollViewForMediaType:type interfaceOrientation:UIInterfaceOrientationPortrait];
    UIScrollView *scrollViewLandscape = [self scrollViewForMediaType:type interfaceOrientation:UIInterfaceOrientationLandscapeLeft];
    
    if ([[scrollViewPortrait subviews] count] > index) {
        ScrollViewCell *cell = [[scrollViewPortrait subviews] objectAtIndex:index];
        [cell initWithMediaItem:item]; 
    }
    if ([[scrollViewLandscape subviews] count] > index) {
        ScrollViewCell *cell = [[scrollViewLandscape subviews] objectAtIndex:index];
        [cell initWithMediaItem:item]; 
    }
    
}



- (void) addNewCellWithMediaItem:(NSDictionary*)item 
{
    NSString *type = [item valueForKey:@"type"];
    UIScrollView *scrollViewPortrait = [self scrollViewForMediaType:type interfaceOrientation:UIInterfaceOrientationPortrait];
    UIScrollView *scrollViewLandscape = [self scrollViewForMediaType:type interfaceOrientation:UIInterfaceOrientationLandscapeLeft];
    
    ScrollViewCell *cell = [ScrollViewCell cellWithMediaItem:item];
    CGRect frame = cell.frame;
    frame.origin = CGPointMake(scrollViewPortrait.contentSize.width, 0);
    frame.size = [self cellSizeForMediaType:type];
    cell.frame = frame;
    [scrollViewPortrait setContentSize:CGSizeMake(scrollViewPortrait.contentSize.width + cell.frame.size.width, scrollViewPortrait.bounds.size.height)];
    [scrollViewPortrait addSubview:cell];
    cell.delegate = self;
    
    cell = [ScrollViewCell cellWithMediaItem:item];
    frame = cell.frame;
    frame.origin = CGPointMake(0, scrollViewLandscape.contentSize.height);
    frame.size = [self cellSizeForMediaType:type];
    cell.frame = frame;
    [scrollViewLandscape setContentSize:CGSizeMake(scrollViewLandscape.bounds.size.width, scrollViewLandscape.contentSize.height + cell.frame.size.height)];
    [scrollViewLandscape addSubview:cell];
    cell.delegate = self;
    
    
    
}



- (UIScrollView*) scrollViewForMediaType:(NSString*)type
{
    return [self scrollViewForMediaType:type interfaceOrientation:viewOrientation];
}


- (UIScrollView*) scrollViewForMediaType:(NSString*)type interfaceOrientation:(UIInterfaceOrientation)orientation
{
    if ([type isEqualToString:@"video"]) {
        return UIDeviceOrientationIsPortrait(orientation)? topScrollViewPortrait : topScrollViewLandscape;
    }
    else if ([type isEqualToString:@"whitepaper"]) {
        return UIDeviceOrientationIsPortrait(orientation)? bottomScrollViewPortrait : bottomScrollViewLandscape;
    }
    else if ([type isEqualToString:@"presentation"]) {
        return UIDeviceOrientationIsPortrait(orientation)? midScrollViewPortrait : midScrollViewLandscape;
    }
    
    return nil;
}

         
         

- (CGSize) cellSizeForMediaType:(NSString*)type
{
    if ([type isEqualToString:@"video"]) {
        return CGSizeMake(450, 303);
    }
    else{
        return CGSizeMake(230, 208);
    }
 
}

- (void) archiveMediaItems;
{
    if (self.mediaItems) {
        
        NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *archiveName = [documentsDirectory stringByAppendingString:@"/media.archive"];
        NSFileManager *fm = [NSFileManager defaultManager];
        NSError *error=nil;
        if([fm fileExistsAtPath:archiveName]){
            [fm removeItemAtPath:archiveName error:&error];
        }
        if (error) {
            DLog(DEBUG_LEVEL_ERROR, @"ERROR in archiveMediaItems. Cannot remove old media archive. %@", [error localizedDescription]);
        }
        
        if(![NSKeyedArchiver archiveRootObject:self.mediaItems toFile:archiveName]){
            DLog(DEBUG_LEVEL_ERROR, @"ERROR: cannot archive media items list!")
        }
        
        
    }
    
}



#define LOCAL_MEDIA_FEED @"campaignContent"

- (void) unarchiveMediaItems;
{
    
#ifdef LOCAL_MEDIA_FEED
    NSString *archiveName = [[NSBundle mainBundle] pathForResource:LOCAL_MEDIA_FEED ofType:@"xml" inDirectory:nil]; 
    if (archiveName) {
        _mediaItems = [NSMutableArray arrayWithCapacity:32];
       _data = [[NSData dataWithContentsOfFile:archiveName] retain];
        [self connectionDidFinishLoading:nil]; //parse _data        
    }
#else    
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *archiveName = [documentsDirectory stringByAppendingString:@"/media.archive"];
    NSFileManager *fm = [NSFileManager defaultManager];
    if([fm fileExistsAtPath:archiveName]){
        NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:archiveName];
        _mediaItems = [NSMutableArray arrayWithCapacity:[array count]];
        [_mediaItems addObjectsFromArray:array];
    }
#endif
    else{
        _mediaItems = [NSMutableArray arrayWithCapacity:32];
    }
    
}




#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
{
    _data = [[NSMutableData alloc] initWithCapacity:(response.expectedContentLength != -1? response.expectedContentLength : 0)]; 
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
{
    [_data appendData:data]; 
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:_data];
    parser.delegate = self;
    if(![parser parse]){
        DLog(DEBUG_LEVEL_ERROR, @"ERROR paring data: %@", [parser parserError]);
        [parser release];
        [_data release];
    }
}



#pragma mark - NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
{
    if ([elementName isEqualToString:@"video"] || 
        [elementName isEqualToString:@"whitepaper"] || 
        [elementName isEqualToString:@"presentation"]) {

        _currentMediaItem = [[NSMutableDictionary alloc] initWithCapacity:7];
        [_currentMediaItem setValue:elementName forKey:@"type"];
    }
    else if(_currentMediaItem){
        _currentElementName = [elementName retain];
    }
            
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
{
    if (_currentMediaItem && _currentElementName) {
        [_currentMediaItem setValue:string forKey:_currentElementName];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;
{
    if ([elementName isEqualToString:@"video"] || 
        [elementName isEqualToString:@"whitepaper"] || 
        [elementName isEqualToString:@"presentation"]) {
        
        [self addMediaItem:_currentMediaItem];

        DLog(DEBUG_LEVEL_SOME, @"%@", _currentMediaItem);

        [_currentMediaItem release];
        _currentMediaItem = nil;
        
    }
    else if(_currentMediaItem){
        [_currentElementName release];
        _currentElementName = nil;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser;
{
    DLog(DEBUG_LEVEL_SOME, @"FINISHED parsing data");
    [parser release];
    [_data release];

}



#pragma mark - ScrollViewCellDelegate


- (void) didClickInScrollViewCell:(ScrollViewCell*)cell;
{

    previewedMediaItem = cell.mediaItem;
    
    if ([[cell.mediaItem valueForKey:@"type"] isEqualToString:@"video"]) {
                
        NSString *path = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"m4v"];
        NSURL *url = [NSURL fileURLWithPath:path];

        MPMoviePlayerViewController *videoPlayViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
        [self presentMoviePlayerViewControllerAnimated:videoPlayViewController];
        [videoPlayViewController release];

    }
    else if([[cell.mediaItem valueForKey:@"type"] isEqualToString:@"whitepaper"] || 
            [[cell.mediaItem valueForKey:@"type"] isEqualToString:@"presentation"]){
        
        // push PDF view controller
        QLPreviewController *previewController = [[QLPreviewController alloc] init];
        previewController.dataSource = self;
        previewController.delegate = self;
        previewController.currentPreviewItemIndex = 0;
        [self presentModalViewController:previewController animated:YES];
        [previewController release];
    }
    
}


#pragma mark - QLPreviewControllerDataSource, 
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller;
{
    return 1;
}

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index;
{
    NSURL *url = nil;

    // TODO: take the url directly from previewedMediaItem once the feed is real (comes from the server)
    
    if([[previewedMediaItem valueForKey:@"type"] isEqualToString:@"whitepaper"]){

        NSString *path = [[NSBundle mainBundle] pathForResource:@"Aandeslagmet_bronnen_A4_FC_LR" ofType:@"pdf"];
        url = [NSURL fileURLWithPath:path];

    }
    else if([[previewedMediaItem valueForKey:@"type"] isEqualToString:@"presentation"]){

        NSString *path = [[NSBundle mainBundle] pathForResource:@"Travelpack Klantpresentatie 20022012" ofType:@"pdf"];
        url = [NSURL fileURLWithPath:path];

    }

    return url;
}


#pragma mark - QLPreviewControllerDelegate

@end















