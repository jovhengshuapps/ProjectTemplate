//
//  CollectionRootTableViewController.m
//  GingerDolls
//
//  Created by Angelo Lesano on 8/12/14.
//  Copyright (c) 2014 BD Trade & Marketing. All rights reserved.
//

#import "CollectionRootTableViewController.h"
#import "WebserviceCall.h"
#import "CollectionDetailMainViewController.h"

#define kSegue_List     @"pushList"

@interface CollectionRootTableViewController ()
@property (strong, nonatomic) NSMutableArray *sectionKeys;
@property (strong, nonatomic) NSDictionary *allProducts;
@end

@implementation CollectionRootTableViewController
@synthesize datasource;
@synthesize arrayCollapsedSection;
@synthesize sectionKeys;
@synthesize allProducts;
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

    [self getDataSource];

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
    
    self.tableView.separatorColor = SHOP_SEPARATOR_COLOR;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 20.0f);
}

#pragma mark - Custom Methods
- (void) getDataSource {
    self.arrayCollapsedSection = nil;
    self.datasource = nil;
    self.sectionKeys = nil;
    self.arrayCollapsedSection = [[NSMutableArray alloc] init];
    self.datasource = [[NSMutableDictionary alloc] init];
    self.sectionKeys = [[NSMutableArray alloc] init];
    
    
    [[WebserviceCall new] getProductsCompletion:^(id response) {
//        NSLog(@"response:%@",response);
        
        self.sectionKeys = [[NSMutableArray alloc] init];
        
        NSArray *responseProduct = ([response isKindOfClass:[NSDictionary class]])?[[response objectForKey:@"response"] objectForKey:@"products"]:response;
        
        for (NSDictionary *products in responseProduct) {
            if (![self.sectionKeys containsObject:products[@"category"]]) {
                [self.sectionKeys addObject:products[@"category"]];
            }
        }
        
        NSMutableArray *allProductList = [[NSMutableArray alloc] init];
        for (NSString *categoryKey in self.sectionKeys) {
            NSMutableArray *list = [[NSMutableArray alloc] init];
            for (NSDictionary *products in responseProduct) {
                if ([products[@"category"] isEqualToString:categoryKey]) {
                    NSDictionary *item = [NSDictionary dictionaryWithObjectsAndKeys:products[@"name"],@"name",products[@"price"],@"price",products[@"image"],@"image",products[@"description"],@"desc", nil];
                    [list addObject:item];
                    [allProductList addObject:item];
                }
            }
            [self.datasource setObject:list forKey:categoryKey];
        }
        
        self.allProducts = [NSDictionary dictionaryWithObjectsAndKeys:allProductList,@"list",@"All Products",@"name", nil];
        
        [self.tableView reloadData];
    }];
      
    
    //setup table header view
    UIView *viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, 54.0f)];
    
    
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(15.0f, 10.0f, self.tableView.frame.size.width-30.0f, 44.0f)];
    container.layer.cornerRadius = SHOP_SECTION_CORNER;
    container.backgroundColor = SHOP_SECTION_BGCOLOR;
    container.layer.borderColor = SHOP_SECTION_BORDERCOLOR.CGColor;
    container.layer.borderWidth = 2.0f;
    
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 0.0f, container.frame.size.width - 50.0f, 44.0f)];
    labelTitle.text = @"All Products";
    labelTitle.font = SHOP_SECTION_CELL_FONT;
    labelTitle.textColor = SHOP_SECTION_CELL_COLOR;
    labelTitle.tag = 1;
    [container addSubview:labelTitle];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_disclosure_iPhone"]];
    imageView.frame = CGRectMake(labelTitle.frame.size.width, 10.0f, 20.0f, 20.0f);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.tag = 2;
    [container addSubview:imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewAllProducts:)];
    [container addGestureRecognizer:tap];
    
    [viewHeader addSubview:container];
    self.tableView.tableHeaderView = viewHeader;
    
    
}

- (NSString*)stringTitleForSection:(NSInteger)section {
    NSString *key = [self.sectionKeys objectAtIndex:section];
    return key;
}

- (void) collapseSection:(UITapGestureRecognizer *)tap {
    
    UIView *tappedView = (UIView *)tap.view;
    NSInteger section = tappedView.tag;
    
    if ([self.arrayCollapsedSection containsObject:[NSNumber numberWithInteger:section]]) {
        [self.arrayCollapsedSection removeObject:[NSNumber numberWithInteger:section]];
    }
    else {
        [self.arrayCollapsedSection addObject:[NSNumber numberWithInteger:section]];
    }
    
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}

