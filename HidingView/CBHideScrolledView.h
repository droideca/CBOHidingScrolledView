//
//  CBHideScrolledView.h
//  HidingView
//
//  Created by Carolina Barreiro Cancela on 11/1/15.
//  Copyright (c) 2015 Carolina Barreiro Cancela. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBHideScrolledView : NSObject <UITableViewDelegate>
//@property NSLayoutConstraint *hidingViewPositionY;
@property(nonatomic,retain) id parent;
@property (weak, nonatomic) NSLayoutConstraint *constraintPositionY;
@property (weak, nonatomic) UIView *hidingView;

@end
