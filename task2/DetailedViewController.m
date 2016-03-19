//
//  DetailedViewController.m
//  task2
//
//  Created by lncsikkel on 18/03/16.
//  Copyright © 2016 LodewijkSikkel. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()

@end

@implementation DetailedViewController

- (instancetype) initWithObject:(Employee *)selectedEmployee
{
    employee = selectedEmployee;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set the background to white
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextView* textView = [[UITextView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    textView.text = [NSString stringWithFormat:@"Employee: %@\nBorn: %lu\nSalary: %@", employee.name, employee.birthYear, [employee formatSalary]];
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
