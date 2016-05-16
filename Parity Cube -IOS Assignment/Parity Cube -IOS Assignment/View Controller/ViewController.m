//
//  ViewController.m
//  Parity Cube -IOS Assignment
//
//  Created by Kiran Gaware on 16/05/16.
//  Copyright © 2016 XYZ Technologies. All rights reserved.
//

#import "ViewController.h"
#import "DealCell.h"
#import "RequestManager.h"
#import "Deal.h"
#import "iOSHelper.h"
#import <SDWebImage/SDImageCache.h>
#import <SDWebImage/SDWebImageManager.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface ViewController ()
{
    NSMutableArray *_topItems;
    NSMutableArray *_popItems;
    
    NSMutableArray *_currentItem;
    UIAlertController *alertController;
    UIAlertView *alert;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _topItems= [[NSMutableArray alloc]init];
    _popItems= [[NSMutableArray alloc]init];

    [self getDeals];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView Datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _currentItem.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;//_items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DealCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DEALCELL_ID"];
    
    Deal *d = [_currentItem objectAtIndex:indexPath.section];
    cell.lblTitle.text = d.title;
    cell.lblDetails.text = d.deal_detail;
    
    NSURL *url = [NSURL URLWithString:d.imageURL];
    if (d.imageURL.length != 0)
    {
    [cell.imageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"] options: SDWebImageContinueInBackground completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType)
        {
           if (!error)
            {
                //Success
            } else
            {
                //Error
            }
        }];
    }else
    {
    //If no image url found
    }
    return cell;
}

#pragma mark UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

#pragma mark API Call

-(void)getDeals
{
    [self showLoading];
    NSURLSession *session = [RequestManager getSession];
    NSMutableURLRequest *request = [RequestManager getDealsRequest];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        if (error == nil)
        {
            NSDictionary* responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSLog(@"Resp Dict:%@",responseDictionary);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self processResponse:responseDictionary];
            });
        }else
        {
            NSLog(@"Show Error");
            [iOSHelper showAlertWithTitle:@"Error" Message:error.description ForViewController:self];
        }
        
    }];
    [postDataTask resume];
}

-(void)processResponse:(NSDictionary *)response
{
    NSArray *top = [response valueForKeyPath:@"result.top"];
    NSArray *pop = [response valueForKeyPath:@"result.popular"];
    for (NSDictionary *dict in top) {
        Deal *d = [[Deal alloc]initWithDictionaryObject:dict];
        [_topItems addObject:d];
    }
    for (NSDictionary *dict in pop) {
        Deal *d = [[Deal alloc]initWithDictionaryObject:dict];
        [_popItems addObject:d];
    }
    [self hideLoading];
    _currentItem = _topItems;
    [self.tableView reloadData];
}


#pragma mark Button Actions

- (IBAction)topButtonTapped:(id)sender {
    _btnTop.backgroundColor = [iOSHelper getColorWithHexValue:@"#37A6E1"];
    _btnPop.backgroundColor = [UIColor whiteColor];
    _currentItem = _topItems;
    [self.tableView reloadData];
}

- (IBAction)popButtonTapped:(id)sender {
    _btnPop.backgroundColor = [iOSHelper getColorWithHexValue:@"#37A6E1"];
    _btnTop.backgroundColor = [UIColor whiteColor];
    _currentItem = _popItems;
    [self.tableView reloadData];
}

#pragma mark Loading View

-(void)showLoading
{
        if ([UIAlertController class])
        {
            alertController = [UIAlertController alertControllerWithTitle:@"Loading..." message:nil preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alertController animated:YES completion:nil];
        }
        else
        {
            alert = [[UIAlertView alloc] initWithTitle:@"Loading..." message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
            [alert show];
            
        }

}

-(void)hideLoading
{
    if ([UIAlertController class])
    {
        [self dismissViewControllerAnimated:alertController completion:nil];
    }
    else
    {
        [alert dismissWithClickedButtonIndex:0 animated:YES];
        
    }
}
@end
