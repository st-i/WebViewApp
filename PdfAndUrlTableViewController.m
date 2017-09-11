//
//  PdfAndUrlTableViewController.m
//  WebViewApp
//
//  Created by iStef on 06.08.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

#import "PdfAndUrlTableViewController.h"
#import "ViewController.h"

@interface PdfAndUrlTableViewController ()

@property (strong, nonatomic) NSArray *PDFFiles;
@property (strong, nonatomic) NSArray *PDFNames;

@property (strong, nonatomic) NSArray *URLs;
@property (strong, nonatomic) NSArray *URLNames;

@property (strong, nonatomic) NSArray *commonArray;
@property (strong, nonatomic) NSArray *commonNamesArray;

@end

@implementation PdfAndUrlTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath1 = [[NSBundle mainBundle] pathForResource:@"1.pdf" ofType:nil];
    NSURL *filePath1URL = [NSURL fileURLWithPath:filePath1];
    NSURLRequest *file1Request = [NSURLRequest requestWithURL:filePath1URL];
    
    NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"2.pdf" ofType:nil];
    NSURL *filePath2URL = [NSURL fileURLWithPath:filePath2];
    NSURLRequest *file2Request = [NSURLRequest requestWithURL:filePath2URL];
    
    NSString *filePath3 = [[NSBundle mainBundle] pathForResource:@"3.pdf" ofType:nil];
    NSURL *filePath3URL = [NSURL fileURLWithPath:filePath3];
    NSURLRequest *file3Request = [NSURLRequest requestWithURL:filePath3URL];
    
    self.PDFFiles = [NSArray arrayWithObjects:file1Request, file2Request, file3Request, nil];
    self.PDFNames = [NSArray arrayWithObjects:@"1.pdf", @"2.pdf", @"3.pdf", nil];
    
    
    NSURL *rbcUrl = [NSURL URLWithString:@"http://www.rbc.ru"];
    NSURLRequest *rbcRequest = [NSURLRequest requestWithURL:rbcUrl];
    
    NSURL *tvUrl = [NSURL URLWithString:@"https://tv.mail.ru/moskva/channel/2060/"];
    NSURLRequest *tvRequest = [NSURLRequest requestWithURL:tvUrl];
    
    NSURL *popoversUrl = [NSURL URLWithString:@"http://pinkstone.co.uk/how-to-create-popovers-in-ios-9/"];
    NSURLRequest *popoversRequest = [NSURLRequest requestWithURL:popoversUrl];
    
    self.URLs = [NSArray arrayWithObjects:rbcRequest, tvRequest, popoversRequest, nil];
    self.URLNames = [NSArray arrayWithObjects:@"РБК", @"МАТЧ ТВ. Телепрограмма", @"How to make popovers", nil];
    
    
    self.commonArray = [NSArray arrayWithObjects:self.PDFFiles, self.URLs, nil];
    self.commonNamesArray = [NSArray arrayWithObjects:self.PDFNames, self.URLNames, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source (UITableViewDataSource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.commonNamesArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *array = self.commonNamesArray[section];
    
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSArray *array = self.commonNamesArray[indexPath.section];
    NSString *name = array[indexPath.row];
    
    cell.textLabel.text = name;
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *array = self.commonArray[indexPath.section];
    NSURLRequest *request = array[indexPath.row];
    
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    vc.currentRequest = request;
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
