JRSwizzleExample
================

An example of usage JRSwizzle library 

How to implement

1) Create a category of class you want to swizzle method.   
2) Create new method  
3) In swizzled method call original implementation. You do this by calling the same method. This will not end in infinity loop because our method will point to original implementation  
4) Swizzle methods in load or initialise method. This is the best place to do because we want to swizzle method only once.   
5) Swizzle methods in dispatch_once block. This will guaranty Thread safe and make sure we swizzle method just once.  

Here is an implementation
```objective-c  
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
    [self xxx_viewWillAppear]; // this will call viewWillAppear implementation, because we have exchanged them.
    //TODO: add customer code here. This code will work for every ViewController
    NSLog(@"xxx_viewWillAppear for - %@", NSStringFromClass(self.class));
}
@end
```


