//
//  ZGTimeLineCell.h
//  ZGTimeLine
//
//  Created by offcn_zcz32036 on 2018/5/15.
//  Copyright © 2018年 cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGTimeLineCell : UITableViewCell
@property(nonatomic,strong)UIView*lineTopView;
@property(nonatomic,strong)UIView*dotView;
@property(nonatomic,strong)UIView*lineBottomView;
@property(nonatomic,strong)UIButton*showLbBtn;
+(float)cellHeightWithString:(NSString*)str isContentHeight:(BOOL)b;
-(void)setDataSource:(NSString*)content isFirst:(BOOL)isFirst isLast:(BOOL)isLast;
@end
