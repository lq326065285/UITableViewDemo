//
//  LQHomeCell2.m
//  UITableViewDemo
//
//  Created by 生意汇 on 2018/1/17.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import "LQHomeCell2.h"
#import "LQHomeModel1.h"
@interface LQHomeCell2()
@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@end

@implementation LQHomeCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(LQHomeModel1 *)model{
    self.nameLab.text = model.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
