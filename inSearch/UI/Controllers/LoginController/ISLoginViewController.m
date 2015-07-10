//
//  ViewController.m
//  inSearch
//
//  Created by Sergey Lyubeznov on 10/07/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "ISUtils.h"

#import "ISLoginViewController.h"
#import "ISEventsViewController.h"

static NSString *const kVKAPI_KEY = @"4990681";
static NSString *const TOKEN_KEY = @"my_application_access_token";
static NSString *const kISEventsViewController  = @"ISEventsViewController";
static NSArray  * SCOPE = nil;


@interface ISLoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *activityIndicatorView;



- (IBAction)actionLogin:(UIButton *)sender;

@end

@implementation ISLoginViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCOPE = @[VK_PER_FRIENDS, VK_PER_WALL, VK_PER_AUDIO, VK_PER_PHOTOS, VK_PER_NOHTTPS, VK_PER_EMAIL, VK_PER_MESSAGES];
    
    [VKSdk initializeWithDelegate:self andAppId:kVKAPI_KEY];
    
    self.navigationItem.title = @"Login";
    [VKSdk wakeUpSession];
    if ([VKSdk isLoggedIn]) {
        self.login = YES;
        [self pushViewController];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    if (self.login) {
        self.activityIndicatorView.hidden = NO;
    }else {
        self.activityIndicatorView .hidden = YES;
        
    }
}

#pragma mark - VKSdkDelegate
- (void)vkSdkRenewedToken:(VKAccessToken *)newToken {
    
    ISLog(@"vkSdkRenewedToken");
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
    VKCaptchaViewController *vc = [VKCaptchaViewController captchaControllerWithError:captchaError];
    [vc presentIn:self.navigationController.topViewController];
}


- (void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken {
    [self actionLogin:nil];
}


- (void)vkSdkUserDeniedAccess:(VKError *)authorizationError {
    ISLog(@"access denied");
    self.activityIndicatorView.hidden = YES;
}


- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
    
    [self.navigationController.topViewController presentViewController:controller animated:YES completion:nil];
}

- (void)vkSdkDidDismissViewController:(UIViewController *)controller {
    
    ISLog(@"avkSdkDidDismissViewController");
}


- (void)vkSdkReceivedNewToken:(VKAccessToken *)newToken {
    NSString *userID = [[VKSdk getAccessToken] userId];
    ISLog(@"%@",userID);
    [self pushViewController];
}

#pragma mark - Actions

- (IBAction)actionLogin:(UIButton *)sender {
    if (![VKSdk isLoggedIn]) {
        self.login = YES;
        self.activityIndicatorView.hidden = NO;
        [VKSdk authorize:SCOPE revokeAccess:YES];
    }
}

#pragma Private Methods

- (void)pushViewController {
    UIStoryboard *main = mainStoryboard();
    ISEventsViewController *vc = [main instantiateViewControllerWithIdentifier:kISEventsViewController];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
