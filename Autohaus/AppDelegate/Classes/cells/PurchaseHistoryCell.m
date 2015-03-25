//
//  PurchaseHistoryCell.m
//  Autohaus
//
//  Created by Joshua Jose Pecson on 3/16/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "PurchaseHistoryCell.h"
#import "BaseConfig.h"

@implementation PurchaseHistoryCell

- (void)awakeFromNib {
    // Initialization code
    
    self.labelTitle.font = kFONT_HelveticaNeueMedium(16.0f);
    self.labelDate.font = kFONT_HelveticaNeueLight(14.0f);
    self.labelPriceItems.font = kFONT_HelveticaNeueLight(14.0f);
//    self.labelTitle.textColor = kSWATCH_Gray63;
//    self.labelDate.textColor = kSWATCH_Gray63;
//    self.labelPriceItems.textColor = kSWATCH_Gray63;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
