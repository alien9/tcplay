//
//  DjController.h
//  tcplay
//
//  Created by Tiago Barufi on 14/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Musica.h"

@interface DjController : UIViewController{
    IBOutlet UILabel *__weak palavras;
}
@property (nonatomic, assign) Musica *song;

@end
