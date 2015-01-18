//
//  CBHideScrolledView.h
//  CBOHidingScrolledview
//
//  Created by Carolina Barreiro Cancela on 11/1/15.
//  Copyright (c) 2015 Carolina Barreiro Cancela. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBHidingScrolledView : NSObject <UITableViewDelegate>

- (id)initWithHidingView:(UIView *)hidingView constraint:(NSLayoutConstraint *)constraint;
- (id)initWithHidingView:(UIView *)hidingView constraint:(NSLayoutConstraint *)constraint heightWithoutHide:(float)minHeight;

@end
