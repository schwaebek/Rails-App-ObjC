//
//  ContactsTableViewCell.m
//  Rails App ObjC
//
//  Created by Katlyn Schwaebe on 9/4/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "ContactsTableViewCell.h"
#import "AppDelegate.h"

@implementation ContactsTableViewCell
{
    UIImageView * contactImage;
    UILabel * contactName;
    UILabel * phoneNumber;
    UILabel * employer;
    UILabel * email;
    UILabel * address;
    
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        contactName = [[UILabel alloc] initWithFrame:CGRectMake(105, 1, 200, 40)];
        contactName.backgroundColor = [UIColor blackColor];
        contactName.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview: contactName];
        contactName.font = [UIFont fontWithName: @"HelveticaNeue-Ultralight" size: 25];
        
        phoneNumber = [[UILabel alloc] initWithFrame:CGRectMake(105, 1, 200, 40)];
        phoneNumber.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview: phoneNumber];
        phoneNumber.font = [UIFont fontWithName: @"HelveticaNeue-Ultralight" size: 25];
        
        employer = [[UILabel alloc] initWithFrame:CGRectMake(105, 1, 200, 40)];
        employer.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview: employer];
        employer.font = [UIFont fontWithName: @"HelveticaNeue-Ultralight" size: 25];
        
        email = [[UILabel alloc] initWithFrame:CGRectMake(105, 1, 200, 40)];
        email.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview: email];
        email.font = [UIFont fontWithName: @"HelveticaNeue-Ultralight" size: 25];
        
        address = [[UILabel alloc] initWithFrame:CGRectMake(105, 1, 200, 40)];
        address.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview: address];
        address.font = [UIFont fontWithName: @"HelveticaNeue-Ultralight" size: 25];
        
        
    contactImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    contactImage.backgroundColor = [UIColor lightGrayColor];
    contactImage.layer.cornerRadius = 50;
    [self.contentView addSubview:contactImage];
        
    
    
    }
        return self;
}
- (void)awakeFromNib {
    
    
    // Initialization code
}
-(void)setFriendInfo:(NSDictionary *)contactInfo
{
    _contactInfo = contactInfo;
    /// for image getting
    
    NSURL * url = [NSURL URLWithString:contactInfo[@"avatar_url"]];
    NSData * data = [NSData dataWithContentsOfURL:url];
    UIImage * image = [UIImage imageWithData:data];
    contactImage.image = image;
    
    
    /*
     NSString * followerString = [NSString stringWithFormat:@"Followers : %@", friendInfo[@"followers"]];
     friendFollowers.text = followerString;
     
     NSString * followingString = [NSString stringWithFormat:@"Following : %@", friendInfo[@"following"]];
     friendFollowing.text = followingString;
     */
    
    contactImage.image = image;
    //friendImage.layer.cornerRadius = 20;
    contactImage.layer.masksToBounds= YES;
    contactName.text = contactInfo [@"name"];
    //followers.text = [NSString stringWithFormat:@"%d", [friendInfo [@"followers"] intValue]]; // number needs to convert to string
    //following.text = [NSString stringWithFormat:@"%d", [friendInfo [@"following"] intValue]];
    //location.text = friendInfo [@"location"];
    
    
    
    NSLog(@"%@",contactInfo);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
