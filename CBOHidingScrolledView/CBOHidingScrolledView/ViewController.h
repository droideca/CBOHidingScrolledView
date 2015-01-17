//
//  ViewController.h
//  CBOHidingScrolledView
//
//  Created by Carolina Barreiro Cancela on 17/1/15.
//  Copyright (c) 2015 Carolina Barreiro Cancela. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBHideScrolledView.h"

@interface ViewController : UIViewController{
    CBHideScrolledView *tableController;
}

@property (weak, nonatomic) IBOutlet UIView *hidingView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hidingViewPositionY;

@end


