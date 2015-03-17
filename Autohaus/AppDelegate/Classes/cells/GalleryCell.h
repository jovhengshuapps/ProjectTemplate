//
//  GalleryCell.h
//  GingerDolls
//
//  Created by Angelo Lesano on 5/29/14.
//  Copyright (c) 2014 JuzMedia Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton     *imageA;
@property (strong, nonatomic) IBOutlet UIButton     *imageB;

@property (strong, nonatomic) IBOutlet UILabel      *titleA;
@property (strong, nonatomic) IBOutlet UILabel      *titleB;

@property (strong, nonatomic) IBOutlet UILabel      *priceA;
@property (strong, nonatomic) IBOutlet UILabel      *priceB;

@end
