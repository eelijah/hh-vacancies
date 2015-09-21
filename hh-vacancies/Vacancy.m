//
//  Vacancy.m
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import "Vacancy.h"
#import "Employer.h"

@implementation Vacancy

- (NSString *)employerName {
    return self.employer.name;
}

- (UIImage *)employerLogo {
    return self.employer.logo;
}

@end
