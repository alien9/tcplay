//
//  ViewController.m
//  tcplay
//
//  Created by Tiago Barufi on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <UIKit/UIKit.h>
#import "Classes/SBJson.h"
#import "Musica.h"
#import "MusicaViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize show;
NSMutableData *responseData;
- (void)viewDidLoad
{
    NSString *url = [[NSBundle mainBundle]
                     pathForResource:@"tcplay"
                     ofType:@"mp4"];
    MPMoviePlayerViewController *playerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:url]];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(movieFinishedCallback:)
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:[playerViewController moviePlayer]];
    
    [self.view addSubview:playerViewController.view];
    
    //---play movie---
    MPMoviePlayerController *player = [playerViewController moviePlayer];
    
    player.view.frame = CGRectMake(184, 200, 400, 300);
    [self.view addSubview:player.view];
    
    player.useApplicationAudioSession=NO;
    [player play];
    
    [super viewDidLoad];
    show.text=@"peganingas";
    [show setText:@"Hello, World!"];

	// Do any additional setup after loading the view, typically from a nib.
    NSString *jsonString = [NSString stringWithString:@"{\"foo\": \"bar\"}"];
	NSDictionary *dictionary = [jsonString JSONValue];
	NSLog(@"Dictionary value for \"foo\" is \"%@\"", [dictionary objectForKey:@"foo"]);
    [self pull];
}

- (void) movieFinishedCallback:(NSNotification*) aNotification {
    MPMoviePlayerController *player = [aNotification object];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    [player stop];
//    [self.view removeFromSuperView];
 //   [player autorelease];    
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
	NSArray *trax = [responseString JSONValue];
    
	NSMutableString *text = [NSMutableString stringWithString:@"Lucky numbers:\n"];
    NSMutableArray *ro = [[NSMutableArray alloc] init ];
    for (int i = 0; i < [trax count]; i++){
		[text appendFormat:@"%@\n", [trax objectAtIndex:i]];
        Musica *s=[[Musica alloc]init];
        s.titulo=[[trax objectAtIndex:i] objectForKey: @"title"];
        s.performer=[[trax objectAtIndex:i] objectForKey: @"artist"];
        s.id=(int)[[trax objectAtIndex:i] objectForKey: @"id"];
        [ro addObject: s];
    }
    rows = [ro sortedArrayUsingComparator:^(id a, id b) {
        NSString *first = [(Musica*)a performer];
        NSString *second = [(Musica*)b performer];
        return [first compare:second];
    }];
	show.text =  text;
}

- (IBAction) pinga{
    show.text=@"Hello, World!";
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return[rows count];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowTable"]) {
        MusicaViewController *ibcVC = [segue destinationViewController];
        ibcVC.songs = rows;
    }
}
@end
