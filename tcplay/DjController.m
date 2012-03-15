//
//  DjController.m
//  tcplay
//
//  Created by Tiago Barufi on 14/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DjController.h"
#import "Classes/SBJson.h"

@interface DjController ()

@end

@implementation DjController
@synthesize song;
@synthesize nome;
@synthesize depto;
NSMutableData *responseData;
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

    NSLog(song.titulo);
    //palavras.text=[NSString stringWithFormat:@"ENVIEI %@", song.titulo];
	// Do any additional setup after loading the view.
    [super viewDidLoad];
    [self pull];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)pulla{
    responseData = [NSMutableData data];
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.105/works/tcplay/backend/juke.php"]];
 
	[[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)pull{
    responseData = [NSMutableData data];
    NSLog(@"posting");
    NSString *post = [NSString stringWithFormat:@"id=%@&nome=%@&depto=%@", song.id, nome, depto];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];

    //NSLog(post);
//	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.105/works/tcplay/backend/play.php"]];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    //NSLog(postLength);

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://192.168.0.105/works/tcplay/backend/play.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    //NSLog(@"en viado");

	[[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	palavras.text = [NSString stringWithFormat:@"Connection failed: %@", [error description]];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"voltou");
	NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
	//NSArray *trax = [responseString JSONValue];
    //palavras.text=responseString;
    palavras.hidden=NO;
    okay.hidden=NO;
    [indy stopAnimating];
}

@end
