//
//  SecondViewController.h
//  Wikipedia
//
//  Created by Umut Kanbak on 7/25/13.
//  Copyright (c) 2013 Umut Kanbak. All rights reserved.
//

#import "ViewController.h"

@interface SecondViewController : ViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic)NSDictionary *dictionary;

@end
