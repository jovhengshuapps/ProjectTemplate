//
//  TestimonialsViewController.m
//  Autohaus
//
//  Created by Joshua Jose Pecson on 3/15/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "TestimonialsViewController.h"
#import "TestimonialCell.h"

@interface TestimonialsViewController ()
@property (strong, nonatomic) NSArray *arrayDataSource;

@end

@implementation TestimonialsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self initAppTheme];
    
    //dummy data
    self.arrayDataSource = [self getDataSource];
    
//    self.tableView.estimatedRowHeight = 100.0;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
//    [self.tableView registerClass:[TestimonialCell class] forCellReuseIdentifier:@"TestimonialCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initAppTheme {
    
    UIImageView *navBarTitle = [[UIImageView alloc] initWithImage:kAppLogo_Nav];
    [self.navigationItem setTitleView:navBarTitle];
    
}

- (NSArray*) getDataSource {
    NSDictionary *item1 = [NSDictionary dictionaryWithObjectsAndKeys:@"I am very impressed by the reliable and efficient service provided by Autohaus. The prices are reasonable and delivery is fast. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team.",@"message",@"Michael",@"name",@"Owner of 2007 VW Golf Mk5",@"title", nil];
    
    NSDictionary *item2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Excellent service provided by Autohaus, with good quality yet affordable products. I will recommend them to all car owners!",@"message",@"Clarence",@"name",@"Owner of 2009 Toyota Altis",@"title", nil];
    
    NSDictionary *item3 = [NSDictionary dictionaryWithObjectsAndKeys:@"Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team.",@"message",@"Michaela",@"name",@"Owner of 2007 Volkswagen",@"title", nil];
    
    return [NSArray arrayWithObjects:item1, item2, item3, nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.arrayDataSource count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"TestimonialCell";
    TestimonialCell *cell = (TestimonialCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSDictionary *item = [self.arrayDataSource objectAtIndex:indexPath.row];
    
    cell.labelName.text = [item objectForKey:@"name"];
    cell.labelTitle.text = [item objectForKey:@"title"];
    
    
    NSString *message = [item objectForKey:@"message"];
    
    cell.textViewMessage.text = message;
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    
    return cell;
}


-(CGFloat)textViewHeight:(UITextView *)textView {
    [textView.layoutManager ensureLayoutForTextContainer:textView.textContainer];
    CGRect usedRect = [textView.layoutManager usedRectForTextContainer:textView.textContainer];
    return ceilf(usedRect.size.height + textView.textContainerInset.top
                 +textView.textContainerInset.bottom) + 65.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *item = [self.arrayDataSource objectAtIndex:indexPath.row];
    NSString *message = [item objectForKey:@"message"];
    
    UITextView *protoTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 252, 30)];
    protoTextView.text = message;
    float height = [self textViewHeight:protoTextView];
    return height + 65.0f;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
