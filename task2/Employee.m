//
//  Employee.m
//  task2
//
//  Created by lncsikkel on 15/03/16.
//  Copyright © 2016 LodewijkSikkel. All rights reserved.
//

#import "Employee.h"

static NSUInteger const kStartingSalary = 10000;
NSString* const kSalaryCurrency = @"EUR";

@implementation Employee

- (instancetype)initWithName:(NSString*)name birthYear:(NSUInteger)birthYear
{
    self = [super init];
    if(self)
    {
        _name = name;
        _birthYear = birthYear;
        _salary = [[NSDecimalNumber alloc] initWithUnsignedInteger:kStartingSalary];
    }
    return self;
}

- (NSString *)formatSalary
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    formatter.currencyCode = kSalaryCurrency;
    return [formatter stringFromNumber:_salary];
}

@end