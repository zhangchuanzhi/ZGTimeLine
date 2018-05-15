//
//  ViewController.m
//  ZGTimeLine
//
//  Created by offcn_zcz32036 on 2018/5/15.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ViewController.h"
#import "ZGTimeLineCell.h"
#define TableViewCellID @"TableViewCellID"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*tabView;
@end

@implementation ViewController
#define dataSourceArr @[@"06-13 16:31\n提交至店长 shopmanagerA, 确认完毕", @"06-13 16:31\n上班考勤 提交成功上班考勤 提交成功上班考勤 提交成功上班考勤 提交成功上班考勤 提交成功上班考勤 提交成功上班考勤 提交成功上班考勤 提交成功上班考勤 提交成功上班考勤 提交成功上班考勤 提交成功", @"06-13 16:31\n提交至店长 shopmanagerA, 确认完毕", @"06-13 16:31\n上班考勤 提交成功", @"06-13 16:31\n提交至店长 shopmanagerA, 确认完毕", @"06-13 16:31\n上班考勤 提交成功"]
- (void)viewDidLoad {
    [super viewDidLoad];
    _tabView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tabView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tabView.dataSource=self;
    _tabView.delegate=self;
    [self.view addSubview:_tabView];
    [_tabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    [_tabView registerClass:[ZGTimeLineCell class] forCellReuseIdentifier:TableViewCellID];
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSourceArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ZGTimeLineCell cellHeightWithString:dataSourceArr[dataSourceArr.count - 1 - indexPath.row] isContentHeight:NO];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZGTimeLineCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellID];

    bool isFirst = indexPath.row == 0;
    bool isLast = indexPath.row == dataSourceArr.count - 1;
    [cell setDataSource:dataSourceArr[dataSourceArr.count - 1 - indexPath.row] isFirst:isFirst isLast:isLast];
    return cell;
}

@end
