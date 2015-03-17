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
    self.textViewMessage.font = TESTIMONIAL_MSG_FONT;
    self.textViewMessage.textColor = TESTIMONIAL_MSG_COLOR;
    self.viewTestimonialBox.backgroundColor = TESTIMONIAL_BOX_COLOR;
    self.textViewMessage.textAlignment = NSTextAlignmentCenter;
    
    
}
-(void)updateConstraints{
//    CGRect frame = self.textViewMessage.frame;
//    frame.size.height = [self textViewHeight:self.textViewMessage];
//    self.textViewMessage.frame = frame;
    [super updateConstraints];
}

-(CGFloat)textViewHeight:(UITextView *)textView {
    [textView.layoutManager ensureLayoutForTextContainer:textView.textContainer];
    CGRect usedRect = [textView.layoutManager usedRectForTextContainer:textView.textContainer];
    return ceilf(usedRect.size.height + textView.textContainerInset.top
                 +textView.textContainerInset.bottom);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
