//
//  MoreRootTableViewController.h
//  GingerDolls
//
//  Created by Angelo Lesano on 8/12/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface MoreRootTableViewController : UITableViewController <MFMailComposeViewControllerDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) NSArray *datasource;
@end
