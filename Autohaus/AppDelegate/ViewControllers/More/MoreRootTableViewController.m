//
//  MoreRootTableViewController.m
//  GingerDolls
//
//  Created by Angelo Lesano on 8/12/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import "MoreRootTableViewController.h"
#import "BaseConfig.h"

@interface MoreRootTableViewController ()

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
        self.datasource = @[@{@"Account": @[@"Purchase History",
                                       @"Change Password",
                                       @"Shipping and Billing Info",
                                       @"Log Out"]
                         },
                       @{@"About": @[@"About Us",
                                        @"Contact Us",
                                     @"About the Developer"]
                         }];
    
    [self.tableView reloadData];
}
#pragma mark - Delegate Methods
#pragma mark UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.datasource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [self.datasource[section] allKeys][0];
    return [[self.datasource[section] valueForKey:key] count];
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.frame.size.width, 44.0f)];
    headerView.backgroundColor = MORE_SECTION_BAR_COLOR;
    
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 0.0f, headerView.frame.size.width - 20.0f, 44.0f)];
    labelTitle.backgroundColor = [UIColor clearColor];
    labelTitle.font = MORE_SECTION_FONT;
    labelTitle.textColor = MORE_SECTION_COLOR;
    labelTitle.text = [self.datasource[section] allKeys][0];
    [headerView addSubview:labelTitle];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 54.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"genericCell" forIndexPath:indexPath];
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    NSString *key = [self.datasource[section] allKeys][0];
    
    UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(15.0f, 5.0f, tableView.frame.size.width - 30.0f, 44.0f)];
    cellView.backgroundColor = MORE_CELL_BOX_COLOR;
    cellView.layer.cornerRadius = MORE_CELL_CORNER;
    cellView.tag = row;
    [cell.contentView addSubview:cellView];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 0.0f, cellView.frame.size.width - 15.0f, 44.0f)];
    
    textLabel.text = [[self.datasource[section] valueForKey:key] objectAtIndex:row];
    textLabel.textColor = MORE_CELL_COLOR;
    textLabel.font = MORE_CELL_FONT;
    
    [cellView addSubview:textLabel];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(simulateDidSelectRow:)];
    [cell addGestureRecognizer:tap];
    
    return cell;
}

- (void)simulateDidSelectRow:(UITapGestureRecognizer*)tap {
    UITableViewCell *cell = (UITableViewCell*)tap.view;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
                //Purchase history
                UIViewController *vc = kStoryboard(@"purchaseHistoryVC");
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1:
                //Change Password
                break;
            case 2:
                //Shipping and Billing Information
                break;
            case 3:{
                //Log out
                UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Log out" message:@"Are you sure?" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
                [av show];
            }
                break;
                
            default:
                break;
        }
    }
    else if(indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:{
                //About Us
                UIViewController *vc = kStoryboard(@"aboutVC");
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1:{
                //Contact Us
                UIViewController *vc = kStoryboard(@"contactUsView");
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:{
                //About the Developer
                UIViewController *vc = kStoryboard(@"aboutVC");
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
                
            default:
                break;
        }
    }
    
}


#pragma mark - UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if([alertView.title isEqualToString:@"Log out"]) {
        switch (buttonIndex) {
            case 0:
                NSLog(@"Log out");
                break;
                
            default:
                NSLog(@"Cancel");
                break;
        }
    }
}

@end
