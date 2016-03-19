//
//  ViewController.h
//  task2
//
//  Created by lncsikkel on 15/03/16.
//  Copyright © 2016 LodewijkSikkel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeDirectory.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *array;
}

@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, readonly) EmployeeDirectory *directory;

@end

