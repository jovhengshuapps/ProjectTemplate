//
//  InquiryViewController.m
//  Autohaus
//
//  Created by Joshua Jose Pecson on 3/21/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "InquiryViewController.h"

@interface InquiryViewController ()
@property (strong, nonatomic) NSString *message;
@end

@implementation InquiryViewController

#pragma mark - View Life Cycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationItem.hidesBackButton = YES;
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(cancelPressed:)];
    
    UIBarButtonItem *send = [[UIBarButtonItem alloc] initWithTitle:@"Send"
                                                            style:UIBarButtonItemStylePlain
                                                           target:self
                                                           action:@selector(sendPressed:)];
    
    self.navigationItem.leftBarButtonItem   = cancel;
    self.navigationItem.rightBarButtonItem  = send;
    self.title = @"Inquiry";
    self.background.image = self.backgroundImage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initAppTheme];
    self.navigationItem.hidesBackButton = YES;
    self.dictionaryDetails = [[NSMutableDictionary alloc] init];
    [self.dictionaryDetails setObject:@"" forKey:@"Name"];
    [self.dictionaryDetails setObject:@"" forKey:@"Email"];
    [self.dictionaryDetails setObject:@"" forKey:@"Phone"];
    [self.dictionaryDetails setObject:@"" forKey:@"Message"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Methods
- (void)initAppTheme{
    //    self.background.image = kAppBackground;
    
//    UIImageView *navBarTitle = [[UIImageView alloc] initWithImage:kAppLogo_Nav];
//    [self.navigationItem setTitleView:navBarTitle];
    
    
}

- (IBAction)cancelPressed:(id)sender {
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sendPressed:(id)sender {
    
}

#pragma mark UITableView Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 4;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"SEND INQUIRY";
    }
    return @"YOUR DETAILS";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellIdentifier"];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"Date";
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MMMM dd YYYY"];
        
        cell.detailTextLabel.text = [dateFormatter stringFromDate:[NSDate date]];
    }
    else {
        cell.detailTextLabel.hidden = NO;
        switch (indexPath.row) {
            case 0: {
                cell.textLabel.text = @"Name";
                cell.detailTextLabel.text = [self.dictionaryDetails objectForKey:@"Name"];
            }
                break;
            case 1: {
                cell.textLabel.text = @"Email";
                cell.detailTextLabel.text = [self.dictionaryDetails objectForKey:@"Email"];
            }
                break;
            case 2: {
                cell.textLabel.text = @"Phone";
                cell.detailTextLabel.text = [self.dictionaryDetails objectForKey:@"Phone"];
            }
                break;
            case 3: {
                cell.textLabel.text = @"Message";
                cell.detailTextLabel.text = [self.dictionaryDetails objectForKey:@"Message"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
                break;
            default:
                break;
        }
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 3: {
            }
                break;
            default: {
                cell.detailTextLabel.hidden = YES;
                UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(cell.contentView.frame.size.width - 250.0f, 8.0f, 220.0f, 30.0f)];
                textField.borderStyle = UITextBorderStyleNone;
                textField.delegate = self;
                textField.text = cell.detailTextLabel.text;
                [cell.contentView addSubview:textField];
                [textField becomeFirstResponder];
                cell.detailTextLabel.text = @"";
            }
                break;
        }
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    UITableViewCell *cell = (UITableViewCell*)[[textField superview] superview];
    NSIndexPath *indexPath = [self.tableViewMain indexPathForCell:cell];
    switch (indexPath.row) {
        case 0: {
            [self.dictionaryDetails setObject:textField.text forKey:@"Name"];
        }
            break;
        case 1: {
            [self.dictionaryDetails setObject:textField.text forKey:@"Email"];
        }
            break;
        case 2: {
            [self.dictionaryDetails setObject:textField.text forKey:@"Phone"];
        }
            break;
            break;
        default:
            break;
    }
    [textField removeFromSuperview];
    [self.tableViewMain reloadData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
@end
