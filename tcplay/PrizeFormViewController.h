//
//  PrizeFormViewController.h
//  tcplay
//
//  Created by Tiago Barufi on 14/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Musica.h"

@interface PrizeFormViewController : UIViewController{
    IBOutlet UITextField *__weak nome;
    IBOutlet UITextField *__weak depto;
}

@property (nonatomic, weak) Musica *song;

@end
