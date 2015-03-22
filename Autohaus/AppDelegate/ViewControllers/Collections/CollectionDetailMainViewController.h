//
//  CollectionDetailMainViewController.h
//  GingerDolls
//
//  Created by Angelo Lesano on 8/13/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface CollectionDetailMainViewController : UIViewController <UIScrollViewDelegate, MFMailComposeViewControllerDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSDictionary *selected;
@end