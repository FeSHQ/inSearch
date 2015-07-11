//
//  ISSettingsViewController.m
//  inSearch
//
//  Created by Sergey Lyubeznov on 11/07/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "ISSettingsViewController.h"
#import "ISUtils.h"

@implementation ISSettingsViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    ISLog(@"ISSettingsViewController");
    
    self.navigationItem.title = @"Настройки";
    
    
}

- (void)dealloc {
    
   ISLog(@"ISSettingsViewController dealloc");
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

