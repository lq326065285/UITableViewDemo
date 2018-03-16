//
//  LQHomeCell3.m
//  UITableViewDemo
//
//  Created by 生意汇 on 2018/1/17.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import "LQHomeCell3.h"
#import "LQHomeModel1.h"
@implementation LQHomeCell3

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(LQHomeModel1 *)model{
    self.textLabel.text = model.name;
    self.detailTextLabel.text = model.name;
}
@end
