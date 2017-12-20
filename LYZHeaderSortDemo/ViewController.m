//
//  ViewController.m
//  LYZHeaderSortDemo
//
//  Created by artios on 2016/12/19.
//  Copyright © 2016年 artios. All rights reserved.
//

#import "ViewController.h"
#import "HeadSortView.h"
#import "Masonry.h"

@interface ViewController ()<HeadSortViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupViews];
}

- (void)setupViews{
    
    NSArray *titleArray = @[@"menu1",
                            @"menu2",
                            @"menu3",
                            @"menu4"];
    
    HeadSortView *sortView = [[HeadSortView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 40) Delegate:self TitlesArray:titleArray SelectedIndex:0];
    [self.view addSubview:sortView];
    
    [sortView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    
    
}

/** 点击按钮回调 */
- (void)headSortView:(HeadSortView *)sortView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"you have clicked %lu",index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
