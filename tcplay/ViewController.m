//
//  ViewController.m
//  tcplay
//
//  Created by Tiago Barufi on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import "Classes/SBJson.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize show;
NSMutableData *responseData;
- (void)viewDidLoad
{
    [super viewDidLoad];
    show.text=@"peganingas";
    [show setText:@"Hello, World!"];

	// Do any additional setup after loading the view, typically from a nib.
    NSString *jsonString = [NSString stringWithString:@"{\"foo\": \"bar\"}"];
	NSDictionary *dictionary = [jsonString JSONValue];
	NSLog(@"Dictionary value for \"foo\" is \"%@\"", [dictionary objectForKey:@"foo"]);
    [self pull];
}

- (void)pull{
    responseData = [NSMutableData data];
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.105/works/tcplay/backend/juke.php"]];
	[[NSURLConnection alloc] initWithRequest:request delegate:self];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	show.text = [NSString stringWithFormat:@"Connection failed: %@", [error description]];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
	NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	NSArray *luckyNumbers = [responseString JSONValue];
    
	NSMutableString *text = [NSMutableString stringWithString:@"Lucky numbers:\n"];
    
	for (int i = 0; i < [luckyNumbers count]; i++)
		[text appendFormat:@"%@\n", [luckyNumbers objectAtIndex:i]];
    
	show.text =  text;
}

- (IBAction) pinga{
    show.text=@"Hello, World!";
}
@end
