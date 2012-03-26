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
#import "WebViewController.h"

@implementation OverviewViewController
@synthesize dot1;
@synthesize dot2;
@synthesize dot3;
@synthesize dot4;
@synthesize dot5;
@synthesize dot6;
@synthesize dot7;
@synthesize dot8;
@synthesize dot9;
@synthesize dot10;
@synthesize dot11;
@synthesize dot12;
@synthesize dot13;
@synthesize dot14;
@synthesize dotsContainer;
@synthesize loadingOverlayPortrait;
@synthesize loadingOverlayLandscape;
@synthesize backgroundView;
@synthesize headerView;
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
@synthesize previewedMediaItem;

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

    // load new media from the server
    [self getContentFeed];

    // set gradients
    [self setBackgrounds];
    
    [topScrollViewPortrait setContentInset:UIEdgeInsetsMake(0, 20, 0, 0)];
    [midScrollViewPortrait setContentInset:UIEdgeInsetsMake(0, 20, 0, 0)];
    [bottomScrollViewPortrait setContentInset:UIEdgeInsetsMake(0, 20, 0, 0)];
    
    isLoading = YES;
    dotIndex = 1;
    [self startLoadingAnimation];
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
    self.previewedMediaItem = nil;
    
    [self setLoadingOverlayLandscape:nil];
    [self setDot1:nil];
    [self setDot2:nil];
    [self setDot3:nil];
    [self setDot4:nil];
    [self setDot5:nil];
    [self setDot6:nil];
    [self setDot7:nil];
    [self setDot8:nil];
    [self setDot9:nil];
    [self setDot10:nil];
    [self setDot11:nil];
    [self setDot12:nil];
    [self setDot13:nil];
    [self setDot14:nil];
    [self setHeaderView:nil];
    [self setDotsContainer:nil];
    [self setLoadingOverlayPortrait:nil];
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

    self.viewOrientation = [UIApplication sharedApplication].statusBarOrientation;

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
    self.previewedMediaItem = nil;
    
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
    [loadingOverlayLandscape release];
    [dot1 release];
    [dot2 release];
    [dot3 release];
    [dot4 release];
    [dot5 release];
    [dot6 release];
    [dot7 release];
    [dot8 release];
    [dot9 release];
    [dot10 release];
    [dot11 release];
    [dot12 release];
    [dot13 release];
    [dot14 release];
    [headerView release];
    [dotsContainer release];
    [loadingOverlayPortrait release];
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


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
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
		if (isLoading) {
            [self.view addSubview:portraitView];
            [loadingOverlayPortrait addSubview:dotsContainer];
            dotsContainer.center = CGPointMake(384, 542);
        }
        else{
            [self.view insertSubview:portraitView aboveSubview:backgroundView];
        }
	}
	else 
	{
		[portraitView removeFromSuperview];
		if (isLoading) {
            [self.view addSubview:landscapeView];
            [loadingOverlayLandscape addSubview:dotsContainer];
            dotsContainer.center = CGPointMake(512, 408);
        }
        else{
            [self.view insertSubview:landscapeView aboveSubview:backgroundView];
        }
	}
    
}


#pragma mark - Fetching Content

- (void) getContentFeed
{
    connectionState = ConnectionStateFetchContent;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kCreatieUrl]];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
}

- (void) startLoadingAnimation
{
    [UIView animateWithDuration:0.2 animations:^{
        
        DLog(DEBUG_LEVEL_SOME, @"dotIndex %d", dotIndex);
        UIView *dot = [self valueForKey:[NSString stringWithFormat:@"dot%d", dotIndex]];
        dot.alpha = !dot.alpha;
        
    } completion:^(BOOL finished) {
        
        dotIndex++;
        if (dotIndex > 14) {
            dotIndex = 1;
        }
        
        if (isLoading) {
            [self startLoadingAnimation];
        }
        
    }];

}


#pragma mark - Managing Media Items



- (void) addMediaItem : (NSDictionary *) item
{
    // if item already exists - update it

    NSDictionary *existingItem = [[_mediaItems objectsPassingTest:^BOOL(id obj, BOOL *stop) {
        return *stop = [[obj valueForKey:@"id"] isEqualToString:[item valueForKey:@"id"]];
    }] anyObject];
    
    if (existingItem) {
        NSMutableDictionary *revisedItem = [[existingItem mutableCopy] autorelease];
        [revisedItem addEntriesFromDictionary:item];        

        [_mediaItems removeObject:existingItem];
        [_mediaItems addObject:revisedItem];

        [_updatedItems addObject:revisedItem];

    }
    else{
        // item is new - add it
        [_mediaItems addObject:item];
        [_updatedItems addObject:item];
    }


}


