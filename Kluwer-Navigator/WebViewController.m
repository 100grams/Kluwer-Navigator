//
//  WebViewController.m
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 22/3/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import "WebViewController.h"
#import "defines.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize webView;
@synthesize url;
@synthesize backgroundImageView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    ((HitTestView*)self.view).delegate = self;

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [webView loadRequest:request];
    
    webView.scalesPageToFit = YES;
    
    [self updateLoadingImageForOrientation : [UIApplication sharedApplication].statusBarOrientation];

}

- (void)viewDidUnload
{
    [self setWebView:nil];		
    [self setBackgroundImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self updateLoadingImageForOrientation:toInterfaceOrientation];
}

- (void) updateLoadingImageForOrientation : (UIInterfaceOrientation) orientation
{
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        backgroundImageView.image = [UIImage imageNamed:@"video-load-portrait"];
    }
    else{
        backgroundImageView.image = [UIImage imageNamed:@"video-load-landscape"];            
    }
}


- (void)dealloc {
    [webView release];
    self.url = nil;
    
    [backgroundImageView release];
    [super dealloc];
}


- (void) didHitView:(UIView *)view
{
    self.navigationController.navigationBarHidden = !self.navigationController.navigationBarHidden;
}


- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    [UIView animateWithDuration:0.25 animations:^{
        backgroundImageView.alpha = 0.0;
    }];
}

- (void)webViewDidStartLoad:(UIWebView *)webView;
{
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
{
    DLog(DEBUG_LEVEL_ERROR, @"webView didFaileLoadWithError: %@", error);
    [UIView animateWithDuration:0.25 animations:^{
        backgroundImageView.alpha = 0.0;
    }];
    
}


@end
