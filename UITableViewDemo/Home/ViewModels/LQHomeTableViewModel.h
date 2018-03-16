//
//  ViewModel.h
//  UITableViewDemo
//
//  Created by 生意汇 on 2018/1/17.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import "LQTableViewModel.h"

@interface LQHomeTableViewModel : LQTableViewModel

//模拟网络请求
-(void)requestData:(void(^)(id obj))block;

@end
