//
//  InquiryViewController.h
//  Autohaus
//
//  Created by Joshua Jose Pecson on 3/21/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseConfig.h"

@interface InquiryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) NSMutableDictionary *dictionaryDetails;
@property (strong, nonatomic) IBOutlet UITableView *tableViewMain;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) IBOutlet UIImageView  *background;
- (IBAction)cancelPressed:(id)sender;
- (IBAction)sendPressed:(id)sender;
@end
