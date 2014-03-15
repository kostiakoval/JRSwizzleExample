//
//  UIViewController+KKSwizzle.m
//  MethodSwizzle
//
//  Created by Konstantin Koval on 15/03/14.
//  Copyright (c) 2014 Konstantin Koval. All rights reserved.
//

#import "UIViewController+KKSwizzle.h"
#import <JRSwizzle.h>

@implementation UIViewController (KKSwizzle)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSError *error;
        BOOL result = [[self class] jr_swizzleMethod:@selector(viewWillAppear:) withMethod:@selector(xxx_viewWillAppear) error:&error];
        if (!result || error) {
            NSLog(@"Can't swizzle methods - %@", [error description]);
        }
    });
}

- (void)xxx_viewWillAppear
{
    [self xxx_viewWillAppear]; // this method call will call real viewWillAppear, because we have exchanged them.
    //TODO: add customer code here. This code will work for every ViewController
    NSLog(@"xxx_viewWillAppear for - %@", NSStringFromClass(self.class));
}

@end
