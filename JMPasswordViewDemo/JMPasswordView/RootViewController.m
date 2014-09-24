//
//  RootViewController.m
//  JMPasswordView
//
//  Created by juuman on 14-9-24.
//  Copyright (c) 2014年 juuman. All rights reserved.
//

#import "RootViewController.h"
#import "JMPasswordView.h"

@interface RootViewController ()<JMPasswordViewDelegate>
@property (nonatomic,weak)IBOutlet UILabel *textLeb;
@end

@implementation RootViewController
@synthesize textLeb;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    JMPasswordView *pswView=[[JMPasswordView alloc]initWithFrame:CGRectMake(10, 100, 300, 350)];
    pswView.delegate=self;
    [self.view addSubview:pswView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)JMPasswordView:(JMPasswordView *)passwordView withPassword:(NSString *)password{
    textLeb.text=password;
}
@end
