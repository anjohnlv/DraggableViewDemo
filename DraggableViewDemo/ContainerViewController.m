//
//  ContainerViewController.m
//  DraggableViewDemo
//
//  Created by anjohnlv on 2017/9/14.
//  Copyright © 2017年 anjohnlv. All rights reserved.
//

#import "ContainerViewController.h"
#import "UIView+Draggable.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (UIView *view in self.view.subviews) {
        view.draggingType = DraggingTypeNormal;
        view.draggingInBounds = YES;
    }
}

@end
