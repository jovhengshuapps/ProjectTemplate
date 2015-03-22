//
//  PurchaseHistoryCell.h
//  Autohaus
//
//  Created by Joshua Jose Pecson on 3/16/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PurchaseHistoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelPriceItems;

@end
