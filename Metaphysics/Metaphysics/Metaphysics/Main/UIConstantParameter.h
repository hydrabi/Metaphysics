//
//  UIConstantParameter.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/30.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#ifndef UIConstantParameter_h
#define UIConstantParameter_h
//1366 1024
static const CGFloat screenWidth = 1366.0f;
static const CGFloat screenHeight = 1024.0f;
static NSString *const iconFontName = @"17icon";

static const CGFloat offset_16 = 16.0f;
static const CGFloat contentViewOffset = 10.0f;
static const CGFloat textViewTitleHeight = 40.0f;

static const CGFloat topViewHeight = 110.0f;

//左边菜单
static const CGFloat leftSideTableViewWidth = 125.0f;
static const NSString *leftSideTableViewWidth_key = @"leftSideTableViewWidth_key";
static const NSString *leftVerLineOffset_key = @"leftVerLineOffset_key";
static const CGFloat leftVerLineWidth = 1.0f;
static const CGFloat leftVerLineOffset = 10.0f;
static const CGFloat rightContentWidth = screenWidth - leftSideTableViewWidth - leftVerLineOffset-2*leftVerLineWidth;//1229

//中间年月日时柱
static const CGFloat middleViewHeight = 220.0f;
static const CGFloat middleSubViewHeight = 160.0f;
static const CGFloat middleMainButtonWidthAndheight = 90.0f;
static const CGFloat middleViewOffset = (rightContentWidth - middleMainButtonWidthAndheight - 4*210)/5;//56.0f
static const NSString *middleSubViewHeight_key = @"middleSubViewHeight_key";

//日期
static const CGFloat dateLabelHeight = 25.0f;//日期标签占用30高度

//底部整体
static const CGFloat bottomTextViewHeight = topViewHeight;
static const CGFloat bottomViewHeight = screenHeight - topViewHeight - contentViewOffset - middleViewHeight - contentViewOffset - bottomTextViewHeight - dateLabelHeight - contentViewOffset;
static const CGFloat scrollViewWidth = rightContentWidth;
static const CGFloat scrollViewHeight = bottomViewHeight;

//底部所有tableView的数据
static const CGFloat tableViewWidth = 105.0f;
static const CGFloat tableViewFirstVerOffset = 16.0f;
static const CGFloat tableViewOffset = 48.0f;
static const CGFloat tableViewMiddleOffset = 10.0f;
static const NSInteger tableViewCount = 15;
static const CGFloat tableViewHeaderHeight = 130.0f;
static const CGFloat tableViewCellHeight = (bottomViewHeight - tableViewHeaderHeight - tableViewMiddleOffset)/10;

//大运
static const CGFloat daYunTextViewHeight = bottomViewHeight - tableViewHeaderHeight + bottomTextViewHeight;
static const NSInteger daYunTableViewCount = 10;
static const CGFloat daYunTableCellHeight = (daYunTextViewHeight-textViewTitleHeight) / daYunTableViewCount;
static const CGFloat daYunTableViewWidth = 123.0f;

//十五运
static const CGFloat daYunSubTableViewWidth = 164.0f;
static const CGFloat daYunSubTextViewHeight = daYunTextViewHeight;
static const NSInteger daYunSubTableViewCount = 10;
static const CGFloat daYunSubTableViewMiddleOffset = 10.0f;
static const CGFloat daYunSubTitleViewHeight = 70.0f;
static const CGFloat daYunSubTableCellHeight = (daYunSubTextViewHeight-daYunSubTitleViewHeight - daYunSubTableViewMiddleOffset) / daYunSubTableViewCount;

//另外13个textView
static const CGFloat normalTextViewHeight = daYunTextViewHeight;

#pragma mark - 字体
static const CGFloat titleFontSize_90 =  90.0f;
static const CGFloat titleFontSize_50 =  50.0f;
static const CGFloat titleFontSize_30 =  30.0f;
static const CGFloat titleFontSize_28 =  28.0f;
static const CGFloat titleFontSize_24 =  24.0f;
static const CGFloat titleFontSize_20 =  20.0f;
static const CGFloat titleFontSize_16 =  16.0f;
#endif /* UIConstantParameter_h */
