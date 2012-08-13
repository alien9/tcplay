//
//  PrizeFormViewController.m
//  tcplay
//
//  Created by Tiago Barufi on 14/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PrizeFormViewController.h"
#import "DjController.h"
@interface PrizeFormViewController ()

@end

@implementation PrizeFormViewController
@synthesize song;

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
-(void)viewDidAppear:(BOOL)animated{
    UIButton *okay=((UIButton *)[self.view viewWithTag:2]);
    UILabel *ln = ((UILabel *)[self.view viewWithTag:3]);
    UILabel *lo = ((UILabel *)[self.view viewWithTag:4]);
    UILabel *lm = ((UILabel *)[self.view viewWithTag:6]);
    UILabel *lk = ((UILabel *)[self.view viewWithTag:5]);
    if([song.prize isEqualToString:@"0"]){
        [self performSegueWithIdentifier: @"ultima" sender: self];
    }else{
        okay.hidden=NO;
        nome.hidden=NO;
        depto.hidden=NO;
        lo.hidden=NO;
        ln.hidden=NO;
        lm.hidden=NO;
        lk.hidden=NO;
    }
    [super viewDidAppear:animated];
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DjController *djC = [segue destinationViewController];
    djC.song = song;
    djC.nome = nome.text;
    djC.depto = depto.text;
    UIButton *okay=((UIButton *)[self.view viewWithTag:2]);
    UILabel *ln = ((UILabel *)[self.view viewWithTag:3]);
    UILabel *lo = ((UILabel *)[self.view viewWithTag:4]);
    UILabel *lm = ((UILabel *)[self.view viewWithTag:6]);
    UILabel *lk = ((UILabel *)[self.view viewWithTag:5]);
    okay.hidden=YES;
    nome.hidden=YES;
    depto.hidden=YES;
    lo.hidden=YES;
    ln.hidden=YES;
    lm.hidden=YES;
    lk.hidden=YES;
}
- (IBAction) submit:(id)sender{
    [self performSegueWithIdentifier: @"ultima" sender: self];
}
@end
