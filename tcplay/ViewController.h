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
@interface ViewController : UIViewController
{
    IBOutlet UILabel *show;
    NSMutableData *responseData;
    NSArray *rows;
}
@property (nonatomic) UILabel *show;

- (IBAction)pinga;

@end
