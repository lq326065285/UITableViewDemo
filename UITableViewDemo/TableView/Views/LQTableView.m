//
//  LQTableView.m
//  BusinessCollection
//
//  Created by 生意汇 on 2018/1/16.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import "LQTableView.h"
#import "LQCell.h"
@interface LQTableView()

@end

@implementation LQTableView

#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.viewModel.dataArr.count == 0) {
        return 0;
    }
    id object = self.viewModel.dataArr.firstObject;
    if ([object isKindOfClass:[NSArray class]]) {//二维数组
        return [(NSArray *)self.viewModel.dataArr[section] count];
    }else if([object isKindOfClass:[LQTableModel class]]){//一维数组
        return self.viewModel.dataArr.count;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.viewModel.dataArr.count == 0) {
        return 0;
    }
    id object = self.viewModel.dataArr.firstObject;
    if ([object isKindOfClass:[NSArray class]]) {//二维数组
        return self.viewModel.dataArr.count;
    }
    return 1;//一维数组
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LQTableModel * model = [self getModelWithIndexPath:indexPath];
    LQCell* cell = (LQCell *)[tableView dequeueReusableCellWithIdentifier:model.configModel.cellName];
    if ([cell respondsToSelector:@selector(setModel:)]) {//如果是注册的默认cell就不会调用这个方法
        [cell setModel:model.dataModel];
    }
    return cell;
}

//获得model 可能是二维数组，可能是一维数组
-(LQTableModel *)getModelWithIndexPath:(NSIndexPath *)indexPath{
    id object = self.viewModel.dataArr.firstObject;//如果数组为空的话肯定不会来这儿，来了这儿数组肯定不为空了
    LQTableModel * model = nil;
    if ([object isKindOfClass:[NSArray class]]) {//二维数组
        model = self.viewModel.dataArr[indexPath.section][indexPath.row];
    }else if([object isKindOfClass:[LQTableModel class]]){//一维数组
        model = self.viewModel.dataArr[indexPath.row];
    }
    return model;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LQTableModel * model = [self getModelWithIndexPath:indexPath];
    if(model.dataModel.cellHeight == 0){//如果==0 就去计算
        LQCell* cell = (LQCell *)[tableView dequeueReusableCellWithIdentifier:model.configModel.cellName];
        if ([cell respondsToSelector:@selector(setModel:)]) {//如果是注册的默认cell就不会调用这个方法
            [cell setModel:model.dataModel];
        }
    }
    return model.dataModel.cellHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .000001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return .000001;
}

@end
