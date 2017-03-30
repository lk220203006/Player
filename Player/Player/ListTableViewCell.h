//
//  ListTableViewCell.h
//  Player
//
//  Created by lgq on 2017/3/29.
//  Copyright © 2017年 liukun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *myTitle;
@property (weak, nonatomic) IBOutlet UILabel *myTime;

- (void)updateUI:(NSDictionary*)param;

@end
