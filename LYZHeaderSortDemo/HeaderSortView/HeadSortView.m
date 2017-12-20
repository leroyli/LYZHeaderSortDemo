//
//  HeadSortView.m
//  Car_Hi
//
//  Created by aaa on 16/7/12.
//  Copyright © 2016年 com.Risk. All rights reserved.
//

#import "HeadSortView.h"
#import "Masonry.h"


//RGB 宏定义
#define RGBAcolor(r,g,b,a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]
//主字体   Heiti SC
#define MAIN_FONT_HEITI(s) [UIFont fontWithName:@"Heiti SC" size:s]
#define MAIN_BLUECOLOR RGBA_COLOR(31, 189, 202, 1)
#define MAIN_TEXTBLACKCOLOR RGBA_COLOR(80, 80, 80, 1)

@interface HeadSortView ()
{
    CGFloat _buttonWidth;
}

@property (nonatomic, strong) UIView *bottomView;

@end

static CGFloat bottomViewHeight      = 2.0;

@implementation HeadSortView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
                     Delegate:(id<HeadSortViewDelegate>)delegate
                  TitlesArray:(NSArray *)titlesArray
                SelectedIndex:(NSInteger)selectedIndex {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.delegate        = delegate;
        self.titlesArray     = titlesArray;
        self.selectedIndex   = selectedIndex;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self setupViews];
}

#pragma mark - configSubViews
- (void)setupViews {
    if (self.titlesArray.count == 0) {return;}
    
    _buttonWidth = self.bounds.size.width/self.titlesArray.count;
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 0.5, self.bounds.size.width, 0.5)];
    lineView.backgroundColor = RGBAcolor(227, 228, 229, 1);
    [self addSubview:lineView];
    
    [self.titlesArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        UIButton *button          = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame              = CGRectMake(idx * _buttonWidth, 0, _buttonWidth, self.bounds.size.height - bottomViewHeight);
        [button setTitle:self.titlesArray[idx] forState:UIControlStateNormal];
        button.backgroundColor    = RGBAcolor(255, 255, 255, 1);
        button.titleLabel.font    = MAIN_FONT_HEITI(15);
        
        if (self.selectedIndex == idx) {
            
            [button setTitleColor:MAIN_BLUECOLOR forState:UIControlStateNormal];
            self.bottomView.frame = CGRectMake(idx * _buttonWidth, self.bounds.size.height - bottomViewHeight, _buttonWidth, bottomViewHeight);
            [self addSubview:_bottomView];
            
        } else {
            
            [button setTitleColor:MAIN_TEXTBLACKCOLOR forState:UIControlStateNormal];
            
        }
        
        button.tag = idx;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }];
}

#pragma mark - buttonAction
- (void)buttonAction:(UIButton *)sender {
    self.selectedIndex = sender.tag;
    [self reloadWithIndex:self.selectedIndex];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(headSortView:didSelectItemAtIndex:)]) {
        [self.delegate headSortView:self didSelectItemAtIndex:self.selectedIndex];
    }
}

#pragma mark - reload
- (void)reloadWithIndex:(NSInteger)index {
    for (UIButton *v in self.subviews) {
        if (v) {
            if ([v isKindOfClass:[UIButton class]]) {
                if (v.tag == self.selectedIndex) {
                    [v setTitleColor:MAIN_BLUECOLOR forState:UIControlStateNormal];
                    self.bottomView.frame = CGRectMake(self.selectedIndex * _buttonWidth, self.bounds.size.height - bottomViewHeight, _buttonWidth, bottomViewHeight);
                } else {
                    [v setTitleColor:MAIN_TEXTBLACKCOLOR forState:UIControlStateNormal];
                }
            }
        }
    }
}

#pragma mark - layoutSubviews
- (void)layoutSubviews {
    [super layoutSubviews];
    for(UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
    [self setupViews];
}

#pragma mark - getter
- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = MAIN_BLUECOLOR;
        
    }
    return _bottomView;
}




@end