- (void) populateScrollViews
{
    NSArray *sortedVideos = [self sortedMediaItemsOfType:@"video"];
    [sortedVideos enumerateObjectsUsingBlock:^(NSDictionary *item, NSUInteger idx, BOOL *stop) {
        [self addNewCellWithMediaItem:item];
    }];
    
    NSArray *sortedWhitepapers = [self sortedMediaItemsOfType:@"whitepaper"];
    [sortedWhitepapers enumerateObjectsUsingBlock:^(NSDictionary *item, NSUInteger idx, BOOL *stop) {
        [self addNewCellWithMediaItem:item];
    }];

    NSArray *sortedPresentations = [self sortedMediaItemsOfType:@"presentation"];
    [sortedPresentations enumerateObjectsUsingBlock:^(NSDictionary *item, NSUInteger idx, BOOL *stop) {
        [self addNewCellWithMediaItem:item];
    }];


}

- (void) insertCellAtIndex:(NSInteger) index withMediaItem : (NSDictionary*) item;
{
    // TODO
}



- (void) replaceCellAtIndex:(NSInteger) index withMediaItem : (NSDictionary*) item 
{
    NSString *type = [item valueForKey:@"filetype"];

    UIScrollView *scrollViewPortrait = [self scrollViewForMediaType:type interfaceOrientation:UIInterfaceOrientationPortrait];
    UIScrollView *scrollViewLandscape = [self scrollViewForMediaType:type interfaceOrientation:UIInterfaceOrientationLandscapeLeft];
    
    if ([[scrollViewPortrait subviews] count] > index) {
        ScrollViewCell *cell = [[scrollViewPortrait subviews] objectAtIndex:index];
        [cell initWithMediaItem:item]; 
        cell = [[scrollViewLandscape subviews] objectAtIndex:index];
        [cell initWithMediaItem:item]; 
    }
    else {
        [self addNewCellWithMediaItem:item];
    }
    
}


- (void) removeCellWithMediaItem : (NSDictionary*) item
{
    NSString *type = [item valueForKey:@"filetype"];
    UIScrollView *scrollViewPortrait = [self scrollViewForMediaType:type interfaceOrientation:UIInterfaceOrientationPortrait];
    UIScrollView *scrollViewLandscape = [self scrollViewForMediaType:type interfaceOrientation:UIInterfaceOrientationLandscapeLeft];

    NSInteger index = [self displayIndexOfMediaItem:item];

    if ([[scrollViewPortrait subviews] count] > index) {
        
        ScrollViewCell *cellPortrait = [[scrollViewPortrait subviews] objectAtIndex:index];
        ScrollViewCell *cellLandscape = [[scrollViewLandscape subviews] objectAtIndex:index];

        [UIView animateWithDuration:0.25 animations:^{
            cellPortrait.alpha = 0.0;
            cellLandscape.alpha = 0.0;
            for (int i=index+1; i<[[scrollViewPortrait subviews] count]; i++) {
                UIView *view = [[scrollViewPortrait subviews] objectAtIndex:i];
                CGRect frame = view.frame;
                frame.origin.x -= cellPortrait.frame.size.width;
                view.frame = frame;
                
                view = [[scrollViewLandscape subviews] objectAtIndex:i];
                frame = view.frame;
                frame.origin.y -= cellLandscape.frame.size.height;
                view.frame = frame;
            }            
        } completion:^(BOOL finished) {
            CGSize size = scrollViewPortrait.contentSize;
            size.width -= cellPortrait.frame.size.width;
            scrollViewPortrait.contentSize = size; 

            size = scrollViewLandscape.contentSize;
            size.height -= cellLandscape.frame.size.height;
            scrollViewLandscape.contentSize = size; 

            [cellPortrait removeFromSuperview];
            [cellLandscape removeFromSuperview];

        }];

    }
    
    DLog(DEBUG_LEVEL_VERBOSE, @"REMOVED %@ scroll view item at index %d: %@", [item valueForKey:@"filetype"], index, item);                


}


