//
//  LQHomeCell1.m
//  UITableViewDemo
//
//  Created by 生意汇 on 2018/1/17.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import "LQHomeCell1.h"
#import "LQHomeModel1.h"
@interface LQHomeCell1()
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *jobLab;

@end

@implementation LQHomeCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(LQHomeModel1 *)model{
    self.nameLab.text = model.name;
    self.jobLab.text = model.job;
}
@end
