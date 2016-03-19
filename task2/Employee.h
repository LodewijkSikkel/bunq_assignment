//
//  Employee.h
//  task2
//
//  Created by lncsikkel on 15/03/16.
//  Copyright © 2016 LodewijkSikkel. All rights reserved.
//

#ifndef Employee_h
#define Employee_h

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property (readonly, copy) NSString* name;
@property (readonly) NSUInteger birthYear;
@property (readonly, copy) NSDecimalNumber* salary;

-(instancetype)initWithName:(NSString*)name birthYear:(NSUInteger)birthYear;

-(NSString *)formatSalary;

@end

#endif /* Employee_h */
