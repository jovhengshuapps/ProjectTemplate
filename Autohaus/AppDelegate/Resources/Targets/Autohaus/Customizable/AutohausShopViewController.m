//
//  AutohausShopViewController.m
//  Autohaus
//
//  Created by Joshua Jose Pecson on 3/14/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "AutohausShopViewController.h"

@interface AutohausShopViewController ()

@end

@implementation AutohausShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect frame = self.tableView.frame;
    frame.size = CGSizeMake(self.tableView.frame.size.width - 30.0f, self.tableView.frame.size.height);
    self.tableView.frame = frame;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([segue.identifier isEqualToString:@"pushList"]) {
//        CollectionListTableViewController *list = segue.destinationViewController;
//        
//        NSString *key = [[self.datasource allKeys] objectAtIndex:indexPath.section];
//        NSInteger objectTag = indexPath.row;
//        
//        if ([[[[self.datasource objectForKey:
//                
//        list.selected   = [datasource[objectTag] valueForKey:@"list"];
//        list.title      = [datasource[objectTag] valueForKey:@"name"];
//    }
}
#pragma mark - Custom Methods
- (void) getDataSource {
    [super getDataSource];
    
#warning implement webservice here
    //Plist to Dictionary
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ProductList" ofType:@"plist"];
    NSDictionary *product = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    
    //Create all products
    
    NSMutableArray *list = [[NSMutableArray alloc] init];
    
    for (NSArray *category in [product allValues]) {
        for (NSDictionary *item in category) {
            [list addObjectsFromArray:[item objectForKey:@"list"]];
        }
    }
    
    NSDictionary *allProducts =[NSDictionary dictionaryWithObjectsAndKeys:list,@"All Products", nil];
    
    [self.datasource addEntriesFromDictionary:allProducts];
    
    [self.datasource addEntriesFromDictionary:product];
    
}

- (NSString*)stringTitleForSection:(NSInteger)section {
    NSString *key = [[self.datasource allKeys] objectAtIndex:section];
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


#pragma  mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSMutableArray *arraykeys = [[NSMutableArray alloc] initWithArray:[self.datasource allKeys]];
    
    NSInteger indexAllProducts = [arraykeys indexOfObject:@"All Products"];
    
    return [arraykeys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [[self.datasource allKeys] objectAtIndex:section];
    if ([self.arrayCollapsedSection containsObject:[NSNumber numberWithInteger:section]]) {
        return 0;
    }
    return [[self.datasource objectForKey:key] count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.frame.size.width, 54.0f)];
    
    
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(15.0f, 10.0f, tableView.frame.size.width-30.0f, 44.0f)];
    container.layer.cornerRadius = 2.0f;
    container.backgroundColor = kSWATCH_Gray230;
    container.tag = section;
    
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 0.0f, container.frame.size.width - 50.0f, 44.0f)];
    labelTitle.text = [self stringTitleForSection:section];
    labelTitle.tag = 1;
    [container addSubview:labelTitle];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_expand_iPhone"]];
    if ([self.arrayCollapsedSection containsObject:[NSNumber numberWithInteger:section]]) {
        imageView.image = [UIImage imageNamed:@"icon_collapse_iPhone"];
    }
    imageView.center = container.center;
    imageView.frame = CGRectMake(labelTitle.frame.size.width, 7.0f, 30.0f, 30.0f);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.tag = 2;
    [container addSubview:imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(collapseSection:)];
    [container addGestureRecognizer:tap];
    
    [viewHeader addSubview:container];
    
    return viewHeader;
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    
//    UIView *viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.frame.size.width, 10.0f)];
//    return viewHeader;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 54.0f;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 10.0f;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionRootCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString *key = [[self.datasource allKeys] objectAtIndex:indexPath.section];
    NSDictionary *item = [[self.datasource objectForKey:key] objectAtIndex:indexPath.row];
    cell.textLabel.text = [item objectForKey:@"name"];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *key = [[self.datasource allKeys] objectAtIndex:indexPath.section];
    NSInteger objectTag = indexPath.row;
    
    //CHECK IF EMPTY
    if ([[[[self.datasource objectForKey:key] objectAtIndex:objectTag] valueForKey:@"list"] count] > 0) {
//        [self performSegueWithIdentifier:@"pushList" sender:self];
        
        CollectionListTableViewController *list = kStoryboard(@"CollectionListTableViewController");
        
                list.selected   = [[[self.datasource objectForKey:key] objectAtIndex:objectTag]  valueForKey:@"list"];
                list.title      = [[[self.datasource objectForKey:key] objectAtIndex:objectTag]  valueForKey:@"name"];
        
        [self.navigationController pushViewController:list animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kAppName
                                                        message:@"Collection is empty. Please try something else"
                                                       delegate:nil
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }

}

@end
