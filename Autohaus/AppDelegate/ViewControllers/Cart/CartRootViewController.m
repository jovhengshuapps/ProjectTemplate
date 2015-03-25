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
#import "BaseConfig.h"

@interface CartRootViewController (){
    NSMutableArray  *datasource;
    NSInteger       totalCheckoutItems;
    double          totalCheckoutPrice;
}
@property (strong, nonatomic) CartInterface *cart;
@property (strong, nonatomic) IBOutlet UITableView  *tableView;
@property (strong, nonatomic) IBOutlet UILabel      *labelCheckout;
@property (strong, nonatomic) IBOutlet UILabel      *labelTotalCheckout;
@property (strong, nonatomic) IBOutlet UIView       *viewAction;
@property (strong, nonatomic) IBOutlet UIButton     *buttonCheckout;
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
    
    self.labelCheckout.font             = CART_ACTION_QTY_FONT;
    self.labelTotalCheckout.font        = CART_ACTION_PRICE_FONT;
    self.labelCheckout.textColor        = CART_ACTION_QTY_COLOR;
    self.labelTotalCheckout.textColor   = CART_ACTION_PRICE_COLOR;
    self.viewAction.backgroundColor = CART_ACTION_VIEW_COLOR;
    [self.buttonCheckout setTitleColor:CART_ACTION_CHECKOUT_TEXTCOLOR forState:UIControlStateNormal];
    [self.buttonCheckout setBackgroundColor:CART_ACTION_CHECKOUT_BTNCOLOR];
    self.buttonCheckout.titleLabel.font = CART_ACTION_CHECKOUT_TEXTFONT;
}

- (void)updateDatasource{
    datasource = [NSMutableArray arrayWithArray:[self.cart getFrom:kEntityName sortBy:nil]];
    NSLog(@"datasource:%@", datasource);
    totalCheckoutItems = 0;
    totalCheckoutPrice = 0.00;
    self.tableView.backgroundView = nil;
    for (int x = 0; x < [datasource count]; x++) {
        totalCheckoutItems = totalCheckoutItems + [[[datasource objectAtIndex:x] valueForKey:key_quantity] integerValue];
        totalCheckoutPrice = totalCheckoutPrice + ([[[datasource objectAtIndex:x] valueForKey:@"price"] doubleValue] * totalCheckoutItems);
    }
    self.labelCheckout.text = [NSString stringWithFormat:@"Total Items: %ld", (long)totalCheckoutItems];
    self.labelTotalCheckout.text = [NSString stringWithFormat:@"Total: $ %.2f", totalCheckoutPrice];
    
    if ([datasource count]==0) {
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:self.tableView.frame];
        backgroundView.backgroundColor = [UIColor clearColor];
        
        UILabel *labelNoResult = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.viewAction.bounds.size.width, 40.0f)];
        labelNoResult.backgroundColor = [UIColor clearColor];
        labelNoResult.text = @"No Items Found on Cart";
        labelNoResult.textAlignment = NSTextAlignmentCenter;
        
        [backgroundView addSubview:labelNoResult];
        
        self.tableView.backgroundView = backgroundView;
    }
    
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
    return 64.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Utilities *convert = [Utilities new];
    
//    NSLog(@"image:%@", [convert dataToImage:[[datasource objectAtIndex:indexPath.row] valueForKey:@"image"]]);
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    UIImage *imageProduct = [convert dataToImage:[[datasource objectAtIndex:indexPath.row] valueForKey:@"image"]];
    cell.imageView.image = (imageProduct)?imageProduct:[UIImage imageNamed:@"login_logo_iPhone"];
    cell.imageView.layer.borderColor = CART_ITEM_IMAGE_BORDERCOLOR.CGColor;
    cell.imageView.layer.borderWidth = 2.0f;
    cell.textLabel.text = [[datasource objectAtIndex:indexPath.row] valueForKey:@"name"];
    cell.textLabel.font = CART_ITEM_NAME_FONT;
    cell.textLabel.textColor = CART_ITEM_NAME_COLOR;
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"x%@ %@",[[datasource objectAtIndex:indexPath.row] valueForKey:@"qty"], [numberFormatter stringFromNumber:[[datasource objectAtIndex:indexPath.row] valueForKey:@"price"]]];
    cell.detailTextLabel.font = CART_ITEM_AMOUNT_FONT;
    cell.detailTextLabel.textColor = CART_ITEM_AMOUNT_COLOR;
    
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
