//
//  GalleryCell.m
//  GingerDolls
//
//  Created by Angelo Lesano on 5/29/14.
//  Copyright (c) 2014 JuzMedia Labs. All rights reserved.
//

#import "GalleryCell.h"
#import "BaseConfig.h"

@implementation GalleryCell

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
    self.titleA.font = kFONT_CentGothic(16);
    self.titleB.font = kFONT_CentGothic(16);
    self.priceA.font = kFONT_CentGothic(16);
    self.priceB.font = kFONT_CentGothic(16);
    
//    self.titleA.textColor = kSWATCH_Title;
//    self.titleB.textColor = kSWATCH_Title;
//    self.priceA.textColor = kSWATCH_Price;
//    self.priceB.textColor = kSWATCH_Price;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
