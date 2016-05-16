//
//  ViewController.h
//  Parity Cube -IOS Assignment
//
//  Created by Kiran Gaware on 16/05/16.
//  Copyright © 2016 XYZ Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)topButtonTapped:(id)sender;
- (IBAction)popButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnTop;
@property (weak, nonatomic) IBOutlet UIButton *btnPop;
@end

