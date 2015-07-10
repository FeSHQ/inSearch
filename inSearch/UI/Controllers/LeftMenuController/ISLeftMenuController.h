//
//  ISLeftMenuController.h
//  inSearch
//
//  Created by Sergey Lyubeznov on 10/07/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@interface ISLeftMenuController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;

@end
