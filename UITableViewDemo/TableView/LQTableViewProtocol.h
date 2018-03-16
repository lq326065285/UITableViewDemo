//
//  LQTableViewProtocol.h
//  BusinessCollection
//
//  Created by 生意汇 on 2018/1/16.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol LQTableViewProtocol <NSObject>
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
-(void)reloadData;
@end
