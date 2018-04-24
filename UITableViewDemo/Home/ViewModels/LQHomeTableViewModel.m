//
//  ViewModel.m
//  UITableViewDemo
//
//  Created by 生意汇 on 2018/1/17.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import "LQHomeTableViewModel.h"
#import "LQHomeModel1.h"
@interface LQHomeTableViewModel()
@property (nonatomic,copy) void(^requestBlcok)(id obj) ;
@end

@implementation LQHomeTableViewModel


-(void)requestData:(void(^)(id obj))block{//
    self.requestBlcok = block;
    NSMutableArray * arr = [NSMutableArray array];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 0; i < 10; i++) {
            NSMutableArray * subArr = [NSMutableArray array];
            
            //多数组
            for(int j = 0; j < 4; j++){
                LQHomeModel1 * model = [[LQHomeModel1 alloc] init];
                model.name = [NSString stringWithFormat:@"person_%d_%d",i,j];
                model.job = [NSString stringWithFormat:@"job_%d_%d",i,j];
                [subArr addObject:model];
            }
            [arr addObject:subArr];
            
            
            //单数组
//            LQHomeModel1 * model = [[LQHomeModel1 alloc] init];
//            model.name = [NSString stringWithFormat:@"person_%d",i];
//            model.job = [NSString stringWithFormat:@"job_%d",i];
//            [arr addObject:model];
        }
        
        [self getTableViewDataWithData:arr];
    });
    
}

-(void)getTableViewDataWithData:(NSArray *)arr{
    for (int i = 0; i < arr.count; i++) {
        LQHomeModel1 * dataModel = arr[i];
        if ([dataModel isKindOfClass:[LQHomeModel1 class]]) {//一维数组
            LQTableModel * model = nil;
            if (i % 3 == 0) {
                model = [LQTableModel getTableModelWithDataModel:dataModel isXib:YES cellName:@"LQHomeCell1"];
            }else if(i % 3 == 2){
                model = [LQTableModel getTableModelWithDataModel:dataModel isXib:YES cellName:@"LQHomeCell2"];
            }else{
                model = [LQTableModel getTableModelWithDataModel:dataModel isXib:NO cellName:@"LQHomeCell3"];
            }
            [self.dataArr addObject:model];            
        }
        
        
        
        else if([dataModel isKindOfClass:[NSArray class]]){//二维数组，这里我只做个一维数组，所以先不考虑二维数组的情况
            NSArray * data = (NSArray *)dataModel;
            NSMutableArray * myData2 = [NSMutableArray array];
            for (int j = 0; j < data.count; j++) {
                LQTableModel * model = [LQTableModel getTableModelWithDataModel:data[j] isXib:YES cellName:@"LQHomeCell1"];
                [myData2 addObject:model];
            }
            [self.dataArr addObject:myData2];
        }
        
    }
    if (self.requestBlcok) {
        self.requestBlcok(nil);
    }
}

@end
