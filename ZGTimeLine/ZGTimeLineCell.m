//
//  ZGTimeLineCell.m
//  ZGTimeLine
//
//  Created by offcn_zcz32036 on 2018/5/15.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ZGTimeLineCell.h"
#define DotViewCentX 20 //圆点中心 x坐标
#define verticalLineWidth 2//时间轴 线条 宽度
#define showLabTop 10//cell间距
#define showLabWidth (320-DotViewCentX-20)
#define showLabFont [UIFont systemFontOfSize:15]
static const int dotCornerRadius=5;
@implementation ZGTimeLineCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self bulidSubViews];
    }
    return self;
}
-(void)bulidSubViews
{
    UIView *dotView=[UIView new];
    dotView.layer.cornerRadius=dotCornerRadius;
    dotView.backgroundColor=[UIColor orangeColor];
    [self addSubview:dotView];
    [dotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_top).offset(23);
        make.centerX.mas_equalTo(self.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(dotCornerRadius*2, dotCornerRadius*2));
    }];
    self.dotView=dotView;
    UIView *lineTopView=[UIView new];
    lineTopView.backgroundColor=[UIColor grayColor];
    [self addSubview:lineTopView];
    [lineTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.equalTo(dotView.mas_top).offset(0);
        make.centerX.equalTo(dotView);
        make.width.mas_equalTo(1);
    }];
    self.lineTopView=lineTopView;
    UIView *lineBottomView=[UIView new];
    lineBottomView.backgroundColor=[UIColor grayColor];
    [self addSubview:lineBottomView];
    [lineBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.top.equalTo(dotView.mas_bottom).offset(0);
        make.centerX.equalTo(dotView);
        make.width.mas_equalTo(1);
    }];
    self.lineBottomView=lineBottomView;
    UIButton *showLbBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *img=[UIImage imageNamed:@"AttenceTimelineCellMessage2"];
    img=[img stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    [showLbBtn setBackgroundImage:img forState:UIControlStateNormal];
    showLbBtn.titleLabel.font=showLabFont;
    showLbBtn.titleLabel.numberOfLines = 20;
    showLbBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    showLbBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    showLbBtn.titleEdgeInsets = UIEdgeInsetsMake(5, 15, 5, 5);
    [self addSubview:showLbBtn];
    self.showLbBtn=showLbBtn;
    [showLbBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.equalTo(dotView.mas_right);
        make.right.offset(-30);
    }];

}
+(float)cellHeightWithString:(NSString *)str isContentHeight:(BOOL)b
{
    float cellheight=[str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-40, 0) options:NSStringDrawingUsesLineFragmentOrigin |
                  NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:showLabFont} context:nil].size.height;
     return (b ? cellheight : (cellheight + showLabTop * 2)) + 15;
}
-(void)setDataSource:(NSString *)content isFirst:(BOOL)isFirst isLast:(BOOL)isLast
{
    CGFloat height=[ZGTimeLineCell cellHeightWithString:content isContentHeight:YES];
    [self.showLbBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.equalTo(self.dotView.mas_right);
        make.right.offset(-30);
        make.height.mas_equalTo(height);
    }];
    [self.showLbBtn setTitle:content forState:UIControlStateNormal];
    self.lineTopView.hidden=isFirst;
    self.lineBottomView.hidden=isLast;
    self.dotView.backgroundColor=isFirst?[UIColor orangeColor]:[UIColor grayColor];
    UIImage *img = [UIImage imageNamed:isFirst ? @"AttenceTimelineCellMessage" : @"AttenceTimelineCellMessage2"];
    img = [img stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    [self.showLbBtn setBackgroundImage:img forState:UIControlStateNormal];
}
@end
