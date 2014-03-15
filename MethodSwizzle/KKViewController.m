//
//  KKViewController.m
//  MethodSwizzle
//
//  Created by Konstantin Koval on 14/03/14.
//  Copyright (c) 2014 Konstantin Koval. All rights reserved.
//

#import "KKViewController.h"

@interface KKViewController ()

@end

@implementation KKViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}



@end
