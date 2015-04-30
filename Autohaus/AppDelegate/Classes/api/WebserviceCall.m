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

- (void)connectPOSTMethod:(NSString*)urlString parameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion{
    if (!_accessPoint) {
        self.accessPoint = [[APIAccessPoint alloc] init];
    }
    [self.accessPoint stopAPIRequest];
    
    _accessPoint.willShowCustomLoadingIndicator = YES;
    _accessPoint.url = urlString;
    _accessPoint.httpMethod = @"POST";
    _accessPoint.postParam = parameters;
    
    [_accessPoint connectWithCompletion:^(id response) {
        
//        NSLog(@"response:%@",response);
        APIResponse responseAPI = (APIResponse) ([response isKindOfClass:[NSDictionary class]] && [[response objectForKey:@"response"] isKindOfClass:[NSDictionary class]])?[[[response objectForKey:@"response"] objectForKey:@"status"] integerValue]:APIResponseInvalid;
        
        if (responseAPI == APIResponseInvalid || [urlString isEqualToString:WS_ADD_TO_CART] || [urlString isEqualToString:WS_LOGOUT]) {
            //do nothing
            completion(response);
        }
        else if (responseAPI == APIResponseNotFound) {
            [_accessPoint alert:@"Service Error" message:@"Failed to receive response"];
        }
        else if (responseAPI == APIResponseDuplicateEntry) {
            [_accessPoint alert:@"Service Error" message:@"Server received duplicate entry"];
        }
        else if (responseAPI == APIResponseSavingError) {
            [_accessPoint alert:@"Service Error" message:@"Failed to save entry to server"];
        }
        else if (responseAPI == APIResponseWrongCredentials) {
            [_accessPoint alert:@"Service Error" message:@"Invalid parameters received"];
        }
        else if (responseAPI == APIResponseEmailFailed) {
            [_accessPoint alert:@"Service Error" message:@"Failed to send email"];
        }
        else if (responseAPI == APIResponseSuccessful) {
            completion(response);
        }
    }];
}

- (void)loginWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion{
    
    [self connectPOSTMethod:WS_LOGIN parameters:parameters completion:^(id response) {
        completion(response);
    }];
       
}

- (void)logoutWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion{
    
    [self connectPOSTMethod:WS_LOGOUT parameters:parameters completion:^(id response) {
        completion(response);
    }];
    
}

- (void)registerWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion{
    
    [self connectPOSTMethod:WS_REGISTER parameters:parameters completion:^(id response) {
        completion(response);
    }];
}

- (void)resetPasswordWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion{
    
    [self connectPOSTMethod:WS_RESET_PASSWORD parameters:parameters completion:^(id response) {
        completion(response);
    }];
}

- (void)changePasswordWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion{
    
    [self connectPOSTMethod:WS_CHANGE_PASSWORD parameters:parameters completion:^(id response) {
        completion(response);
    }];
}

- (void)getCategoriesCompletion:(void (^)(id response)) completion {
    
    [self connectPOSTMethod:WS_CATEGORY parameters:nil completion:^(id response) {
        completion(response);
    }];
}

- (void)getSubCategoriesCompletion:(void (^)(id response)) completion {
    
    [self connectPOSTMethod:WS_SUBCATEGORY parameters:nil completion:^(id response) {
        completion(response);
    }];
}

- (void)getProductsCompletion:(void (^)(id response)) completion {
    
    [self connectPOSTMethod:WS_PRODUCTS parameters:nil completion:^(id response) {
        completion(response);
    }];
}

- (void)getTestimonialsCompletion:(void (^)(id response)) completion {
    
    [self connectPOSTMethod:WS_TESTIMONIALS parameters:nil completion:^(id response) {
        completion(response);
    }];
}

- (void)getCartCompletion:(void (^)(id response)) completion {
    
    [self connectPOSTMethod:WS_GET_CART parameters:nil completion:^(id response) {
        completion(response);
    }];
}

- (void)addToCartWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion{
    
    [self connectPOSTMethod:WS_ADD_TO_CART parameters:parameters completion:^(id response) {
        completion(response);
    }];
}

- (void)checkoutWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion{
    
    [self connectPOSTMethod:WS_CHECKOUT parameters:parameters completion:^(id response) {
        completion(response);
    }];
}

- (void)inquiryWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion{
    
    [self connectPOSTMethod:WS_INQUIRY parameters:parameters completion:^(id response) {
        completion(response);
    }];
}

- (void)updateInfoWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion{
    
    [self connectPOSTMethod:WS_UPDATE_INFO parameters:parameters completion:^(id response) {
        completion(response);
    }];
}

- (void)countryCompletion:(void (^)(id response)) completion {
    
    [self connectPOSTMethod:WS_COUNTRY parameters:nil completion:^(id response) {
        completion(response);
    }];
}

- (void)bannersCompletion:(void (^)(id response)) completion {
    
    [self connectPOSTMethod:WS_BANNERS parameters:nil completion:^(id response) {
        completion(response);
    }];
}

@end
