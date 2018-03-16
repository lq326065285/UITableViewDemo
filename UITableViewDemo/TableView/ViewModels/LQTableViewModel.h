//
//  SYHTableViewModel.h
//  BusinessCollection
//
//  Created by 生意汇 on 2018/1/16.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQTableModel.h"
@interface LQTableViewModel : NSObject
/** 可能是一维数组，也可能是二维数组 */
@property (nonatomic,strong) NSMutableArray * dataArr;

/**
 注册过的cell
 */
@property (nonatomic,strong) NSMutableDictionary * regCellDict;
@end
