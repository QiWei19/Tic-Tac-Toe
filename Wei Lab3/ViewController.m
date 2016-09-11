//
//  ViewController.m
//  Wei Lab3
//
//  Created by weiqi on 9/23/15.
//  Copyright (c) 2015 Qi Wei. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)singlePlayer:(id)sender {
    AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
    appDelegate.gameMode = @"one";
}
- (IBAction)twoPlayer:(id)sender {
    AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
    appDelegate.gameMode = @"two";
}


@end
