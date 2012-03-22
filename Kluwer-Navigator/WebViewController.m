//
//  WebViewController.m
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 22/3/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize webView;
@synthesize url;


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
    [self.view addSubview:webView];
   
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)dealloc {
    [webView release];
    self.url = nil;
    
    [super dealloc];
}


- (void) didHitView:(UIView *)view
{
    self.navigationController.navigationBarHidden = !self.navigationController.navigationBarHidden;
}



@end
