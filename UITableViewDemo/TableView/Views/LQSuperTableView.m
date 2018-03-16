//
//  LQSuperTableView.m
//  BusinessCollection
//
//  Created by 生意汇 on 2018/1/16.
//  Copyright © 2018年 ~~浅笑. All rights reserved.
//

#import "LQSuperTableView.h"

@interface LQSuperTableView()
@property (nonatomic,assign) UITableViewStyle style;
@end

@implementation LQSuperTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame];
    if (self) {
        self.style = style;
        [self addSubview:self.tableView];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
#ifdef DEBUG
        //Debug状态就让你崩溃
        NSAssert(NO,@"兄弟你的初始化方法必须用- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style，不然我就崩溃了喔");
#else
        //发布状态就打印 😁😁😁 感觉我真的机智😎😎😎
        NSLog(@"兄弟你的初始化方法必须用- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style，不然我就崩溃了喔");
#endif
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
#ifdef DEBUG
        //Debug状态就让你崩溃
        NSAssert(NO,@"兄弟你的初始化方法必须用- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style，不然我就崩溃了喔");
#else
        //发布状态就打印 😁😁😁 感觉我真的机智😎😎😎
        NSLog(@"兄弟你的初始化方法必须用- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style，不然我就崩溃了喔");
#endif
    }
    return self;
}


-(BOOL)isNullOrEmpty:(NSString *)str
{
    str = [self toString:str];
    if ([str isEqual:[NSNull null]] || str==nil) {
        return YES;
    }
    else if(str.length==0)
    {
        return YES;
    }
    return NO;
}

-(NSString*)toString:(id)object
{
    if (object && ![object isEqual:[NSNull null]] ) {
        NSString *str = [NSString stringWithFormat:@"%@", object];
        return str;
    }else{ return @""; }
}

-(void)reloadData{
    for (id object in self.viewModel.dataArr) {
        if ([object isKindOfClass:[NSArray class]]) {//如果是二维数组
            NSArray * arr = (NSArray *)object;
            for (LQTableModel * model in arr) {
                [self regCellWithModel:model];
            }
        }else if([object isKindOfClass:[LQTableModel class]]){//如果是一维数组
            [self regCellWithModel:object];
        }else{
#ifdef DEBUG
            //Debug状态就让你崩溃
            NSAssert(NO, @"哥，你的model类型不符合规范啊。我规定好了，这里model应该是LQTableModel的子类呀");
#else
            //发布状态就打印 😁😁😁 感觉我真的机智😎😎😎
            NSLog(@"哥，你的model类型不符合规范啊。我规定好了，这里model应该是LQTableModel的子类呀");
#endif
        }
    }
    [self.tableView reloadData];
}

-(void)regCellWithModel:(LQTableModel *) model{
    //如果已经注册了就不再注册了
    if ([self getRegStatusWithModel:model]) {
        return;
    }
    
    //如果cellName为空,就注册一个默认的cell
    if ([self isNullOrEmpty:model.configModel.cellName]) {
        [self regDefaultCellWithModel:model];
        return;
    }
    
    //如果是xib --> 注册cell
    if (model.configModel.isXib) {
        [self.tableView registerNib:[UINib nibWithNibName:model.configModel.cellName bundle:nil] forCellReuseIdentifier:model.configModel.cellName];
    }else{//如果不是xib-->注册cell
        Class cls = NSClassFromString(model.configModel.cellName);
        if(!cls){//如果这个cell不存在，注册一个默认cell
            [self regDefaultCellWithModel:model];
            return;
        }
        [self.tableView registerClass:cls forCellReuseIdentifier:model.configModel.cellName];
    }
    [self.viewModel.regCellDict setObject:model.configModel.cellName forKey:model.configModel.cellName ];
}

//判断cell是否已经注册过
-(BOOL)getRegStatusWithModel:(LQTableModel *) model{
    NSString * key = model.configModel.cellName;
    if ([self isNullOrEmpty:key]) {
        key = @"cell";
    }
    NSString * value = self.viewModel.regCellDict[key];
    if (![self isNullOrEmpty:value]) {
        return YES;
    }
    return NO;
}


////判断cell是否已经注册过
//-(RACSignal *)getRegStatusWithModel:(LQTableModel *) model{
//    RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        NSString * key = model.configModel.cellName;
//        if ([NSString isNullOrEmpty:key]) {
//            key = @"cell";
//        }
//        NSString * value = self.viewModel.regCellDict[key];
//        if (![NSString isNullOrEmpty:value]) {
//            [subscriber sendNext:@YES];
//        }
//        [subscriber sendNext:@NO] ;
//        return nil;
//    }];
//    return signal;
//}


//注册默认cell
-(void)regDefaultCellWithModel:(LQTableModel *) model{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.viewModel.regCellDict setObject:@"cell" forKey:@"cell"];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
//实现抽象代理函数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

#pragma mark - getter setter

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NAV_BAR_HEIGHT - 49 - BOTTOM_SAFE_AREA) style:self.style];
        _tableView.delegate = self;
        _tableView.dataSource= self;
        if([_tableView respondsToSelector:@selector(setSeparatorInset:)]){
            [_tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if([_tableView respondsToSelector:@selector(setLayoutMargins:)]){
            [_tableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return _tableView;
}

@end
