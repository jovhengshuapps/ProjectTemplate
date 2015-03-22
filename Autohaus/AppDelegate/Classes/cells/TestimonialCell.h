//
//  TestimonialCell.h
//  Autohaus
//
//  Created by Joshua Jose Pecson on 3/15/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface TestimonialCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *viewTestimonialBox;
@property (weak, nonatomic) IBOutlet UILabel *labelMessage;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@end
