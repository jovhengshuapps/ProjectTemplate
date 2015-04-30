//
//  WebserviceCall.h
//  Autohaus
//
//  Created by IOS Developer on 3/16/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseConfig.h"
#import "APIAccessPoint.h"


typedef NS_ENUM(NSInteger, APIResponse) {
    APIResponseInvalid = -1,
    APIResponseNotFound,             /*0 - action not defined or no post found*/
    APIResponseSuccessful,           /*1 - successful*/
    APIResponseDuplicateEntry,       /*2 - duplicate entry*/
    APIResponseSavingError,          /*3 - error on saving*/
    APIResponseEmailFailed,          /*4 - email not sent*/
    APIResponseWrongCredentials      /*5 - wrong credentials*/
};

@interface WebserviceCall : APIAccessPoint
@property (strong, nonatomic) APIAccessPoint *accessPoint;

- (void)loginWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion;
- (void)logoutWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion;
- (void)registerWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion;
- (void)resetPasswordWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion;
- (void)changePasswordWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion;
- (void)getProductsCompletion:(void (^)(id response)) completion;
- (void)getCategoriesCompletion:(void (^)(id response)) completion;
- (void)getSubCategoriesCompletion:(void (^)(id response)) completion;
- (void)getTestimonialsCompletion:(void (^)(id response)) completion;
- (void)getCartCompletion:(void (^)(id response)) completion;
- (void)addToCartWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion;
- (void)checkoutWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion;
- (void)inquiryWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion;
- (void)updateInfoWithParameters:(NSDictionary*)parameters completion:(void (^)(id response)) completion;
- (void)countryCompletion:(void (^)(id response)) completion;
- (void)bannersCompletion:(void (^)(id response)) completion;
@end
