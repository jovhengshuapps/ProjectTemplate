//
//  WebserviceCall.m
//  Autohaus
//
//  Created by IOS Developer on 3/16/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "WebserviceCall.h"

@implementation WebserviceCall
@synthesize reachabilityManager;

-(void)initCallWithServiceURL:(NSString*)url withParameters:(NSDictionary *)parameters withCompletionHandler:(void(^)(id responseObject))completion{
    
        self.reachabilityManager = [Reachability reachabilityWithHostName:url];
        
        NSLog(@"reachability:%@",[self.reachabilityManager currentReachabilityString]);
        
        NSURL *urlURL = [NSURL URLWithString:url];
        NSURLRequest *request = [NSURLRequest requestWithURL:urlURL];
        
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            completion(responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                message:[error localizedDescription]
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
        }];
        
        [operation start];
        
        
    
//    // Create the request.
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
//    
//    
//    // Specify that it will be a POST request
//    request.HTTPMethod = @"POST";
//    
//    // This is how we set header fields
////    [request setValue:@"application/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    
//    // Convert your data and set your request's HTTPBody property
//        
//        NSMutableString *parameterString = [NSMutableString stringWithString:@""];
//        
//        if (parameters) {
//            
//            for (NSString *key in [parameters allKeys]) {
//                [parameterString appendFormat:@"%@=%@&",key,parameters[key]];
//            }
//            
//            [parameterString replaceCharactersInRange:NSMakeRange(parameterString.length-1, 1) withString:@""];
//        }
//        
//        NSLog(@"string:%@",parameterString);
//        
//        [request setHTTPBody:[parameterString dataUsingEncoding:NSUT]];
//        
//    // Create url connection and fire request
//    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//    
//    [conn start];
//        
        
}

//#pragma mark NSURLConnection Delegate Methods
//
//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
//    // A response has been received, this is where we initialize the instance var you created
//    // so that we can append data to it in the didReceiveData method
//    // Furthermore, this method is called each time there is a redirect so reinitializing it
//    // also serves to clear it
//    _responseData = [[NSMutableData alloc] init];
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
//    // Append the new data to the instance variable you declared
//    [_responseData appendData:data];
//}
//
//- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
//                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
//    // Return nil to indicate not necessary to store a cached response for this connection
//    return nil;
//}
//
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
//    // The request is complete and data has been received
//    // You can parse the stuff in your instance variable now
////    NSString *htmlSTR = [[NSString alloc] initWithData:_responseData
////                                              encoding:NSUTF8StringEncoding];
////    NSLog(@"%@" , htmlSTR);
//    NSError *error = nil;
//    NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingAllowFragments error:&error];
//
//    NSLog(@"error:%@\n\nresponse:%@",error,array);
//    
//    [self.delegate responseFromWebserviceCall:array];
//}
//
//- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
//    // The request has failed for some reason!
//    // Check the error var
//}

@end
