//
//  ViewController.m
//  BSPageViewControllerDemon
//
//  Created by baison on 15/3/16.
//  Copyright (c) 2015年 bstar. All rights reserved.
//

#import "ViewController.h"
#import "BSPageViewController.h"

@interface ViewController ()

@property (nonatomic, readonly) BSPageViewController *ctlr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];
    
    _ctlr = [[BSPageViewController alloc] init];
    _ctlr.view.frame = CGRectMake(0, 100, self.view.frame.size.width, 200);
    [self.view addSubview:_ctlr.view];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    BSPageItem *item1 = [[BSPageItem alloc] init];
    item1.image.image = [UIImage imageNamed:@"1.jpg"];
    
    BSPageItem *item2 = [[BSPageItem alloc] init];
    item2.image.image = [UIImage imageNamed:@"2.jpg"];
    
    
    BSPageItem *item3 = [[BSPageItem alloc] init];
    item3.image.image = [UIImage imageNamed:@"3.jpg"];
    
    
    BSPageItem *item4 = [[BSPageItem alloc] init];
    item4.image.image = [UIImage imageNamed:@"4.jpg"];
    
    
    BSPageItem *item5 = [[BSPageItem alloc] init];
    item5.image.image = [UIImage imageNamed:@"5.jpg"];
    
    _ctlr.pages = [NSArray arrayWithObjects:item1, item2, item3, item4, item5,nil];
    [_ctlr reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
