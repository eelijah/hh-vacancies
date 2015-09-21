//
//  VacanciesRepository.h
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Vacancy;

@interface VacanciesRepository : NSObject
@property (nonatomic, assign) NSUInteger currentApiPage;

- (NSArray *)avaliableVacancies;
- (void)saveParsedVacancies:(NSMutableArray *)array;

- (NSUInteger)countOfAvailableVacancies;
- (Vacancy *)vacancyForIndex:(NSUInteger)index;

@end