- (void) viewAllProducts:(UITapGestureRecognizer *)tap {
    
    CollectionListTableViewController *list = kStoryboard(@"CollectionListTableViewController");
    
    list.selected   = [self.allProducts  valueForKey:@"list"];
    list.title      = [self.allProducts  valueForKey:@"name"];
    
    [self.navigationController pushViewController:list animated:YES];
}

#pragma  mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sectionKeys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSString *key = [self.sectionKeys objectAtIndex:section];
    if ([self.arrayCollapsedSection containsObject:[NSNumber numberWithInteger:section]]) {
        return 0;
    }
    return [[self.datasource objectForKey:key] count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.frame.size.width, 54.0f)];
    
    
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(15.0f, 10.0f, tableView.frame.size.width-30.0f, 44.0f)];
    container.layer.cornerRadius = SHOP_SECTION_CORNER;
    container.backgroundColor = SHOP_SECTION_BGCOLOR;
    container.layer.borderColor = SHOP_SECTION_BORDERCOLOR.CGColor;
    container.layer.borderWidth = 2.0f;
    container.tag = section;
    
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 0.0f, container.frame.size.width - 50.0f, 44.0f)];
    labelTitle.text = [self stringTitleForSection:section];
    labelTitle.font = SHOP_SECTION_CELL_FONT;
    labelTitle.textColor = SHOP_SECTION_CELL_COLOR;
    labelTitle.tag = 1;
    [container addSubview:labelTitle];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_collapse_iPhone"]];
    if ([self.arrayCollapsedSection containsObject:[NSNumber numberWithInteger:section]]) {
        imageView.image = [UIImage imageNamed:@"icon_expand_iPhone"];
    }
    imageView.frame = CGRectMake(labelTitle.frame.size.width, 10.0f, 20.0f, 20.0f);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.tag = 2;
    [container addSubview:imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(collapseSection:)];
    [container addGestureRecognizer:tap];
    
    [viewHeader addSubview:container];
    
    return viewHeader;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 54.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionRootCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString *key = [self.sectionKeys objectAtIndex:indexPath.section];
    NSDictionary *item = [[self.datasource objectForKey:key] objectAtIndex:indexPath.row];
    cell.textLabel.text = [item objectForKey:@"name"];
    cell.textLabel.font = SHOP_SECTION_CELL_FONT;
    cell.textLabel.textColor = SHOP_SECTION_CELL_COLOR;
    cell.indentationLevel = 2;
    cell.indentationWidth = 20.0f;
    
    if ([item objectForKey:@"list"] && [[item objectForKey:@"list"] count]) {
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_disclosure_iPhone"]];
//        imageView.frame = CGRectMake(0.0f, 7.0f, 30.0f, 30.0f);
//        imageView.contentMode = UIViewContentModeScaleAspectFit;
//        
//        cell.accessoryView = imageView;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:cell.frame];
    backgroundView.backgroundColor = SHOP_SECTION_BGCOLOR;
    
    cell.selectedBackgroundView = backgroundView;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *key = [self.sectionKeys objectAtIndex:indexPath.section];
    NSInteger objectTag = indexPath.row;
    
    //CHECK IF EMPTY
    if ([[[[self.datasource objectForKey:key] objectAtIndex:objectTag] valueForKey:@"list"] count] > 0) {
        //        [self performSegueWithIdentifier:@"pushList" sender:self];
        
        CollectionListTableViewController *list = kStoryboard(@"CollectionListTableViewController");
        
        list.selected   = [[[self.datasource objectForKey:key] objectAtIndex:objectTag]  valueForKey:@"list"];
        list.title      = [[[self.datasource objectForKey:key] objectAtIndex:objectTag]  valueForKey:@"name"];
        
        [self.navigationController pushViewController:list animated:YES];
    }else{
        NSLog(@"data:%@",[[self.datasource objectForKey:key] objectAtIndex:objectTag]);
        CollectionDetailMainViewController *detail = kStoryboard(@"CollectionDetailMain");
        detail.selected = [[self.datasource objectForKey:key] objectAtIndex:objectTag];
        
        [self.navigationController pushViewController:detail animated:YES];
    }
    
}

@end
