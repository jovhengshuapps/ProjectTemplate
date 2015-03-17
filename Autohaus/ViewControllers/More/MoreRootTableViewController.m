//
//  MoreRootTableViewController.m
//  GingerDolls
//
//  Created by Angelo Lesano on 8/12/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import "MoreRootTableViewController.h"
#import "Constants.h"

@interface MoreRootTableViewController (){
    NSArray     *datasource;
    NSInteger   objectTag;
}

@end

@implementation MoreRootTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View Life Cycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateDatasource];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *navBarTitle = [[UIImageView alloc] initWithImage:kAppLogo_Nav];
    [self.navigationItem setTitleView:navBarTitle];

    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Methods
- (void)initAppTheme{
    UIImageView *navBarTitle = [[UIImageView alloc] initWithImage:kAppLogo_Nav];
    [self.navigationItem setTitleView:navBarTitle];
    
//    UIImageView *background = [[UIImageView alloc] initWithImage:kAppBackground];
//    [background setFrame:self.tableView.frame];
//    self.tableView.backgroundView = background;
}

- (void)updateDatasource{
    if (YES) {
        datasource = @[@{@"Actions": @[@"Call",
                                       @"Email"
                                       ]
                         },
                       ];
        
//        datasource = @[@{@"Account": @[@"Transactions",
//                                       @"Change Password",
//                                       @"Reset Password",
//                                       @"Shipping and Billing Info",
//                                       @"Log Out"
//                                       ]
//                         },
//                       @{@"About Us": @[@"FAQs",
//                                        @"Terms and Conditions",
//                                        @"Contact Us"
//                                        ]
//                         }];
    }else{
        datasource = @[@{@"Account": @[@"Transactions",
                                       @"Change Password",
                                       @"Reset Password",
                                       @"Shipping and Billing Info",
                                       @"Log In"]
                         },
                       @{@"About Us": @[@"FAQs",
                                        @"Terms and Conditions",
                                        @"Contact Us"]
                         }];
    }
    [self.tableView reloadData];
}
#pragma mark - Delegate Methods
#pragma mark UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [datasource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (section == 0)   return [[datasource[section] valueForKey:@"Account"] count];
//    else                return [[datasource[section] valueForKey:@"About Us"] count];
    return [[datasource[section] valueForKey:@"Actions"] count];
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    /* Colors to be used */
    UIColor *sectionBGColor     = kSWATCH_CellSection;
    UIColor *sectionTitleColor  = kSWATCH_Pink;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 70)];
    [headerView setBackgroundColor: sectionBGColor];
    UILabel *sectionTitle = [[UILabel alloc]init];
    sectionTitle.text = [NSString stringWithFormat:@"%@",[[datasource [section] allKeys]lastObject]];
    sectionTitle.textColor = sectionTitleColor;
    [sectionTitle setFrame:CGRectMake(20, 0, tableView.bounds.size.width, 25)];
    
    [headerView addSubview:sectionTitle];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"genericCell" forIndexPath:indexPath];
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
//    if (section == 0) {
//        cell.textLabel.text = [[datasource[section] valueForKey:@"Account"] objectAtIndex:row];
//    }else{
//        cell.textLabel.text = [[datasource[section] valueForKey:@"About Us"] objectAtIndex:row];
//    }
    
    cell.textLabel.text = [[datasource[section] valueForKey:@"Actions"] objectAtIndex:row];
    
    cell.textLabel.font = kFONT_CentGothic(17);
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    objectTag = indexPath.row;
    if (indexPath.row == 0) {
        NSString *message = [NSString stringWithFormat:@"Would you like to call %@?",kAppName];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:kAppName
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:@"Yes"
                                             otherButtonTitles:@"No", nil];
        
        [alert show];
    }else{
        MFMailComposeViewController *mailer = [MFMailComposeViewController new];
        [mailer setMailComposeDelegate:self];
        [mailer setSubject:@""];
        [mailer setToRecipients:kAppEmail];
        [self presentViewController:mailer animated:YES completion:^{
            [self.tabBarController.tabBar setTranslucent:NO];
        }];
    }
    
}

#pragma mark - MFMailComposeViewController Delegate
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [controller dismissViewControllerAnimated:YES completion:^{
        [self.tabBarController.tabBar setTranslucent:YES];
    }];
}

#pragma mark - UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView.title isEqualToString:kAppName]) {
        if (buttonIndex == 0) {
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:kAppTelNumber]]) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:kAppTelNumber]];
            }else{
                NSString *errMessage = @"This device is incapable of placing a call.";
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"FAIL"
                                                                message:errMessage
                                                               delegate:Nil
                                                      cancelButtonTitle:@"Okay"
                                                      otherButtonTitles:nil, nil];
                [alert show];
            }
        }
    }
}

@end