- (void) addNewCellWithMediaItem:(NSDictionary*)item 
{
    NSString *type = [item valueForKey:@"filetype"];
    UIScrollView *scrollViewPortrait = [self scrollViewForMediaType:type interfaceOrientation:UIInterfaceOrientationPortrait];
    UIScrollView *scrollViewLandscape = [self scrollViewForMediaType:type interfaceOrientation:UIInterfaceOrientationLandscapeLeft];
    
    ScrollViewCell *cell = [ScrollViewCell cellWithMediaItem:item];
    CGRect frame = cell.frame;
    frame.size = [self cellSizeForMediaType:type];
    frame.origin = CGPointMake(scrollViewPortrait.contentSize.width, (scrollViewPortrait.frame.size.height-frame.size.height)/2);
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
        return CGSizeMake(450, 290);
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



//#define LOCAL_MEDIA_FEED @"campaignContent"

- (void) unarchiveMediaItems;
{
    
#ifdef LOCAL_MEDIA_FEED
    NSString *archiveName = [[NSBundle mainBundle] pathForResource:LOCAL_MEDIA_FEED ofType:@"xml" inDirectory:nil]; 
    if (archiveName) {
        _mediaItems = [[NSMutableArray alloc] initWithCapacity:32];
       _data = [[NSData dataWithContentsOfFile:archiveName] retain];
        [self connectionDidFinishLoading:nil]; //parse _data        
    }
#else    
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *archiveName = [documentsDirectory stringByAppendingString:@"/media.archive"];
    NSFileManager *fm = [NSFileManager defaultManager];
    if([fm fileExistsAtPath:archiveName]){
        NSSet *set = [NSKeyedUnarchiver unarchiveObjectWithFile:archiveName];
        _mediaItems = [[NSMutableSet alloc] initWithCapacity:[set count]];
        [_mediaItems unionSet:set];
    }
#endif
    else{
        _mediaItems = [[NSMutableSet alloc] initWithCapacity:32];
    }
    
}



- (void) purgeOldMediaItems
{
    // get rid of any media items which weren't updated
    NSMutableSet *allItems = [[[NSMutableSet alloc] initWithCapacity:[_mediaItems count]] autorelease];
    [allItems unionSet:_mediaItems];
    [allItems minusSet:_updatedItems];
    
    NSError *error = nil;
    for(NSDictionary *item in allItems){
        NSString *fileName = [item valueForKey:@"media_file"];
        if(![[NSFileManager defaultManager] removeItemAtPath:fileName error:&error]){
            DLog(DEBUG_LEVEL_ERROR, @"ERROR removing file %@", fileName);
        }

        [self removeCellWithMediaItem:item];
        [_mediaItems removeObject:item];
    }
    
    DLog(DEBUG_LEVEL_VERBOSE, @"Removed %d old items", [allItems count]);


}
                                

- (NSArray*) sortedMediaItemsOfType:(NSString*)type
{
    NSSet *itemsOfType = [_mediaItems objectsPassingTest:^BOOL(id obj, BOOL *stop) {
        return [[obj valueForKey:@"filetype"] isEqualToString:type];
    }];
    
    return [itemsOfType sortedArrayUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"id" ascending:YES]]];
}

- (NSInteger) displayIndexOfMediaItem:(NSDictionary*)item
{
    NSArray *itemsOfType = [self sortedMediaItemsOfType:[item valueForKey:@"filetype"]];

   return [itemsOfType indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return *stop = [[obj valueForKey:@"id"] isEqualToString:[item valueForKey:@"id"]];
    }];

}
                                

