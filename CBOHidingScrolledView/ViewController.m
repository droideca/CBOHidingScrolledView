//
//  ViewController.m
//  CBOHidingScrolledView
//
//  Created by Carolina Barreiro Cancela on 17/1/15.
//  Copyright (c) 2015 Carolina Barreiro Cancela. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) CBHidingScrolledView *tableController;
@property (strong, nonatomic) NSArray *tableData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableData = [NSArray arrayWithObjects:@"A Christmas Carol", @"Night Terrors",@"The Doctor's Wife",@"The Impossible Astronaut",@"Day of the Moon",@"The Rebel Flesh",@"The Almost People",@"A Good Man Goes to War",@"The Curse of the Black Spot",@"The God Complex",@"The Girl Who Waited",@"Closing Time",@"The Wedding of River Song",@"Let's Kill Hitler",@"The Doctor, the Widow and the Wardrobe",@"Dinosaurs on a Spaceship",@"A Town Called Mercy",@"Asylum of the Daleks",@"The Angels Take Manhattan",@"The Power of Three",@"Hide",@"Cold War",@"The Crimson Horror",@"The Snowmen",@"Journey to the Centre of the TARDIS",@"The Bells of Saint John",@"The Rings of Akhaten",@"Nightmare in Silver",@"The Name of the Doctor", nil];
    
    self.tableController = [[CBHidingScrolledView alloc] initWithHidingView:self.hidingView constraint:self.hidingViewPositionY];
    self.tableView.delegate = self.tableController;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark Table view methods.

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    return cell;
}


@end

