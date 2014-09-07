//
//  contactsRequest.m
//  Rails App ObjC
//
//  Created by Katlyn Schwaebe on 9/4/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "contactsRequest.h"

@implementation contactsRequest

+ (NSDictionary *) requestUserInfo: (NSString *)contactInfo
{
    //take the username and call the github url /// insert api
    NSString * urlString  = [NSString stringWithFormat:@"api",contactInfo];
    NSURL * url = [NSURL URLWithString:urlString];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    ////MUTABLE REQUEST////
    NSMutableURLRequest * mutableRequest = [NSMutableURLRequest requestWithURL:url];
    [mutableRequest setHTTPMethod:@"POST"];
    
    //////////
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSDictionary * userInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    NSLog(@"user info = %@", userInfo);
    return userInfo;
}

+ (void)saveUsers: (NSArray *)users
{
    // path to what we are saving
    NSString * path = [contactsRequest usersArchivePath];
    // then we archive
    NSData * userData = [NSKeyedArchiver archivedDataWithRootObject:users];
    // then we save file
    [userData writeToFile:path options:NSDataWritingAtomic error:nil];
}
+ (NSArray *)loadUsers
{
    // path to what we are loading
    NSString * path = [contactsRequest usersArchivePath];
    // then we unarchive
    NSArray * users = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    // then we return the array
    return users;
}
+ (NSString *)usersArchivePath
{
    // returns array of directories
    NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // grab first path from above array
    NSString * documentDirectory = documentDirectories [0];
    // return path/users.data
    return [documentDirectory stringByAppendingPathComponent:@"users.data"];
}



@end
