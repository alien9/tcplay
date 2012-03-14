//
//  MusicaCell.m
//  tcplay
//
//  Created by Tiago Barufi on 13/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MusicaCell.h"

@implementation MusicaCell
@synthesize title;
@synthesize subtitle;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
