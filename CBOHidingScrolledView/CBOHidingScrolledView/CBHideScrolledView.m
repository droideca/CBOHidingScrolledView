//
//  CBHideScrolledView.m
//  HidingView
//
//  Created by Carolina Barreiro Cancela on 11/1/15.
//  Copyright (c) 2015 Carolina Barreiro Cancela. All rights reserved.
//

#import "CBHideScrolledView.h"

@implementation CBHideScrolledView

bool dragging;
float initialYContentOffset;
float previousYOffset;


- (id) init
{
    if (self = [super init])
    {
        self.minHeightWithoutHide = 0.0;
    }
    return self;
}

- (void) scrollHidingViewToY: (float) y
{
    float toolbarInitialY = -self.hidingView.frame.size.height+[self minHeightWithoutHide];
    self.constraintPositionY.constant = MAX(MIN(y, 0), toolbarInitialY);
    
}


#pragma mark Scrollview

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    float delta = previousYOffset-scrollView.contentOffset.y;
    [self scrollHidingViewToY:delta];
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
            [self scrollHidingViewToY:self.hidingView.frame.origin.y + delta];
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
