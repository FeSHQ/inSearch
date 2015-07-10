//
//  ISEventsViewController.m
//  inSearch
//
//  Created by Sergey Lyubeznov on 10/07/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "ISEventsViewController.h"
#import "ISLoginViewController.h"
#import "ISUtils.h"
#import <VKSdk/VKSdk.h>
@interface ISEventsViewController()

@end

@implementation ISEventsViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    ISLog(@"ISEventsViewControllerDidLoad");
    
    self.navigationItem.title = @"События";
    
    
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}

#pragma mark - Actions

- (void)actionExit:(UIBarButtonItem *)sender {
    
    [VKSdk forceLogout];
    ISLoginViewController *vc = (ISLoginViewController*)[self.navigationController.viewControllers objectAtIndex:0];
    vc.login = NO;
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}



@end
