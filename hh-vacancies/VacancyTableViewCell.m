//
//  VacancyTableViewCell.m
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import "VacancyTableViewCell.h"
#import "Vacancy.h"

@implementation VacancyTableViewCell

- (void)awakeFromNib {
    [self.name setNumberOfLines:0];
    [self.name setFont:[UIFont boldSystemFontOfSize:17.f]];
}

- (VacancyTableViewCell *)fillWithVacancy:(Vacancy *)vacancy
{
    [self.name setText:vacancy.name];
    [self.salary setText:vacancy.salary];
    [self.employerName setText:vacancy.employerName];
    
    return self;
}

- (void)prepareForReuse {
    self.name = nil;
    self.salary = nil;
    self.employerName = nil;
    self.employerLogo = nil;
}

@end
