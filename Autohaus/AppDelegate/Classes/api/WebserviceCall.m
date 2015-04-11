//
//  WebserviceCall.m
//  Autohaus
//
//  Created by IOS Developer on 3/16/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "WebserviceCall.h"
#import "APIAccessPoint.h"

@implementation WebserviceCall
@synthesize accessPoint = _accessPoint;

- (void)loginWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion{
    
    if (!_accessPoint) {
        self.accessPoint = [[APIAccessPoint alloc] init];
    }
    [self.accessPoint stopAPIRequest];
    
    _accessPoint.willShowCustomLoadingIndicator = YES;
    _accessPoint.url = WS_LOGIN;
    _accessPoint.httpMethod = @"POST";
    _accessPoint.postParam = parameters;
    
    [_accessPoint connectWithCompletion:^(id response) {
        completion(response);
    }];
       
}

- (void)getCategoriesCompletion:(void (^)(id response)) completion {
    
    if (!_accessPoint) {
        self.accessPoint = [[APIAccessPoint alloc] init];
    }
    [self.accessPoint stopAPIRequest];
    
    _accessPoint.willShowCustomLoadingIndicator = YES;
    _accessPoint.url = WS_CATEGORY;
    _accessPoint.httpMethod = @"POST";
    
    [_accessPoint connectWithCompletion:^(id response) {
        completion(response);
    }];
}

- (void)getProductsCompletion:(void (^)(id response)) completion {
    
    if (!_accessPoint) {
        self.accessPoint = [[APIAccessPoint alloc] init];
    }
    [self.accessPoint stopAPIRequest];
    
    _accessPoint.willShowCustomLoadingIndicator = YES;
    _accessPoint.url = WS_PRODUCTS;
    _accessPoint.httpMethod = @"POST";
    
    [_accessPoint connectWithCompletion:^(id response) {
        completion(response);
    }];
}


@end
