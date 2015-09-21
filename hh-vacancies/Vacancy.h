//
//  Vacancy.h
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Employer;

@interface Vacancy : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *salary;
@property (nonatomic, strong) NSString *employerName;
@property (nonatomic, strong) UIImage *employerLogo;

@property (nonatomic, strong) Employer *employer;

@end
