//
//  ViewController.h
//  HidingView
//
//  Created by Carolina Barreiro Cancela on 27/12/14.
//  Copyright (c) 2014 Carolina Barreiro Cancela. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *hidingView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hidingViewPositionY;

@end
