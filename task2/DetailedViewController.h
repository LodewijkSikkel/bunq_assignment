//
//  DetailedViewController.h
//  task2
//
//  Created by lncsikkel on 18/03/16.
//  Copyright © 2016 LodewijkSikkel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"

@interface DetailedViewController : UIViewController
{
    Employee *employee; // private
}

- (instancetype)initWithObject:(Employee *)selectedEmployee;

@end
