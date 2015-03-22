//
//  TestimonialCell.m
//  Autohaus
//
//  Created by Joshua Jose Pecson on 3/15/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "TestimonialCell.h"

@implementation TestimonialCell

- (void)awakeFromNib {
    // Initialization code
    
    self.viewTestimonialBox.layer.cornerRadius = TESTIMONIAL_BOX_CORNER;
    self.labelName.font = TESTIMONIAL_NAME_FONT;
    self.labelName.textColor = TESTIMONIAL_NAME_COLOR;
    self.labelTitle.font = TESTIMONIAL_TITLE_FONT;
    self.labelTitle.textColor = TESTIMONIAL_TITLE_COLOR;
    self.labelMessage.font = TESTIMONIAL_MSG_FONT;
    self.labelMessage.textAlignment = NSTextAlignmentCenter;
    self.labelMessage.textColor = TESTIMONIAL_MSG_COLOR;
    self.labelMessage.numberOfLines = 0;
    self.labelMessage.lineBreakMode = NSLineBreakByWordWrapping;
    self.viewTestimonialBox.backgroundColor = TESTIMONIAL_BOX_COLOR;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
