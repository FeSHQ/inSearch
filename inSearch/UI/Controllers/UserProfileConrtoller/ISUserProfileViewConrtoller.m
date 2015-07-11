//
//  ISUserProfileViewConrtoller.m
//  inSearch
//
//  Created by Sergey Lyubeznov on 11/07/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "ISUserProfileViewConrtoller.h"
#import "ISUtils.h"

@interface ISUserProfileViewConrtoller()

@end

@implementation ISUserProfileViewConrtoller

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    ISLog(@"ISEventsViewControllerDidLoad");
    
    self.navigationItem.title = @"Профиль";
    
    
}

- (void)dealloc {
    
    ISLog(@"ISUserProfileViewConrtoller dealloc");
}

#pragma mark - SlideNavigationControllerDelegate

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}






@end
