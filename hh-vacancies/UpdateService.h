//
//  UpdateService.h
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ApiService;
@class ParserService;
@class VacanciesRepository;

@interface UpdateService : NSObject

- (instancetype)initWithApiService:(ApiService *)apiService parserService:(ParserService *)parserService vacanciesRepository:(VacanciesRepository *)vacanciesRepository;

- (void)preloadData;
- (void)loadMore;

@end
