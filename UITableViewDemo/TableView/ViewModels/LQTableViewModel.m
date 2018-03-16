//
//  SYHTableViewModel.m
//  BusinessCollection
//
//  Created by 生意汇 on 2018/1/16.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import "LQTableViewModel.h"

@implementation LQTableViewModel

#pragma mark - getter setter

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}

-(NSMutableDictionary *)regCellDict{
    if (!_regCellDict) {
        _regCellDict = [[NSMutableDictionary alloc] init];
    }
    return _regCellDict;
}

@end
