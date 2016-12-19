//
//  HeadSortView.m
//  Car_Hi
//
//  Created by aaa on 16/7/12.
//  Copyright © 2016年 com.Risk. All rights reserved.
//

#import "HeadSortView.h"


//RGB 宏定义
#define RGBAcolor(r,g,b,a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]
//主字体   Heiti SC
#define MAIN_FONT_HEITI(s) [UIFont fontWithName:@"Heiti SC" size:s]
#define MAIN_BLUECOLOR RGBA_COLOR(31, 189, 202, 1)
#define MAIN_TEXTBLACKCOLOR RGBA_COLOR(80, 80, 80, 1)

@interface HeadSortView ()

@end

static CGFloat bottomViewHeight      = 2.0;

@implementation HeadSortView


- (instancetype)initWithFrame:(CGRect)frame
                     Delegate:(id<HeadSortViewDelegate>)delegate
                  TitlesArray:(NSArray *)titlesArray
                SelectedIndex:(NSInteger)selectedIndex
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.delegate        = delegate;
        self.titlesArray     = titlesArray;
        self.selectedIndex   = selectedIndex;
    }
    
    return self;
    
}

- (void)drawRect:(CGRect)rect
{
    [self setupViews];
}

- (void)setupViews
{
    float buttonWidth = self.bounds.size.width/self.titlesArray.count;
    
    if (self.titlesArray.count == 0)
    {
        return;
    }
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 0.5, self.bounds.size.width, 0.5)];
    lineView.backgroundColor = RGBAcolor(227, 228, 229, 1);
    [self addSubview:lineView];
    
    [self.titlesArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        UIButton *button          = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame              = CGRectMake(idx * buttonWidth, 0, buttonWidth, self.bounds.size.height - bottomViewHeight);
        [button setTitle:self.titlesArray[idx] forState:UIControlStateNormal];
        button.backgroundColor    = RGBAcolor(255, 255, 255, 1);
        button.titleLabel.font    = MAIN_FONT_HEITI(15);
        
        if (self.selectedIndex == idx)
        {
            [button setTitleColor:MAIN_BLUECOLOR forState:UIControlStateNormal];

            UIView *bottomView         = [[UIView alloc] initWithFrame:CGRectMake(idx * buttonWidth, self.bounds.size.height - bottomViewHeight, buttonWidth, bottomViewHeight)];
            bottomView.backgroundColor = MAIN_BLUECOLOR;
            [self addSubview:bottomView];
        }
        else
        {
            [button setTitleColor:MAIN_TEXTBLACKCOLOR forState:UIControlStateNormal];
        }
        
        button.tag = idx;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
    }];
    
}

- (void)buttonAction:(UIButton *)sender
{
    self.selectedIndex = sender.tag;
    [self reload];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(headSortView:didSelectItemAtIndex:)])
    {
        [self.delegate headSortView:self didSelectItemAtIndex:self.selectedIndex];
    }
    
}

-(void)reload
{
    for(UIView *view in [self subviews])
    {
        [view removeFromSuperview];
    }
    [self setNeedsDisplay];//重新绘制
}




@end
