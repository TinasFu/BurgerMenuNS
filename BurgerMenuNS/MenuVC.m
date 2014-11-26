//
//  ViewController.m
//  BurgerMenuNS
//
//  Created by Shiquan Fu on 11/25/14.
//  Copyright (c) 2014 Tina Fu. All rights reserved.
//

#import "MenuVC.h"


@interface MenuVC ()

@property (strong,nonatomic) UIViewController *grayVC;
@property (strong,nonatomic) UIViewController *currentVC;
@property (assign,nonatomic) BOOL burgerMenuOn;


@property (assign, nonatomic) UIButton *burgerButton;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation MenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 60, 300, 600) style:UITableViewStylePlain];
//    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view.superview attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.f];
//    [self.view addConstraint:constraint];
//    
//    constraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.burgerButton attribute:NSLayoutAttributeTop multiplier:1.0f constant:5.f];
//    [self.view addConstraint:constraint];
//    
//    constraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view.superview attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.f];
//    [self.view addConstraint:constraint];
//    
//    constraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view.superview attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.f];
//    [self.view addConstraint:constraint];
    
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

    self.burgerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.burgerButton.frame = CGRectMake(10, 30, 30, 20);
    UIImage *buttonImage = [UIImage imageNamed:@"burgerButton"];
    [self.burgerButton setBackgroundImage:buttonImage forState:(UIControlStateNormal)];
    [self.view addSubview:self.burgerButton];
    [self.burgerButton addTarget:self
                 action:@selector(burgerButtonPressed)
       forControlEvents:UIControlEventTouchUpInside];
    
    self.grayVC = [[UIViewController alloc]init];[self addChildViewController:self.grayVC];
    self.grayVC.view.frame = self.view.frame;
    [self.view insertSubview:self.grayVC.view belowSubview:self.burgerButton];
    [self.grayVC didMoveToParentViewController:self];
    [self.grayVC.view setBackgroundColor:[UIColor colorWithRed:152.0f/255.0f green:147.0f/255.0f blue:147.0f/255.0f alpha:1.0]];
    self.burgerMenuOn = NO;
    

}

- (void)burgerButtonPressed {
    
    [UIView animateWithDuration:0.4 animations:^{
        
        if (self.burgerMenuOn == NO) {
            self.grayVC.view.frame = CGRectMake(self.view.frame.size.width * .8, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.burgerMenuOn = YES;
        }
        else {
            self.grayVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.burgerMenuOn = NO;
        }
        
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyCellIdentifier = @"MyCellIdentifier";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MyCellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyCellIdentifier];
    }
    
    return cell;
}



@end
