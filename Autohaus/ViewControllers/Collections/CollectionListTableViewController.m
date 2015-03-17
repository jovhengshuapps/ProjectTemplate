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
#import "Constants.h"

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
    [self performSegueWithIdentifier:kSegue_Detail sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:kSegue_Detail]) {
        CollectionDetailMainViewController *detail = segue.destinationViewController;
        detail.selected = datasource[objectTag];
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
        
        if (y == 0) {
            [cell.imageA setImage:[UIImage imageNamed:[datasource[index] valueForKey:@"images"][0]] forState:UIControlStateNormal];
            
            [cell.imageA.imageView setContentMode:UIViewContentModeScaleAspectFill];
            
            [cell.imageA addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [cell.imageA setTag:index];
            
            [cell.titleA setText:[datasource[index] valueForKey:@"name"]];
            [cell.priceA setText:kToPrice([datasource[index] valueForKey:@"price"])];
            
        }else{
            if (indexPath.row + (indexPath.row + y) < [datasource count]){
                [cell.imageB setHidden:NO];
                
                [cell.imageB setImage:[UIImage imageNamed:[datasource[index] valueForKey:@"images"][0]] forState:UIControlStateNormal];
                
                [cell.imageB.imageView setContentMode:UIViewContentModeScaleAspectFill];
                
                [cell.imageB addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
                [cell.imageB setTag:index];
                
                [cell.titleB setText:[datasource[index] valueForKey:@"name"]];
                [cell.priceB setText:kToPrice([datasource[index] valueForKey:@"price"])];
                
                
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
