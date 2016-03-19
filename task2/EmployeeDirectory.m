//
//  EmployeeDirectory.m
//  task2
//
//  Created by lncsikkel on 15/03/16.
//  Copyright © 2016 LodewijkSikkel. All rights reserved.
//

#import "EmployeeDirectory.h"
#import "Employee.h"

NSString* const kEmployeeDirectoryDidUpdateNotification = @"kEmployeeDirectoryDidUpdateNotification";

@implementation EmployeeDirectory
- (void)update
{
    if(_isUpdating == YES)
    {
        return;
    }
    _isUpdating = YES;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ // post on background queue
        [self BA_doUpdateInBackground];
    });
}

#pragma mark - Privates

- (void)BA_doUpdateInBackground
{
    [NSThread sleepForTimeInterval:2];
    NSArray* name = @[@"Anne", @"Lucas", @"Marc", @"Zeus", @"Hermes", @"Bart", @"Paul", @"John", @"Ringo", @"Dave", @"Taylor"];
    NSArray* surnames = @[@"Hawkins", @"Simpson", @"Lennon", @"Grohl", @"Hawkins", @"Jacobs", @"Holmes", @"Mercury", @"Matthews"];
    NSUInteger amount = name.count*surnames.count;
    NSMutableArray* employees = [NSMutableArray arrayWithCapacity:amount];
    for(NSUInteger i=0; i<amount; i++)
    {
        NSString* fullName = [NSString stringWithFormat:@"%@ %@", name[random()%name.count],
                              surnames[random()%surnames.count]];
        [employees addObject:[[Employee alloc] initWithName:fullName birthYear:1997-random()%50]];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{ // post on main thread to allow UI changes
        [self BA_updateDidFinishWithResults:employees];
    });
}

-(void)BA_sortEmployeeDirectory
{
    if (_employees != nil) {
         _sortedEmployees = [_employees sortedArrayUsingComparator:^(Employee *employeeA, Employee *employeeB)
         {
             // Compare the name of the employee and return ascending, descending or same
             return [employeeA.name compare:employeeB.name];
         }];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{ // post on main thread to allow UI changes
        [self BA_updateDidFinishWithResults:_sortedEmployees];
    });
}

-(void)sort
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Sort the employee array
        [self BA_sortEmployeeDirectory];
    });
}

- (void)BA_updateDidFinishWithResults:(NSArray*)results
{
    _employees = results;
    _isUpdating = NO;
    [[NSNotificationCenter defaultCenter]
     postNotificationName:kEmployeeDirectoryDidUpdateNotification object:self];
}

@end
