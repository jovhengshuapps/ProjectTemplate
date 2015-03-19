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
    
    NSURL *urlURL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[urlURL standardizedURL]];
    request.HTTPMethod = @"POST";
    NSData *postData = [@"user_login=blah&user_pass=blah" dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[@"user" dataUsingEncoding:NSUTF8StringEncoding] forKey:@"user_login"];
    [request setValue:[@"pass" dataUsingEncoding:NSUTF8StringEncoding] forKey:@"user_pass"];
//    [request setHTTPBody:postData];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

//    [[manager POST:@"http://autohaus.com.sg/services/?type=products" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        completion(responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
//                                                            message:[error localizedDescription]
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"Ok"
//                                                  otherButtonTitles:nil];
//        [alertView show];
//    }] start];

    
    [manager POST:WS_LOGIN parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFormData:[@"user" dataUsingEncoding:NSUTF8StringEncoding] name:@"user_login"];
        [formData appendPartWithFormData:[@"pass" dataUsingEncoding:NSUTF8StringEncoding] name:@"user_pass"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completion(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Response = %@", operation);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];

    }];
    
    
//    [[manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        completion(responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
//                                                            message:[error localizedDescription]
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"Ok"
//                                                  otherButtonTitles:nil];
//        [alertView show];
//    }] start];
    
    
        
}

@end
