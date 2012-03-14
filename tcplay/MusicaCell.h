//
//  MusicaCell.h
//  tcplay
//
//  Created by Tiago Barufi on 13/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicaCell : UITableViewCell{
    IBOutlet UILabel *__weak title;
    IBOutlet UILabel *__weak subtitle;
}
@property (weak, nonatomic) UILabel *title;
@property (weak, nonatomic) UILabel *subtitle;
@end
