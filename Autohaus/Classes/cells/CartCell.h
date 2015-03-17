//
//  CartCell.h
//  GingerDolls
//
//  Created by Angelo Lesano on 3/13/14.
//  Copyright (c) 2014 Juzmedia Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel      *title;
@property (strong, nonatomic) IBOutlet UILabel      *price;
@property (strong, nonatomic) IBOutlet UILabel      *total;
@property (strong, nonatomic) IBOutlet UIImageView  *image;
@property (strong, nonatomic) IBOutlet UILabel      *qty;

@end
