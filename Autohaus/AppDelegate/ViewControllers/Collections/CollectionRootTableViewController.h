//
//  CollectionRootTableViewController.h
//  GingerDolls
//
//  Created by Angelo Lesano on 8/12/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionRootCell.h"
#import "CollectionListTableViewController.h"
#import "Constants.h"

@interface CollectionRootTableViewController : UITableViewController
@property (strong, nonatomic) NSMutableDictionary     *datasource;
@property (strong, nonatomic) NSMutableArray *arrayCollapsedSection;
- (void) getDataSource;
@end
