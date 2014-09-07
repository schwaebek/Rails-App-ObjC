//
//  ViewController.h
//  Rails App ObjC
//
//  Created by Katlyn Schwaebe on 9/2/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *titleField;

@property (weak, nonatomic) IBOutlet UITextField *contentField;
- (IBAction)postNew:(UIButton *)sender;
- (IBAction)getMyPosts:(UIButton *)sender;
- (IBAction)getAllPosts:(UIButton *)sender;

@property (nonatomic) NSDictionary* contactInfo;

@end

