//
//  ViewController.m
//  Rails App ObjC
//
//  Created by Katlyn Schwaebe on 9/2/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "ContactsTableViewController.h"
#import "ContactsTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController
{
     UIWebView* webView;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    
    webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:webView];
   
    AppDelegate * appD = [[UIApplication sharedApplication]delegate];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Post" inManagedObjectContext:appD.managedObjectContext];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"user = 'jo@theironyard.com'"];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"posted_at"
    ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [appD.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"fetchedObjects");
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postNew:(UIButton *)sender {
//    let newPostURL = API + "posts?post[title]=\(titleField.text)&post[content]=\(contentField.text)"
//    //NSURL in objective c
//    let encodedString = newPostURL.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
//    var request = NSMutableURLRequest(URL: NSURL(string: encodedString!))
//    
//    request.setValue("zxcasdqwe", forHTTPHeaderField: "AUTH_TOKEN")
//    request.HTTPMethod = "POST"
//    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (respone: NSURLResponse!, data:NSData!, error: NSError!) -> Void in
//        
//        let info: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
//        println(info)
}

- (IBAction)getMyPosts:(UIButton *)sender {
//    let myPostsURL = API + "posts/mine"
//    var request = NSMutableURLRequest(URL: NSURL(string: myPostsURL))
//    request.setValue("zxcasdqwe", forHTTPHeaderField: "AUTH_TOKEN")
//    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (respone: NSURLResponse!, data:NSData!, error: NSError!) -> Void in
//        
//        let posts = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSArray
//        println(posts)

}

- (IBAction)getAllPosts:(UIButton *)sender {
//    let allPostsURL = API + "posts"
//    let request = NSURLRequest(URL:NSURL(string: allPostsURL))
//    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (respone: NSURLResponse!, data:NSData!, error: NSError!) -> Void in
//        
//        let posts = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSArray
//        println(posts)
//
}
-(void)setContactInfo:(NSDictionary *)contactInfo
{
    _contactInfo = contactInfo;
    NSURL* url = [NSURL URLWithString:contactInfo [@"html_url"]];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}
@end
