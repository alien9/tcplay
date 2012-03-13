//
//  ViewController.h
//  tcplay
//
//  Created by Tiago Barufi on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *show;
    NSMutableData *responseData;
}
@property (nonatomic, retain) UILabel *show;

- (IBAction)pinga;

@end
