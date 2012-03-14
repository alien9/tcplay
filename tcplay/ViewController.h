//
//  ViewController.h
//  tcplay
//
//  Created by Tiago Barufi on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Musica.h"
#import "MusicaViewController.h"
@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UILabel *__weak show;
    IBOutlet UITableView *__weak tw;
    NSMutableData *responseData;
    NSArray *rows;
    NSArray *generos;
}
@property (weak, nonatomic) UITableView *tw;
@property(nonatomic, retain) NSArray *generos;

- (IBAction)pinga;

@end
