//
//  ISLeftMenuCell.h
//  inSearch
//
//  Created by Sergey Lyubeznov on 10/07/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ISLeftMenuCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
