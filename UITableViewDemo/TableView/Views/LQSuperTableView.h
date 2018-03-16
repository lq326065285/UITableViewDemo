//
//  LQSuperTableView.h
//  BusinessCollection
//
//  Created by 生意汇 on 2018/1/16.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQTableModel.h"
#import "LQTableViewModel.h"
#import "LQTableViewProtocol.h"

//状态栏height
#define STATUS_BAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏的高度
#define NAV_BAR_HEIGHT (STATUS_BAR_HEIGHT + 44)
//底部安全区域的大小
#define BOTTOM_SAFE_AREA (STATUS_BAR_HEIGHT > 20 ? 34 : 0)
#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)


@interface LQSuperTableView : UIView<LQTableViewProtocol,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) LQTableViewModel * viewModel;
@end
