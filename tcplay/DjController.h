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
    IBOutlet UIButton *__weak okay;
    IBOutlet UIActivityIndicatorView *__weak indy;
}
@property (nonatomic, weak) Musica *song;
@property (nonatomic, weak) NSString *nome;
@property (nonatomic, weak) NSString *depto;

@end
