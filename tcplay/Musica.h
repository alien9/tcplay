//
//  Musica.h
//  tcplay
//
//  Created by Tiago Barufi on 13/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Musica : NSObject
@property (nonatomic, copy) NSString *titulo;
@property (nonatomic, copy) NSString *performer;
@property (nonatomic, assign) int rating;
@property (nonatomic, assign) int id;
@end
