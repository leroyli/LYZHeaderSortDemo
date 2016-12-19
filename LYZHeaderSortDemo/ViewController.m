//
//  ViewController.m
//  LYZHeaderSortDemo
//
//  Created by artios on 2016/12/19.
//  Copyright © 2016年 artios. All rights reserved.
//

#import "ViewController.h"
#import "HeadSortView.h"

@interface ViewController ()<HeadSortViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupViews];
}

- (void)setupViews{
    
    NSArray *titleArray = @[@"menu1",
                            @"menu2",
                            @"menu3",
                            @"menu4"];
    
    HeadSortView *sortView = [[HeadSortView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 40) Delegate:self TitlesArray:titleArray SelectedIndex:0];
    [self.view addSubview:sortView];
    
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
