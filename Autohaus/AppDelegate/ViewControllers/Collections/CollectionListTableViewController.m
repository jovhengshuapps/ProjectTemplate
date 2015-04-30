//
//  CollectionListTableViewController.m
//  GingerDolls
//
//  Created by Angelo Lesano on 8/12/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import "CollectionListTableViewController.h"
#import "CollectionDetailMainViewController.h"
#import "GalleryCell.h"
#import "BaseConfig.h"
#import "Utilities.h"

#define kSegue_Detail   @"pushDetail"

@interface CollectionListTableViewController (){
    NSArray     *datasource;
    NSInteger   objectTag;
}

@end

@implementation CollectionListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initAppTheme];
    
    datasource = self.selected;
//    NSLog(@"data:%@",datasource);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Methods
- (void)initAppTheme{
    
}

- (void)buttonPressed:(UIButton*)sender{
    objectTag = sender.tag;
    [self performSegueWithIdentifier:kSegue_Detail sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:kSegue_Detail]) {
        CollectionDetailMainViewController *detail = segue.destinationViewController;
        detail.selected = datasource[objectTag];
//        detail.image = ((UIButton*)sender).imageView.image;
    }
}
#pragma mark - Delegate Methods
#pragma mark UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ceil([datasource count]/2.0);;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GalleryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"galleryCell" forIndexPath:indexPath];
    
    for (int y = 0; y < 2; y++) {
        
        NSInteger index= indexPath.row + (indexPath.row + y);
        
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        
        if (y == 0) {
            
            UIImage *imageProduct = [UIImage imageNamed:@"login_logo_iPhone"];
            
            NSURL *imageURL = [NSURL URLWithString:[datasource[index] valueForKey:@"image"]];
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                if (imageData) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // Update the UI
                        [cell.imageA setImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
                        [cell setNeedsLayout];
                    });
                }
                else {
                    [cell.imageA setImage:imageProduct forState:UIControlStateNormal];
                    [cell setNeedsLayout];
                }
            });
            
            
            [cell.imageA.imageView setContentMode:UIViewContentModeScaleAspectFill];
            
            [cell.imageA addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [cell.imageA setTag:index];
            cell.imageA.layer.borderColor = SHOP_ITEM_IMAGE_BORDERCOLOR.CGColor;
            cell.imageA.layer.borderWidth = SHOP_ITEM_IMAGE_BORDERWIDTH;
            
            [cell.titleA setText:[datasource[index] valueForKey:@"name"]];
            [cell.priceA setText:kToPrice([datasource[index] valueForKey:@"price"])];
            
            cell.titleA.font = SHOP_ITEM_NAME_FONT;
            cell.titleA.textColor = SHOP_ITEM_NAME_COLOR;
            cell.priceA.font = SHOP_ITEM_PRICE_FONT;
            cell.priceA.textColor = SHOP_ITEM_PRICE_COLOR;
            
        }else{
            if (indexPath.row + (indexPath.row + y) < [datasource count]){
                [cell.imageB setHidden:NO];
                
                UIImage *imageProduct = [UIImage imageNamed:@"login_logo_iPhone"];
                
                NSURL *imageURL = [NSURL URLWithString:[datasource[index] valueForKey:@"image"]];
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                    if (imageData) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // Update the UI
                            [cell.imageB setImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
                            [cell setNeedsLayout];
                        });
                    }
                    else {
                        [cell.imageB setImage:imageProduct forState:UIControlStateNormal];
                        [cell setNeedsLayout];
                    }
                });
                
                
                [cell.imageB.imageView setContentMode:UIViewContentModeScaleAspectFill];
                
                [cell.imageB addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
                [cell.imageB setTag:index];
                cell.imageB.layer.borderColor = SHOP_ITEM_IMAGE_BORDERCOLOR.CGColor;
                cell.imageB.layer.borderWidth = SHOP_ITEM_IMAGE_BORDERWIDTH;
                
                [cell.titleB setText:[datasource[index] valueForKey:@"name"]];
                [cell.priceB setText:kToPrice([datasource[index] valueForKey:@"price"])];
                cell.titleB.font = SHOP_ITEM_NAME_FONT;
                cell.titleB.textColor = SHOP_ITEM_NAME_COLOR;
                cell.priceB.font = SHOP_ITEM_PRICE_FONT;
                cell.priceB.textColor = SHOP_ITEM_PRICE_COLOR;
                
                
            }else{
                [cell.imageB setHidden:YES];
                [cell.imageB setImage:nil forState:UIControlStateNormal];
                [cell.titleB setText:@""];
                [cell.priceB setText:@""];
            }
        }
    }
    return cell;
}

@end
