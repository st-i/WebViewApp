//
//  ViewController.m
//  WebViewApp
//
//  Created by iStef on 06.08.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.webView = [[UIWebView alloc] init];
    
    //self.webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    //NSURL *rbcUrl = [NSURL URLWithString:self.currentString];
    //NSURLRequest *rbcRequest = [NSURLRequest requestWithURL:rbcUrl];
    
    [self.webView loadRequest:self.currentRequest];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goBackAction:(UIBarButtonItem *)sender
{
    if (self.webView.canGoBack) {
        [self.webView stopLoading];
        [self.webView goBack];
    }
}

- (IBAction)goForwardAction:(UIBarButtonItem *)sender
{
    if (self.webView.canGoForward) {
        [self.webView stopLoading];
        [self.webView goForward];
    }
}

- (IBAction)refreshAction:(UIBarButtonItem *)sender
{
    [self.webView stopLoading];
    [self.webView reload];
}

-(void)refreshButtons
{
    self.goBackButton.enabled = [self.webView canGoBack];
    self.goForwardButton.enabled = [self.webView canGoForward];
}


#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [self.loadingIndicator startAnimating];
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    //[self.loadingIndicator startAnimating];
    //[self.loadingIndicator stopAnimating];
    //[self.loadingIndicator setHidesWhenStopped:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.loadingIndicator stopAnimating];
    [self.loadingIndicator setHidesWhenStopped:YES];
    [self refreshButtons];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didFailLoadWithError: %@", error.localizedDescription);
    [self.loadingIndicator stopAnimating];
    [self.loadingIndicator setHidesWhenStopped:YES];
    [self refreshButtons];
}



@end
