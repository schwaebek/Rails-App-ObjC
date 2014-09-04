//
//  contactsRequest.h
//  Rails App ObjC
//
//  Created by Katlyn Schwaebe on 9/4/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface contactsRequest : NSObject

//+ (NSDictionary *) requestUserInfo: (NSString *)contactInfo;
//+ (void)saveUsers: (NSArray *)users;
+ (NSArray *)loadUsers;

@end
