//
//  TestimonialsViewController.m
//  Autohaus
//
//  Created by Joshua Jose Pecson on 3/15/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "TestimonialsViewController.h"
#import "TestimonialCell.h"
#import "WebserviceCall.h"

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
    
    
    [[WebserviceCall new] getTestimonialsCompletion:^(id response) {
        
        if (response) {
            self.arrayDataSource = [[NSArray alloc] initWithArray:[[response objectForKey:@"response"] objectForKey:@"gallery"]];
        }
        else {
            self.arrayDataSource = [self getDataSource];
        }
     
        [self.tableView reloadData];
    }];
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
    
    
    NSDictionary *item1 = [NSDictionary dictionaryWithObjectsAndKeys:@"I am very impressed by the reliable and efficient service provided by Autohaus. The prices are reasonable and delivery is fast. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team.",@"testimonial",@"Michael",@"author",@"Owner of 2007 VW Golf Mk5",@"title", nil];
    
    NSDictionary *item2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Excellent service provided by Autohaus, with good quality yet affordable products. I will recommend them to all car owners!",@"testimonial",@"Clarence",@"author",@"Owner of 2009 Toyota Altis",@"title", nil];
    
    NSDictionary *item3 = [NSDictionary dictionaryWithObjectsAndKeys:@"Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team.",@"testimonial",@"Michaela",@"author",@"Owner of 2007 Volkswagen",@"title", nil];
    
    NSDictionary *item4 = [NSDictionary dictionaryWithObjectsAndKeys:@"Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you DeAutohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you DeAutohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you DeHighly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and hi7 Volkswagen ighly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team. Highly recommend car owners who wish to purchase car parts to try out Autohaus. Thank you Derek and his team.",@"testimonial",@"Mitch",@"author",@"Owner of 2017 Honda",@"title", nil];
    
    NSDictionary *item5 = [NSDictionary dictionaryWithObjectsAndKeys:@"Excellent service!!",@"testimonial",@"Roy",@"author",@"Owner of 2000 Mazda RX",@"title", nil];
    
    return [NSArray arrayWithObjects:item1, item2, item3, item4, item5, nil];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *item = [self.arrayDataSource objectAtIndex:indexPath.row];
    NSString *message = [item objectForKey:@"testimonial"];
    NSString *author = [item objectForKey:@"author"];
    NSString *title = [item objectForKey:@"title"];
    
    CGRect labelSizeMessage = [message boundingRectWithSize:CGSizeMake(self.tableView.frame.size.width - 40.0f, 9999.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:TESTIMONIAL_MSG_COLOR,NSForegroundColorAttributeName,TESTIMONIAL_MSG_FONT,NSFontAttributeName, nil] context:nil];
    
    CGRect labelSizeAuthor = [author boundingRectWithSize:CGSizeMake(self.tableView.frame.size.width - 40.0f, 9999.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:TESTIMONIAL_NAME_COLOR,NSForegroundColorAttributeName,TESTIMONIAL_NAME_FONT,NSFontAttributeName, nil] context:nil];
    
    CGRect labelSizeTitle = [title boundingRectWithSize:CGSizeMake(self.tableView.frame.size.width - 40.0f, 9999.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:TESTIMONIAL_TITLE_COLOR,NSForegroundColorAttributeName,TESTIMONIAL_TITLE_FONT,NSFontAttributeName, nil] context:nil];
    
    return labelSizeMessage.size.height + labelSizeAuthor.size.height + labelSizeTitle.size.height + 60.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"TestimonialCell";
    TestimonialCell *cell = (TestimonialCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSDictionary *item = [self.arrayDataSource objectAtIndex:indexPath.row];
    
    cell.labelName.text = [item objectForKey:@"author"];
    cell.labelTitle.text = [item objectForKey:@"title"];
    
    
    NSString *message = [item objectForKey:@"testimonial"];
    
    cell.labelMessage.text = message;
    
    [cell.labelMessage sizeToFit];
    
    [cell.contentView updateConstraints];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
