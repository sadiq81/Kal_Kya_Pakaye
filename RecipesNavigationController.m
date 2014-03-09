//
//  RecipesNavigationController.m
//  Kal Kya Pakaye
//
//  Created by Tommy Sadiq Hinrichsen on 06/03/14.
//  Copyright (c) 2014 Tommy Sadiq Hinrichsen. All rights reserved.
//

#import "RecipesNavigationController.h"
#import "AppDelegate.h"
#import "Dish.h"

@interface RecipesNavigationController ()
@end

@implementation RecipesNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.translucent = YES;





    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
