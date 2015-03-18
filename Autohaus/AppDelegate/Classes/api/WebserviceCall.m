//
//  WebserviceCall.m
//  Autohaus
//
//  Created by IOS Developer on 3/16/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "WebserviceCall.h"

@implementation WebserviceCall

-(void)initCallWithServiceURL:(NSString*)url withParameters:(NSDictionary *)parameters withCompletionHandler:(void(^)(id responseObject))completion{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        completion(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
        
    }];
//    
//    
//        NSURL *urlURL = [NSURL URLWithString:url];
//        NSURLRequest *request = [NSURLRequest requestWithURL:urlURL];
//        
//        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//        operation.responseSerializer = [AFHTTPResponseSerializer serializer];
//        
//        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//            
//            completion(responseObject);
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
//                                                                message:[error localizedDescription]
//                                                               delegate:nil
//                                                      cancelButtonTitle:@"Ok"
//                                                      otherButtonTitles:nil];
//            [alertView show];
//        }];
//        
//        [operation start];
    
    
        
}

@end
