//
//  LQTableViewModel.m
//  BusinessCollection
//
//  Created by 生意汇 on 2018/1/16.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import "LQTableModel.h"

@implementation LQTableConfigModel
+(instancetype)getConfigModelWithCellName:(NSString *)cellName isXib:(BOOL)isXib{
    LQTableConfigModel * model = [[LQTableConfigModel alloc] init];
    [model setConfigModelWithCellName:cellName isXib:isXib];
    return model;
}

-(void)setConfigModelWithCellName:(NSString *)cellName isXib:(BOOL)isXib{
    _isXib = isXib;
    _cellName = cellName;
}

@end



@implementation LQTableDataModel

@end


@implementation LQTableModel
+(instancetype)getTableModelWithDataModel:(LQTableDataModel *)dataModel isXib:(BOOL)isXib cellName:(NSString *)cellName{
    LQTableModel * model = [[LQTableModel alloc] init];
    model.configModel = [LQTableConfigModel getConfigModelWithCellName:cellName isXib:isXib];
    model.dataModel = dataModel;
    return model;
}
@end
