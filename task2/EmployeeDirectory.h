//
//  EmployeeDirectory.h
//  task2
//
//  Created by lncsikkel on 15/03/16.
//  Copyright © 2016 LodewijkSikkel. All rights reserved.
//

#ifndef EmployeeDirectory_h
#define EmployeeDirectory_h

#import <Foundation/Foundation.h>

// notification posted when the directory finishes updating
extern NSString* const kEmployeeDirectoryDidUpdateNotification;

@interface EmployeeDirectory : NSObject

@property (readonly) NSArray* employees; // returns NSArray of Employee
@property (readonly) NSArray* sortedEmployees; // returns sorted NSArray of Employee
@property (readonly) BOOL isUpdating;

- (void)update;
- (void)sort;

@end

#endif /* EmployeeDirectory_h */
