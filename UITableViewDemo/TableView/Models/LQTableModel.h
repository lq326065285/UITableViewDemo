//
//  LQTableViewModel.h
//  BusinessCollection
//
//  Created by 生意汇 on 2018/1/16.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import <UIKit/UIKit.h>

/*cell界面上的model*/
@interface LQTableDataModel : NSObject

/** name */
@property (nonatomic,assign) CGFloat cellHeight;

@end


//config的model
@interface LQTableConfigModel : NSObject
+(instancetype)getConfigModelWithCellName:(NSString *)cellName isXib:(BOOL)isXib;

/** cell的名字 */
@property (nonatomic,strong,readonly) NSString * cellName;

/**
 YES=xib
 NO=代码
 */
@property (nonatomic,assign,readonly) BOOL isXib;

@end


//config和data的数据集合
@interface LQTableModel : NSObject

+(instancetype)getTableModelWithDataModel:(LQTableDataModel *)dataModel isXib:(BOOL)isXib cellName:(NSString *)cellName;

/** tableView包含的cell */
@property (nonatomic,strong) LQTableDataModel * dataModel;

/** 配置文件 */
@property (nonatomic,strong) LQTableConfigModel * configModel;

@end
