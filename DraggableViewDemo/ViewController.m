//
//  ViewController.m
//  DraggableViewDemo
//
//  Created by anjohnlv on 2017/9/4.
//  Copyright © 2017年 anjohnlv. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Draggable.h"

@interface ViewController ()<DraggingDelegate>

@property (strong, nonatomic) UIView *targetView;

@property (strong, nonatomic) IBOutlet UIView *toolsView;
@property (strong, nonatomic) IBOutlet UIView *dropView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *draggingTypeSegmentedControl;
@property (strong, nonatomic) IBOutlet UISwitch *inBoundsSwitch;
- (IBAction)draggingTypeDidChanged:(id)sender;
- (IBAction)inBounds:(id)sender;
- (IBAction)adsorbInitiative:(id)sender;
- (IBAction)pullOverInitiative:(id)sender;
- (IBAction)revertInitiative:(id)sender;
- (IBAction)allDraggable;


@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)draggingTypeDidChanged:(UISegmentedControl *)sender {
    self.targetView.draggingType = sender.selectedSegmentIndex;
}

- (IBAction)inBounds:(UISwitch *)sender {
    self.targetView.draggingInBounds = sender.isOn;
}

- (IBAction)adsorbInitiative:(id)sender {
    [self.targetView adsorbingAnimated:YES];
}

- (IBAction)pullOverInitiative:(id)sender {
    [self.targetView pullOverAnimated:YES];
}

- (IBAction)revertInitiative:(id)sender {
    [self.targetView revertAnimated:YES];
}

- (IBAction)allDraggable {
    for (UIView *view in self.dropView.subviews) {
        view.delegate = self;
        view.draggingType = DraggingTypeNormal;
    }
}

#pragma mark - delegate
-(void)draggingDidChanged:(UIView *)view {
    self.targetView = view;
}

-(void)draggingDidBegan:(UIView *)view {
}

-(void)draggingDidEnded:(UIView *)view {
}

-(void)setTargetView:(UIView *)targetView {
    _targetView = targetView;
    [self.toolsView setHidden:NO];
    self.nameLabel.text = [NSString stringWithFormat:@"%@->%p",NSStringFromClass([targetView class]),targetView];
    [self.draggingTypeSegmentedControl setSelectedSegmentIndex:targetView.draggingType];
    [self.inBoundsSwitch setOn:targetView.draggingInBounds];
}



@end
