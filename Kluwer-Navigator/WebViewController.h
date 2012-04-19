//
//  WebViewController.h
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 22/3/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HitTestView.h"

@interface WebViewController : UIViewController <UIGestureRecognizerDelegate, HitTestViewDelegate, UIWebViewDelegate>

@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (retain, nonatomic) NSString *url; 
@property (retain, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
