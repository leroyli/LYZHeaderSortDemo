//
//  HeadSortView.h
//  Car_Hi
//
//  Created by aaa on 16/7/12.
//  Copyright © 2016年 com.Risk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeadSortView;

@protocol HeadSortViewDelegate <NSObject>

@optional

/** 点击按钮回调 */
- (void)headSortView:(HeadSortView *)sortView didSelectItemAtIndex:(NSInteger)index;

@end

@interface HeadSortView : UIView

@property (nonatomic, weak  ) id<HeadSortViewDelegate> delegate;
@property (nonatomic, strong) NSArray              *titlesArray;
@property (nonatomic, assign) NSInteger            selectedIndex;

/**
 *  HeadSortView
 *
 *  @param frame         坐标和大小
 *  @param delegate      代理
 *  @param titlesArray   标题数组
 *  @param selectedIndex 默认选中
 *
 *  @return HeadSortView
 */
- (instancetype)initWithFrame:(CGRect)frame
                     Delegate:(id<HeadSortViewDelegate>)delegate
                  TitlesArray:(NSArray *)titlesArray
                SelectedIndex:(NSInteger)selectedIndex;


@end
