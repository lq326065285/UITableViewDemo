//
//  SYHHomeTableView.m
//  UITableViewDemo
//
//  Created by 生意汇 on 2018/1/17.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import "LQHomeTableView.h"
#import "LQHomeTableViewModel.h"

@interface LQHomeTableView()

@end

@implementation LQHomeTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        LQHomeTableViewModel * viewModel = [[LQHomeTableViewModel alloc] init];
        __weak typeof(self) weakSelf = self;
        NSLog(@"加载中...");
        //请求数据刷新数组
        [viewModel requestData:^(id obj) {
            [weakSelf reloadData];
            NSLog(@"加载完毕");
        }];
        
        self.viewModel = viewModel;
    }
    return self;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


@end
