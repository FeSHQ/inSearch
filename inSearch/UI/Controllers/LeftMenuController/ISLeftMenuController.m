//
//  ISLeftMenuController.m
//  inSearch
//
//  Created by Sergey Lyubeznov on 10/07/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "ISLeftMenuController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"

#import "ISLeftMenuCell.h"
#import "ISLoginViewController.h"
#import "ISUtils.h"

static NSString *const kISEventsViewController  = @"ISEventsViewController";
static NSString *const kISUserProfileViewConrtoller  = @"ISUserProfileViewConrtoller";
static NSString *const kISSettingsViewController  = @"ISSettingsViewController";


@interface ISLeftMenuController ()

@property (assign, nonatomic) BOOL exit;

@end


@implementation ISLeftMenuController



#pragma mark - Initializations

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.slideOutAnimationEnabled = YES;
    
    return [super initWithCoder:aDecoder];
}

#pragma mark - View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor lightGrayColor];
    
    //UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftMenu.jpg"]];
    //self.tableView.backgroundView = imageView;
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ISLeftMenuCell";
    
    ISLeftMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    
    switch (indexPath.row)
    {
        case 0:
            cell.titleLabel.text = @"Профиль";
            cell.picImageView.image = [UIImage imageNamed:@"home_50.png"];
            
            break;
            
        case 1:
            cell.titleLabel.text = @"События";
            cell.picImageView.image = [UIImage imageNamed:@"star_50.png"];
            break;
            
        case 2:
            cell.titleLabel.text = @"Настройки";
            cell.picImageView.image = [UIImage imageNamed:@"settings_50.png"];
            
            break;
            
        case 3:
            cell.titleLabel.text = @"Выход";
            cell.picImageView.image = [UIImage imageNamed:@"exit_50.png"];
            break;
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard * mainStoryboard = mainStoryboard();
    
    UIViewController *vc ;

    
    switch (indexPath.row)
    {
        case 0:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: kISUserProfileViewConrtoller];
            break;
        case 1:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:kISEventsViewController];
            break;
        case 2:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: kISSettingsViewController];
            break;
        case 3:
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
            [self showExitAlert];
            return;
            
            
    }

    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                     andCompletion:nil];
}


#pragma mark - Private Methods

- (void)showExitAlert {
    
    UIAlertController * view=   [UIAlertController
                                 alertControllerWithTitle:@""
                                 message:@"Вы точно хотите выйти?"
                                 preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Выйти"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             //Do some thing here
                            // ISLog(@"count viewControllers = %ld",[[SlideNavigationController sharedInstance].navigationController ]);
                             
                             NSArray *vcs = [SlideNavigationController sharedInstance].viewControllers;
                             
                             ISLoginViewController *vc = [vcs firstObject];
                             vc.login = NO;
                             [VKSdk forceLogout];
                             [[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
                             [view dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Отмена"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [view dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    
    [view addAction:ok];
    [view addAction:cancel];
    [self presentViewController:view animated:YES completion:nil];
    
    
}

@end