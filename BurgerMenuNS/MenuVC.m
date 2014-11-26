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
@property (assign,nonatomic) BOOL burgerMenuOn;
@property (assign,nonatomic) BOOL detailOn;
@property (strong,nonatomic) NSArray *aList;


@property (assign, nonatomic) UIButton *burgerButton;
@property (strong, nonatomic) UILabel *grayVCLabel;
@property (strong, nonatomic) UILabel *grayVCMoneyLabel;
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
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
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
    self.detailOn = NO;
    
    self.aList = [NSArray arrayWithObjects:@"Leonardo Dicaprio",@"Jack Nicholson",@"Johnny Depp",@"James Franco", nil];

}

- (void)burgerButtonPressed {
    
    [UIView animateWithDuration:0.4 animations:^{
        
        if (self.burgerMenuOn == NO && self.detailOn == NO) {
            self.grayVC.view.frame = CGRectMake(self.view.frame.size.width * .8, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.burgerMenuOn = YES;
        }
        else if (self.burgerMenuOn == NO && self.detailOn == YES) {
            [self.grayVCLabel removeFromSuperview];
            [self.grayVCMoneyLabel removeFromSuperview];
            self.grayVC.view.frame = CGRectMake(self.view.frame.size.width * .8, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.burgerMenuOn = YES;
            //self.detailOn = NO;
        }

        else {
            self.grayVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.burgerMenuOn = NO;
        }
        
        
    } completion:^(BOOL finished) {
        
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.aList.count != 0) {
        return self.aList.count;
    }
    else {
        return 0;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyCellIdentifier = @"AListCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MyCellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyCellIdentifier];
        cell.textLabel.text = self.aList[indexPath.row];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.aList[indexPath.row] isEqualToString:@"Leonardo Dicaprio"]) {
        [UIView animateWithDuration:0.4 animations:^{
            
            self.grayVCLabel = [[UILabel alloc]init];
            self.grayVCLabel.frame = CGRectMake(10, 100, 350, 30);
            [self.view addSubview:self.grayVCLabel];
            
            self.grayVCMoneyLabel = [[UILabel alloc]init];
            self.grayVCMoneyLabel.frame = CGRectMake(10, 150, 350, 30);
            [self.view addSubview:self.grayVCMoneyLabel];
            
            self.grayVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.grayVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.burgerMenuOn = NO;
            self.detailOn = YES;
            
            
        } completion:^(BOOL finished) {
            self.grayVCLabel.text = @"Leonardo Dicaprio's Net Worth:";
            self.grayVCMoneyLabel.text = @"$220 Million";
        }];

    }
    else if ([self.aList[indexPath.row] isEqualToString:@"Jack Nicholson"]) {
        [UIView animateWithDuration:0.4 animations:^{
            
            self.grayVCLabel = [[UILabel alloc]init];
            self.grayVCLabel.frame = CGRectMake(10, 100, 350, 30);
            [self.view addSubview:self.grayVCLabel];
            
            self.grayVCMoneyLabel = [[UILabel alloc]init];
            self.grayVCMoneyLabel.frame = CGRectMake(10, 150, 350, 30);
            [self.view addSubview:self.grayVCMoneyLabel];
            
            self.grayVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.grayVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.burgerMenuOn = NO;
            self.detailOn = YES;
            
            
        } completion:^(BOOL finished) {
            self.grayVCLabel.text = @"Jack Nicholson's Net Worth:";
            self.grayVCMoneyLabel.text = @"$400 Million";
        }];
        
    }
    else if ([self.aList[indexPath.row] isEqualToString:@"Johnny Depp"]) {
        [UIView animateWithDuration:0.4 animations:^{
            
            self.grayVCLabel = [[UILabel alloc]init];
            self.grayVCLabel.frame = CGRectMake(10, 100, 350, 30);
            [self.view addSubview:self.grayVCLabel];
            
            self.grayVCMoneyLabel = [[UILabel alloc]init];
            self.grayVCMoneyLabel.frame = CGRectMake(10, 150, 350, 30);
            [self.view addSubview:self.grayVCMoneyLabel];
            
            self.grayVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.grayVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.burgerMenuOn = NO;
            self.detailOn = YES;
            
            
        } completion:^(BOOL finished) {
            self.grayVCLabel.text = @"Johnny Depp's Net Worth:";
            self.grayVCMoneyLabel.text = @"$350 Million";
        }];
        
    }
    else if ([self.aList[indexPath.row] isEqualToString:@"James Franco"]) {
        [UIView animateWithDuration:0.4 animations:^{
            
            self.grayVCLabel = [[UILabel alloc]init];
            self.grayVCLabel.frame = CGRectMake(10, 100, 350, 30);
            [self.view addSubview:self.grayVCLabel];
            
            self.grayVCMoneyLabel = [[UILabel alloc]init];
            self.grayVCMoneyLabel.frame = CGRectMake(10, 150, 350, 30);
            [self.view addSubview:self.grayVCMoneyLabel];
            
            self.grayVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.grayVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.burgerMenuOn = NO;
            self.detailOn = YES;
            
            
        } completion:^(BOOL finished) {
            self.grayVCLabel.text = @"James Franco's Net Worth:";
            self.grayVCMoneyLabel.text = @"$20 Million";
        }];
        
    }

}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //remove the white space before seperator line
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}






@end
