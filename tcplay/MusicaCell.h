//
//  MusicaCell.h
//  tcplay
//
//  Created by Tiago Barufi on 13/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicaCell : UITableViewCell{
    IBOutlet UILabel *title;
    IBOutlet UILabel *subtitle;
}
@property (nonatomic) UILabel *title;
@property (nonatomic) UILabel *subtitle;
@end
