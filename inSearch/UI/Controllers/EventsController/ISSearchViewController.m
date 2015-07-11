//
//  ISSearchViewController.m
//  inSearch
//
//  Created by Sergey Lyubeznov on 11/07/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "ISSearchViewController.h"

@implementation ISSearchViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.searchResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SearchResultCell" forIndexPath:indexPath];
    
    
    cell.textLabel.text =[self.searchResults objectAtIndex:indexPath.row];
    
    return cell;
    
}

@end
