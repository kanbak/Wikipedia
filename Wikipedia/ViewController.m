//
//  ViewController.m
//  Wikipedia
//
//  Created by Umut Kanbak on 7/25/13.
//  Copyright (c) 2013 Umut Kanbak. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    
    __weak IBOutlet UITextField *textFieldOutlet;
    __weak IBOutlet UITableView *tableViewOutlet;
    NSString *searchItem;
    NSURL *url;
    NSString *urlValue;
    NSArray *wikipediaArray;
    NSDictionary *wikipediaDictionary;
    NSDictionary *wikipediaDictionary2;
    int path;
    
    
    
    
}
- (IBAction)goButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    self.navigationItem.title=@"Wikipedia Reader";
    //[textFieldOutlet becomeFirstResponder];
    
	// Do any additional setup after loading the view, typically from a nib.
}
-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goButton:(id)sender {
    searchItem= textFieldOutlet.text;
    NSString *newString=[searchItem stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    urlValue=[NSString stringWithFormat:@"https://en.wikipedia.org/w/api.php?%%20action=query&list=search&srsearch=%@&srprop=snippet&format=json",newString];
    NSURL *myUrl = [[NSURL  alloc]initWithString:urlValue];
    NSURLRequest *request = [NSURLRequest requestWithURL:myUrl];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         wikipediaDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
         wikipediaDictionary2=[wikipediaDictionary objectForKey:@"query"];
         wikipediaArray=[wikipediaDictionary2 objectForKey:@"search"];
         
         
         [tableViewOutlet reloadData];
         [textFieldOutlet resignFirstResponder];
     }];
    
}
#pragma mark UITableViewDataSource
-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [wikipediaArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"My table"];
    NSDictionary *wikipediaDictionary3 = (NSDictionary *)[wikipediaArray objectAtIndex:indexPath.row];
    NSString *search = [wikipediaDictionary3 objectForKey:@"title"];
    
    if (cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"My table"];
    }
    
    cell.textLabel.text=search;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    path=indexPath.row;
    [self performSegueWithIdentifier:@"toSecondView" sender:self];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SecondViewController *secondViewController = segue.destinationViewController;
    secondViewController.dictionary=[wikipediaArray objectAtIndex:path];
}

@end
