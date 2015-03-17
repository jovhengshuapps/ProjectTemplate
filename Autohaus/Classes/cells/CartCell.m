//
//  CartCell.m
//  GingerDolls
//
//  Created by Angelo Lesano on 3/13/14.
//  Copyright (c) 2014 Juzmedia Labs. All rights reserved.
//

#import "CartCell.h"
#import "Constants.h"

@implementation CartCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    self.title.font = kFONT_CentGothicBold(20);
    self.price.font = kFONT_CentGothic(15);
    self.qty.font   = kFONT_CentGothic(15);
    self.total.font = kFONT_CentGothicBold(20);
    self.image.contentMode = UIViewContentModeScaleAspectFill;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
