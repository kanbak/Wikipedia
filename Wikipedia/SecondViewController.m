//
//  SecondViewController.m
//  Wikipedia
//
//  Created by Umut Kanbak on 7/25/13.
//  Copyright (c) 2013 Umut Kanbak. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    
    __weak IBOutlet UILabel *dictionaryLabel;
    
    __weak IBOutlet UITextView *dictionaryTextView;
    
}

@end

@implementation SecondViewController
@synthesize dictionary;

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
    
    [super viewDidLoad];
   
    NSString *search2 = [dictionary objectForKey:@"title"];
    NSString *snippet2 = [dictionary objectForKey:@"snippet"];
        dictionaryLabel.text=search2;
    dictionaryTextView.text=snippet2;
    self.navigationItem.title=[dictionary objectForKey:@"title"];
    

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
