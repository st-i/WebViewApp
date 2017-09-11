//
//  ViewController.h
//  WebViewApp
//
//  Created by iStef on 06.08.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSURLRequest *currentRequest;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *goBackButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goForwardButton;

- (IBAction)goBackAction:(UIBarButtonItem *)sender;
- (IBAction)goForwardAction:(UIBarButtonItem *)sender;
- (IBAction)refreshAction:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;


@end

