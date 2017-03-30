//
//  ListTableViewCell.m
//  Player
//
//  Created by lgq on 2017/3/29.
//  Copyright © 2017年 liukun. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)updateUI:(NSDictionary*)param
{
    self.myTitle.text = [param objectForKey:@"filename"];
}
@end
