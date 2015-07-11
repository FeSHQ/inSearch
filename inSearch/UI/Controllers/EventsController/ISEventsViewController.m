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
#import "ISNewEventViewController.h"
#import "ISSearchViewController.h"
#import "ISEventCell.h"


static NSString *const kISNewEventViewController  = @"ISNewEventViewController";

@interface ISEventsViewController()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *events;

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *searchResults;

@end

@implementation ISEventsViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    ISLog(@"ISEventsViewControllerDidLoad");
    
    self.navigationItem.title = @"События";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                  initWithImage:[UIImage imageNamed:@"plus.png"] style:UIBarButtonItemStylePlain
                                  target:self
                                  action:@selector(actionAddEvent:)];
    
    [self.navigationItem setRightBarButtonItem:addButton];
    
    
    
    self.events = @[@"Прогулка в парке", @"Хочу в кино", @"Театр, есть 2 билета.", @"Пробежка утром"];
    
    UINavigationController *searchResultsController = [mainStoryboard() instantiateViewControllerWithIdentifier:@"TableSearchResultsNavController"];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsController];
    
    __weak id weakSelf = self;
    
    self.searchController.searchResultsUpdater = weakSelf;
    
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.searchController.searchBar.delegate = self;
    self.definesPresentationContext = YES;
    
    
}

- (void)dealloc {
    
    ISLog(@"ISEventsViewController dealloc");
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

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.events count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ISEventCell";
    
    ISEventCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.eventNameLabel.text = [self.events objectAtIndex:indexPath.row];
    cell.userImageView.image = [UIImage imageNamed:@"contacts_100.png"];
    cell.likeImageView.image = [UIImage imageNamed:@"star_gold_50.png"];
    cell.likeCountLabel.text = [NSString stringWithFormat:@"%li",(long)arc4random_uniform(10)];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UISearchResultsUpdating

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSString *searchString = [self.searchController.searchBar text];
    
    
    [self updateFilteredContentWithString:searchString];
    
    if (self.searchController.searchResultsController) {
        UINavigationController *navController = (UINavigationController *)self.searchController.searchResultsController;
        
        ISSearchViewController *vc = (ISSearchViewController *)navController.topViewController;
        vc.searchResults = self.searchResults;
        [vc.tableView reloadData];
    }
    
}

#pragma mark - UISearchBarDelegate

// Workaround for bug: -updateSearchResultsForSearchController: is not called when scope buttons change
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    [self updateSearchResultsForSearchController:self.searchController];
}


#pragma mark - Content Filtering

- (void)updateFilteredContentWithString:(NSString *)searchString {
    
        if (searchString == nil || [searchString length] == 0) {
            self.searchResults = [self.events mutableCopy];
            return;
        }
    
    [self.searchResults removeAllObjects]; // First clear the filtered array.
    
    for (NSString *product in self.events) {
            NSUInteger searchOptions = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch;
            NSRange productNameRange = NSMakeRange(0, product.length);
            NSRange foundRange = [product rangeOfString:searchString options:searchOptions range:productNameRange];
            if (foundRange.length > 0) {
                [self.searchResults addObject:product];
            }
    }
}



#pragma mark - Actions

- (void)actionAddEvent:(UIBarButtonItem *)sender {
    
    ISLog(@"actionAddEvent");
    
    UIStoryboard *mainStoryboard = mainStoryboard();
    ISNewEventViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:kISNewEventViewController];
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
    
}

@end