#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
{
//    if (connectionState == ConnectionStateFetchContent) {
        _data = [[NSMutableData alloc] initWithCapacity:(response.expectedContentLength != -1? response.expectedContentLength : 0)]; 
//    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
{
    [_data appendData:data]; 

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
{
    switch (connectionState) {
        case ConnectionStateFetchContent:
        {
            [_updatedItems release];
            _updatedItems = [[NSMutableSet alloc] initWithCapacity:[_mediaItems count]];
            
            // update media items
            NSXMLParser *parser = [[NSXMLParser alloc] initWithData:_data];
            parser.delegate = self;
            if(![parser parse]){
                DLog(DEBUG_LEVEL_ERROR, @"ERROR paring data: %@", [parser parserError]);
                [parser release];
                [_data release];
            }

            DLog(DEBUG_LEVEL_VERBOSE, @"Number of media items before cleanup: %d", [_mediaItems count]);
            [self purgeOldMediaItems];
            
            DLog(DEBUG_LEVEL_VERBOSE, @"Finished updating content. Current number of media items: %d", [_mediaItems count]);

            [self populateScrollViews];
            
            isLoading = NO;
            [UIView animateWithDuration:0.25 animations:^{
                loadingOverlayPortrait.alpha = 0.0;
                loadingOverlayLandscape.alpha = 0.0;
            } completion:^(BOOL finished) {
                [loadingOverlayPortrait removeFromSuperview];
                [loadingOverlayLandscape removeFromSuperview];
            }];
            
        }
            
            break;
        case ConnectionStateFetchMediaUrl:
        {
            NSString *fileName = [previewedMediaItem valueForKey:@"media_file"];
            if (![[NSFileManager defaultManager] fileExistsAtPath:fileName]){
                NSString *directory = [fileName stringByDeletingLastPathComponent];
                NSError *error = nil;
                if(![[NSFileManager defaultManager] createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:&error]){
                    DLog(DEBUG_LEVEL_ERROR, @"ERROR %@", error );
                }
                if(![[NSFileManager defaultManager] createFileAtPath:fileName contents:_data attributes:nil]){
                    DLog(DEBUG_LEVEL_ERROR, @"ERROR cannot create file %@", fileName );
                }
            }
            else{
                if(![_data writeToFile:fileName atomically:NO]){
                    DLog(DEBUG_LEVEL_ERROR, @"ERROR cannot write data to cache file %@", fileName );
                }                
            }
            
            if (loadingCell) {
                [loadingCell setLoading:NO];
                loadingCell = nil;
                [self archiveMediaItems];
            }
            [self previewMediaItem:previewedMediaItem];
        }
        default:
            break;
    }
}



#pragma mark - NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
{
    if ([elementName isEqualToString:@"file"]){
        _currentMediaItem = [[NSMutableDictionary alloc] initWithCapacity:7];
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
    if ([elementName isEqualToString:@"file"]) {
        
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

    self.previewedMediaItem = cell.mediaItem;

    if ([[previewedMediaItem valueForKey:@"filetype"] isEqualToString:@"video"] || [self isMediaItemCached:previewedMediaItem]) 
    {
        [self previewMediaItem : previewedMediaItem];        
    }    
    else if(!loadingCell){
        [self cacheNewContentForCell:cell];
    }
}


- (BOOL) isMediaItemCached:(NSDictionary*)item
{
    NSString *fileName = [previewedMediaItem valueForKey:@"media_file"];
    if (fileName) {
        return [[NSFileManager defaultManager] fileExistsAtPath:fileName];
    }
    return NO;
}


- (void) cacheNewContentForCell:(ScrollViewCell*)cell
{
    [cell setLoading:YES];
    loadingCell = cell;
    
    NSString* cachesDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *fileName = [cachesDirectory stringByAppendingPathComponent:[previewedMediaItem valueForKey:@"filetype"]];
    fileName = [fileName stringByAppendingPathComponent:[previewedMediaItem valueForKey:@"id"]];
    NSString *mimetype = [previewedMediaItem valueForKey:@"mimetype"];
    NSString *extension = [mimetype substringFromIndex:[mimetype rangeOfString:@"/"].location + 1]; 
    fileName = [fileName stringByAppendingPathExtension:extension];
    [previewedMediaItem setValue:fileName  forKey:@"media_file"];
    
    connectionState = ConnectionStateFetchMediaUrl;
    NSURL *url = [NSURL URLWithString:[cell.mediaItem valueForKey:@"url"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];

}


- (void) previewMediaItem : (NSDictionary*) mediaItem 
{
    if ([[mediaItem valueForKey:@"filetype"] isEqualToString:@"video"]) {
        
        WebViewController *controller = [[[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil] autorelease];
        controller.url = [mediaItem valueForKey:@"url"];
        
        [self.navigationController pushViewController:controller animated:YES];
        self.navigationController.navigationBarHidden = NO;
        
//        MPMoviePlayerViewController *videoPlayViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
//        [self presentMoviePlayerViewControllerAnimated:videoPlayViewController];
//        [videoPlayViewController release];
        
    }
    else if([[mediaItem valueForKey:@"mimetype"] rangeOfString:@"pdf"].location != NSNotFound){ 
        
//        NSURL *url = [NSURL URLWithString:[mediaItem valueForKey:@"url"]];
//        UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        [webView loadRequest:request];
//        [self.view addSubview:webView];

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
    return [NSURL fileURLWithPath:[self.previewedMediaItem valueForKey:@"media_file"]];
}


#pragma mark - QLPreviewControllerDelegate

@end















