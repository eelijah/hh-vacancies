//
//  VacanciesRepository.m
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import "VacanciesRepository.h"
#import "Vacancy.h"
#import "Constants.h"
#import "ServiceLayer.h"

@interface VacanciesRepository ()
@property (nonatomic, strong) NSMutableArray *vacancies;
@end

@implementation VacanciesRepository

- (instancetype)init {
    self = [super init];
    if (self) {
        _vacancies = [NSMutableArray array];
    }
    return self;
}

- (NSUInteger)countOfAvailableVacancies {
    return [self.vacancies count];
}

- (NSArray *)avaliableVacancies
{
    return [NSArray arrayWithArray:self.vacancies];
}

- (void)saveParsedVacancies:(NSMutableArray *)array
{
    [self.vacancies addObjectsFromArray:array];
    [[ServiceLayer sharedServiceLayer] notifyNetworkUpdateListners];
}

- (Vacancy *)vacancyForIndex:(NSUInteger)index {
    if (index < [self countOfAvailableVacancies]) {
        return [self.vacancies objectAtIndex:index];
    } else {
        return nil;
    }
}


@end
