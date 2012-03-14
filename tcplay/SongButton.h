//
//  SongButton.h
//  tcplay
//
//  Created by Tiago Barufi on 14/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Musica.h"

@interface SongButton : UIButton
@property (nonatomic, copy) Musica *song;

@end
