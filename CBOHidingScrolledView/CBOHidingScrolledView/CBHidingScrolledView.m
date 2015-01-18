//
//  CBHideScrolledView.m
//  CBOHidingScrolledview
//
//  Created by Carolina Barreiro Cancela on 11/1/15.
//  Copyright (c) 2015 Carolina Barreiro Cancela. All rights reserved.
//

#import "CBHidingScrolledView.h"

@interface CBHidingScrolledView()

@property (weak, nonatomic) NSLayoutConstraint *constraintPositionY;
@property (weak, nonatomic) UIView *hidingView;
@property float heightWithoutHide;

@end

@implementation CBHidingScrolledView

bool dragging;
float initialYContentOffset;
float previousYOffset;
float minConstraintValue;

- (id)initWithHidingView:(UIView *)hidingView constraint:(NSLayoutConstraint *)constraint heightWithoutHide:(float)minHeight {
    self = [super init];
    
    if (self) {
        self.hidingView = hidingView;
        self.constraintPositionY = constraint;
        self.heightWithoutHide = minHeight;
        minConstraintValue = -self.hidingView.frame.size.height+ self.heightWithoutHide;
    }
    
    return self;
    
}


- (id)initWithHidingView:(UIView *)hidingView constraint:(NSLayoutConstraint *)constraint {
    return [self initWithHidingView:hidingView constraint:constraint heightWithoutHide:0.0];
}


- (void) scrollHidingViewWithDelta: (float) delta
{
    float newValueConstraint = delta+self.constraintPositionY.constant;
    self.constraintPositionY.constant = MAX(MIN(newValueConstraint, 0), minConstraintValue);
}


#pragma mark Scrollview

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    float delta = previousYOffset-scrollView.contentOffset.y;
    [self scrollHidingViewWithDelta:delta];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    dragging=YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

   if(dragging){
        
        float yCurrentOffset =  scrollView.contentOffset.y;
       
        if(yCurrentOffset>initialYContentOffset){
            
            float delta = previousYOffset-yCurrentOffset;
            [self scrollHidingViewWithDelta:delta];
        }
        previousYOffset = yCurrentOffset;
    }
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    dragging=NO;

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    previousYOffset=scrollView.contentOffset.y;
}


@end
