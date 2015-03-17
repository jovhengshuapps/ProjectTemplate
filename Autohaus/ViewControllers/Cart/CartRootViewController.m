//
//  CartRootViewController.m
//  GingerDolls
//
//  Created by Angelo Lesano on 4/20/14.
//  Copyright (c) 2014 JuzMedia Labs. All rights reserved.
//

#import "CartRootViewController.h"
#import "CartCell.h"
#import "CartInterface.h"
#import "Utilities.h"
#import "Constants.h"

@interface CartRootViewController (){
    NSMutableArray  *datasource;
    NSInteger       totalCheckoutItems;
    double          totalCheckoutPrice;
}
@property (strong, nonatomic) CartInterface *cart;
@property (strong, nonatomic) IBOutlet UITableView  *tableView;
@property (strong, nonatomic) IBOutlet UILabel      *labelCheckout;
@property (strong, nonatomic) IBOutlet UILabel      *labelTotalCheckout;
@property (strong, nonatomic) IBOutlet UISearchBar  *searchbar;
@property (strong, nonatomic) IBOutlet UIView       *cartRelatedViews;

- (IBAction)buttonCheckoutTapped:(id)sender;
@end

@implementation CartRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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
    [self initAppTheme];
    
    self.cart = [CartInterface new];
    
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
    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:kAppBackground];
//    self.tableView.backgroundView = imageView;
    
    self.labelCheckout.font             = kFONT_CentGothic(16);
    self.labelTotalCheckout.font        = kFONT_CentGothicBold(18);
    self.labelCheckout.textColor        = kSWATCH_Brown;
    self.labelTotalCheckout.textColor   = kSWATCH_Brown;
}

- (void)updateDatasource{
    datasource = [NSMutableArray arrayWithArray:[self.cart getFrom:kEntityName sortBy:nil]];
    NSLog(@"datasource:%@", datasource);
    totalCheckoutItems = 0;
    totalCheckoutPrice = 0.00;
    for (int x = 0; x < [datasource count]; x++) {
        totalCheckoutItems = totalCheckoutItems + [[[datasource objectAtIndex:x] valueForKey:key_quantity] integerValue];
        totalCheckoutPrice = totalCheckoutPrice + ([[[datasource objectAtIndex:x] valueForKey:@"price"] doubleValue] * totalCheckoutItems);
    }
    self.labelCheckout.text = [NSString stringWithFormat:@"Total Items: %ld", (long)totalCheckoutItems];
    self.labelTotalCheckout.text = [NSString stringWithFormat:@"Total: $ %.2f", totalCheckoutPrice];
    [self.tableView reloadData];
}

#pragma mark IBActions
- (IBAction)buttonCheckoutTapped:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:kAppName
                                                   message:@"Checkout successful"
                                                  delegate:nil
                                         cancelButtonTitle:@"Okay"
                                         otherButtonTitles:nil, nil];
    [alert show];
}
#pragma mark - Delegate Methods
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [datasource count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 125.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CartCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Utilities *convert = [Utilities new];
    
//    NSLog(@"image:%@", [convert dataToImage:[[datasource objectAtIndex:indexPath.row] valueForKey:@"image"]]);
    
    cell.title.text = [[datasource objectAtIndex:indexPath.row] valueForKey:@"name"];
    cell.image.image= [convert dataToImage:[[datasource objectAtIndex:indexPath.row] valueForKey:@"image"]];
    cell.qty.text   = [NSString stringWithFormat:@"Quantity: %ld",(long)[[datasource[indexPath.row] valueForKey:key_quantity] integerValue]];
    cell.price.text = [NSString stringWithFormat:@"$ %.2f",[[datasource[indexPath.row] valueForKey:@"price"] doubleValue]];
    cell.total.text = [NSString stringWithFormat:@"Total: %.2f",([[datasource[indexPath.row] valueForKey:@"price"] doubleValue] * [[datasource[indexPath.row] valueForKey:key_quantity] doubleValue] )];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.cart deleteFrom:kEntityName tableViewIndex:indexPath.row];
        
        [datasource removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [self updateDatasource];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


@end
