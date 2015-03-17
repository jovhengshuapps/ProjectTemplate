//
//  CollectionCellImage.m
//  GingerDolls
//
//  Created by IOS Developer on 3/2/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "CollectionCellImage.h"

@implementation CollectionCellImage
@synthesize productImageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic_frame.png"]];
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
