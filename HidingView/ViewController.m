//
//  ViewController.m
//  HidingView
//
//  Created by Carolina Barreiro Cancela on 27/12/14.
//  Copyright (c) 2014 Carolina Barreiro Cancela. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

bool dragging;
float initialYContentOffset;
float previousYOffset;
NSArray *tableData;

- (void)viewDidLoad {
    [super viewDidLoad];
    tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", @"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table view methods.

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
   
}


#pragma mark Scrollview

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    float delta = previousYOffset-scrollView.contentOffset.y;
    [self moveHeaderToY:delta];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    dragging=YES;
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
    
    self.hidingViewPositionY.constant = MAX(MIN(y, 0), toolbarInitialY);
    
    /*CGRect rect = self.hidingView.frame;
    rect.origin.y =MAX(MIN(y, 0), toolbarInitialY);
    [self.hidingView setFrame:rect];
    
    CGRect table = self.tableView.frame;
    table.origin.y = rect.origin.y + rect.size.height;
    [self.tableView setFrame:table];*/
    
}

- (void) moveHeaderFrameToY: (float) y
{
    float toolbarInitialY = -self.hidingView.frame.size.height+[self minHeightWithoutHide];
    
    CGRect rect = self.hidingView.frame;
    rect.origin.y =MAX(MIN(y, 0), toolbarInitialY);
    [self.hidingView setFrame:rect];
    
    CGRect table = self.tableView.frame;
    table.origin.y = rect.origin.y + rect.size.height;
    [self.tableView setFrame:table];
    
}

- (float) minHeightWithoutHide
{
    return 20;
}

@end
