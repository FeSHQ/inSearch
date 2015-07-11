//
//  ISNewEventViewController.m
//  inSearch
//
//  Created by Sergey Lyubeznov on 11/07/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "ISNewEventViewController.h"
#import "ISUtils.h"

@interface ISNewEventViewController()

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

- (IBAction)actionDone:(id)sender;
- (IBAction)actionCancel:(id)sender;

@end

@implementation ISNewEventViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ISLog(@"ISNewEventViewControllerDidLoad");
    
}

#pragma mark - Actions

- (void)actionDone:(UIButton *)sender {
    ISLog(@"actionDone");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)actionCancel:(UIButton *)sender {
    ISLog(@"actionCancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
