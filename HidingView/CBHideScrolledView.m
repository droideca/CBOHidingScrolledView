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

#pragma mark Scrollview


- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    float delta = previousYOffset-scrollView.contentOffset.y;
    [self moveHeaderToY:delta];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    dragging=YES;    NSLog(@"scrollViewDidEndDeceleratin: scroll final %f",self.constraintPositionY.constant);

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

   if(dragging){
        
        //Move toolbar
        float yCurrentOffset =  scrollView.contentOffset.y;
        
        //Avoid a wrong behaviour when scroll bounce to top
        if(yCurrentOffset>initialYContentOffset){
            
            float delta = previousYOffset-yCurrentOffset;
            [self moveHeaderToY:self.hidingView.frame.origin.y + delta];
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

- (void) moveHeaderToY: (float) y
{
    float toolbarInitialY = -self.hidingView.frame.size.height+[self minHeightWithoutHide];
    
    self.constraintPositionY.constant = MAX(MIN(y, 0), toolbarInitialY);

}

- (float) minHeightWithoutHide
{
    return 20;
}

@end
