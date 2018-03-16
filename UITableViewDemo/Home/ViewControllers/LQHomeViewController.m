//
//  ViewController.m
//  UITableViewDemo
//
//  Created by 生意汇 on 2018/1/16.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import "LQHomeViewController.h"
#import "LQHomeTableView.h"
@interface LQHomeViewController ()
@property (nonatomic,strong) LQHomeTableView * tableView;
@end

@implementation LQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

-(LQHomeTableView *)tableView{
    if (!_tableView) {
        _tableView = [[LQHomeTableView alloc] initWithFrame:CGRectMake(0, NAV_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAV_BAR_HEIGHT) style:(UITableViewStyleGrouped)];
//        _tableView = [[LQHomeTableView alloc] initWithFrame:CGRectMake(0, NAV_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _tableView;
}

@end
