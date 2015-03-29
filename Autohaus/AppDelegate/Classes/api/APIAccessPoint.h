//
//  APIAccessPoint.h
//  Template v.1 Variant 1
//
//  Make this class global by #import it to your prefix header file $[yourAppName]-Prefix.pch
//
//  Created by Angelo Lesano on 20/2/14.
//  Copyright (c) 2014 Juz Media Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface APIAccessPoint : NSObject <UIAlertViewDelegate>
@property (strong, nonatomic)   NSString        *url;
@property (strong, nonatomic)   NSDictionary    *postParam;
@property (strong, nonatomic)   UIImage         *postImage;
@property (strong, nonatomic)   NSString        *httpMethod;
@property (strong, nonatomic)   NSString        *loadingMessage;
@property (nonatomic)           BOOL            willShowCustomLoadingIndicator;
@property (nonatomic)           BOOL            isLoading;

- (void)connectWithCompletion:(void (^)(id response)) completion;
- (void)stopAPIRequest;
- (void)alert:(NSString*)title message:(NSString*)message;

// ----- APP SPECIFIC METHODS (like login, logout, save etc etc)



@end
// ----- METHOD TYPES ---- //
#define kAPI_METHOD_POST        @"POST"
#define kAPI_METHOD_GET         @"GET"

// ----- LOAD URL HERE ---- //
//URL
#define kURL_Base               @"http://thanqueue-tqtq.rhcloud.com"

//GET

//POST
#define kURL_POST_BaseForgotten             [kURL_Base stringByAppendingString:@"/ThanqueueApi/forgotPassword"]
#define kURL_POST_BaseLogin                 [kURL_Base stringByAppendingString:@"/ThanqueueApi/login"]
#define kURL_POST_BaseCreateAcct            [kURL_Base stringByAppendingString:@"/ThanqueueApi/signup"]
#define kURL_POST_BaseVerification          [kURL_Base stringByAppendingString:@"/ThanqueueApi/verify"]

#define kURL_POST_UserProfile               [kURL_Base stringByAppendingString:@"/ThanqueueApi/view"]
#define kURL_POST_UnknownProfile            [kURL_Base stringByAppendingString:@"/ThanqueueApi/profile"]
#define kURL_POST_UnknownProfileFollow      [kURL_Base stringByAppendingString:@"/ThanqueueApi/follow/add"]
#define kURL_POST_UnknownProfileUnfollow    [kURL_Base stringByAppendingString:@"/ThanqueueApi/follow/delete"]

#define kURL_POST_UserActivity              [kURL_Base stringByAppendingString:@"/ThanqueueApi/pff"]
#define kURL_POST_UserPosts                 [kURL_Base stringByAppendingString:@"/ThanqueueApi/profilePost"]
#define kURL_POST_UserEditProfile           [kURL_Base stringByAppendingString:@"/ThanqueueApi/editProfile"]

#define kURL_POST_PostDelete                [kURL_Base stringByAppendingString:@"/ThanqueueApi/post/deletePost"]
#define kURL_POST_PostLike                  [kURL_Base stringByAppendingString:@"/ThanqueueApi/post/like"];
#define kURL_POST_PostUnlike                [kURL_Base stringByAppendingString:@"/ThanqueueApi/post/unlike"];
#define kURL_POST_PostGetByID               [kURL_Base stringByAppendingString:@"/ThanqueueApi/getPost"]

#define kURL_POST_TimelinePublic            [kURL_Base stringByAppendingString:@"/ThanqueueApi/publicPost"]
#define kURL_POST_TimelinePrivate           [kURL_Base stringByAppendingString:@"/ThanqueueApi/privatePost"]
#define kURL_POST_TimelineFollowing         [kURL_Base stringByAppendingString:@"/ThanqueueApi/followingPost"]
#define kURL_POST_TimelineFollower          [kURL_Base stringByAppendingString:@"/ThanqueueApi/followerPostView"]

#define kURL_POST_Explore                   [kURL_Base stringByAppendingString:@"/ThanqueueApi/explore"]
#define kURL_POST_ListFollowing             [kURL_Base stringByAppendingString:@"/ThanqueueApi/follow/Following"]
#define kURL_POST_ListFollowers             [kURL_Base stringByAppendingString:@"/ThanqueueApi/follow/Followers"]
#define kURL_POST_ListAllContacts           [kURL_Base stringByAppendingString:@"/ThanqueueApi/users"]

#define kURL_POST_SharePost                 [kURL_Base stringByAppendingString:@"/ThanqueueApi/post/add1"]
#define kURL_POST_SharePostWithImage        [kURL_Base stringByAppendingString:@"/ThanqueueApi/post/add"]

#define kURL_POST_Notification              [kURL_Base stringByAppendingString:@"/ThanqueueApi/notification"]
#define kURL_POST_NotificationSeen          [kURL_Base stringByAppendingString:@"/ThanqueueApi/seen"]




















