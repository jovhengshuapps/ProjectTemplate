//
//  AutohausHomeViewController.m
//  Autohaus
//
//  Created by IOS Developer on 3/13/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "AutohausHomeViewController.h"
#import "CollectionCellText.h"

@interface AutohausHomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnAbout;
- (IBAction)viewAbout:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewForAbout;

@end

@implementation AutohausHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //populate collection
    self.arrayOfCollection = [self getData];
    
    [self setupAbout];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) setupAbout {
    
}

- (NSArray*) getData {
    
    NSDictionary *item1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Engine Care",@"text",@"",@"image", nil];
    NSDictionary *item2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Car Accessories",@"text",@"",@"image", nil];
    NSDictionary *item3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Car Care",@"text",@"",@"image", nil];
    
    NSArray *list = [NSArray arrayWithObjects:item1, item2, item3, nil];
    
    NSDictionary *section = [NSDictionary dictionaryWithObjectsAndKeys:@"Product Categories", @"title", list, @"list", nil];
    
    NSArray *resultArray = [NSArray arrayWithObjects:section, nil];
    
    
    return resultArray;
}

#pragma mark - UICollection Data Source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.arrayOfCollection count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[[self.arrayOfCollection objectAtIndex:section] objectForKey:@"list"]count];
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 0, 10); // top, left, bottom, right
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0.0;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        CollectionHeaderLabel *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = [[NSString alloc]initWithFormat:@"%@", [[self.arrayOfCollection objectAtIndex:indexPath.section] objectForKey:@"title"]];
        headerView.labelHeader.text = title;
        headerView.labelHeader.font = kFONT_HelveticaNeueCondensedBold(18);
        
        reusableview = headerView;
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        
        reusableview = footerview;
    }
    
    return reusableview;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"Cell";
    
    CollectionCellText *cell = (CollectionCellText *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    NSDictionary *item = [[[self.arrayOfCollection objectAtIndex:indexPath.section] objectForKey:@"list"] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [item objectForKey:@"text"];
    cell.textLabel.font = kFONT_HelveticaNeueMedium(16);
    cell.textLabel.textColor = kSWATCH_Gray63;
    
    cell.backgroundColor = kSWATCH_Gray230;
    cell.layer.cornerRadius = 2.0f;
    
    return cell;
}

- (IBAction)viewAbout:(id)sender {
    
    UIViewController *vc = kStoryboard(@"aboutVC");
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
