//
//  CollectionDetailMainViewController.h
//  GingerDolls
//
//  Created by Angelo Lesano on 8/13/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "TableCellCollection.h"
@interface CollectionDetailMainViewController : UIViewController <UIScrollViewDelegate, MFMailComposeViewControllerDelegate, UITableViewDataSource, TableCellCollectionDelegate>
@property (strong, nonatomic) NSDictionary *selected;
@end