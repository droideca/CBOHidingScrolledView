//
//  CBHideScrolledView.m
//  HidingView
//
//  Created by Carolina Barreiro Cancela on 11/1/15.
//  Copyright (c) 2015 Carolina Barreiro Cancela. All rights reserved.
//

#import "CBHideScrolledView.h"

@implementation CBHideScrolledView

bool isDragging;
float initialYContentOffset;
float previousYOffset;

- (void) moveScrolledViewToY: (float) y
{
    float toolbarInitialY = -self.hidingView.frame.size.height+[self minHeightWithoutHide];
    self.constraintPositionY.constant = MAX(MIN(y, 0), toolbarInitialY);
    
}

- (float) minHeightWithoutHide
{
    return 20;
}

#pragma mark Scrollview

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    float delta = previousYOffset-scrollView.contentOffset.y;
    [self moveScrolledViewToY:delta];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    isDragging=YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

   if(isDragging){
        
        float yCurrentOffset =  scrollView.contentOffset.y;
       
        if(yCurrentOffset>initialYContentOffset){
            
            float delta = previousYOffset-yCurrentOffset;
            [self moveScrolledViewToY:self.hidingView.frame.origin.y + delta];
        }
        previousYOffset = yCurrentOffset;
    }
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    isDragging=NO;

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    previousYOffset=scrollView.contentOffset.y;
}


@end
