//
//  CartInterface.m
//  Template
//
//  Created by Angelo Lesano on 3/13/14.
//  Copyright (c) 2014 Angelo Lesano. All rights reserved.
//

#import "CartInterface.h"
#import "AppDelegate.h"
#import "Cart.h"




@implementation CartInterface

- (void)postWithParameters:(NSDictionary*)param completion:(void(^)(BOOL finished))completed{
    NSManagedObjectContext *context = self.managedObjectContext;
    
    BOOL successful = NO;
    
    if (context == nil)
        context = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:kEntityName inManagedObjectContext:context];
    [request setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", [param valueForKey:@"name"]];
    
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    if (error != nil) {
        NSLog(@"Fetch error: %@", error);
        //abort();
    }
    else {
        if ([results count]) {
            Cart *cart = (Cart*)[results lastObject];
            NSInteger x = [[[results objectAtIndex:0] valueForKey:key_quantity] integerValue];
            NSInteger y = [[param objectForKey:key_quantity] integerValue];
            NSInteger newQty = x + y;
//            [context setValue:[NSNumber numberWithInteger:newQty]  forKey:key_quantity];
            cart.qty = [NSNumber numberWithInteger:newQty];
        }else{
            Cart *cart = [NSEntityDescription insertNewObjectForEntityForName:kEntityName inManagedObjectContext:context];
            
            NSLog(@"qty:%@",[param objectForKey:key_quantity]);
            
            
            cart.qty        = [param objectForKey:key_quantity];
            cart.image      = [param objectForKey:@"image"];
            cart.name       = [param objectForKey:@"name"];
            cart.price      = [param objectForKey:@"price"];
        }
    }
    
    
    
//    if ([self duplicate:[param objectForKey:@"name"] ExistsOnEntity:kEntityName]) {
//        NSFetchRequest *request = [[NSFetchRequest alloc] init];
//        NSEntityDescription *entity = [NSEntityDescription entityForName:kEntityName inManagedObjectContext:context];
//        [request setEntity:entity];
//        
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", [param valueForKey:@"name"]];
//        
//        [request setPredicate:predicate];
//        
//        NSError *error;
//        NSArray *results = [context executeFetchRequest:request error:&error];
//        context = [results lastObject];
//        if (!results) {
//            NSLog(@"Fetch error: %@", error);
//            //abort();
//        }else{
//            
//            NSInteger x = [[[results objectAtIndex:0] valueForKey:key_quantity] integerValue];
//            NSInteger y = [[param objectForKey:key_quantity] integerValue];
//            NSInteger newQty = x + y;
//            [context setValue:[NSNumber numberWithInteger:newQty]  forKey:key_quantity];
//
//        }
//        
//    }else{
//        NSLog(@"noDupe");
//        Cart *cart = [NSEntityDescription insertNewObjectForEntityForName:kEntityName inManagedObjectContext:context];
//        
//        NSLog(@"qty:%@",[param objectForKey:key_quantity]);
//        
//        
//        cart.qty        = [param objectForKey:key_quantity];
//        cart.image      = [param objectForKey:@"image"];
//        cart.name       = [param objectForKey:@"name"];
//        cart.price      = [param objectForKey:@"price"];
//        
//    }
    

    
    
    //SAVE MANAGED OBJECT MODEL
    error = nil;
    successful = [context save:&error];
    if (!successful) {
        if (completed) {
            completed(NO);
            NSLog(@"Save wasn't successful: %@", [error userInfo]);
        }
    }
    else {
        if (completed) {
            completed(YES);
            NSLog(@"Save was successful");
        }
    }
}

- (BOOL)duplicate:(NSString*)key ExistsOnEntity:(NSString*)entity {
#warning Create a better algorithm for handling duplicates
    
    NSArray *allData = [self getFrom:entity sortBy:nil];
    NSLog(@"cart:%@", allData);
    
    int dupeCounter = 0;
    for (int x = 0; x < [allData count]; x++) {
        if ([key isEqualToString:[[allData objectAtIndex:x] valueForKey:@"name"]]) {
            dupeCounter++;
        }
    }
    
    if (dupeCounter > 0) {
        return YES;
    }else{
        return NO;
    }
}

- (void)deleteFrom:(NSString *)url tableViewIndex:(int)index{
    NSLog(@"url:%@ id:%d", url, index);
    
    NSManagedObjectContext *context = self.managedObjectContext;
    if (context == nil)
        context = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    NSArray *allData = [self getFrom:url sortBy:nil];
    
    NSLog(@"allData:%@", allData);
    [context deleteObject:[allData objectAtIndex:index]];
}

- (NSArray*)getFrom:(NSString*)url sortBy:(NSString*)sortBy{
    NSLog(@"Fetching data from:%@",url);
    NSManagedObjectContext *context = self.managedObjectContext;
    if (context == nil)
        context = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:url inManagedObjectContext:context];
    [request setEntity:entity];
    
    
    
    if (sortBy) {
        NSPredicate *PreType_exact = [NSPredicate predicateWithFormat:@"category == %@", sortBy];
        NSLog(@"predicate:%@", PreType_exact);
        
        [request setPredicate:PreType_exact];
    }
    
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    if (!results) {
        NSLog(@"Fetch error: %@", error);
        //abort();
    }
    if ([results count] == 0) {
        return nil;
    }
    return results;
}

@end
