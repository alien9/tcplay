//
//  Splash.m
//  tcplay
//
//  Created by Tiago Barufi on 14/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Splash.h"
#import <MediaPlayer/MediaPlayer.h>

@interface Splash ()

@end

@implementation Splash
MPMoviePlayerController *videoPlayer;

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
	// Do any additional setup after loading the view.
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
- (void) movieFinishedCallback:(NSNotification*) aNotification {
    MPMoviePlayerController *player = [aNotification object];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    [player stop];
    [self performSegueWithIdentifier: @"papa" sender: self];
}
-(void)viewWillAppear:(BOOL)animated
{
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"tcplay.mp4" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:urlStr];
    videoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(movieFinishedCallback:)                                                 
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:videoPlayer];
    videoPlayer.controlStyle = MPMovieControlStyleNone;
    [self.view addSubview:videoPlayer.view];
    videoPlayer.view.frame = CGRectMake(0, 200,768, 500);  
    [videoPlayer play];
}
@end
