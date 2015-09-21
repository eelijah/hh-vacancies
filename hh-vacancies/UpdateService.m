//
//  UpdateService.m
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import "UpdateService.h"
#import "ApiService.h"
#import "ParserService.h"
#import "VacanciesRepository.h"
#import "Constants.h"

@interface UpdateService ()
@property (nonatomic, weak) ApiService *apiService;
@property (nonatomic, weak) ParserService *parserService;
@property (nonatomic, weak) VacanciesRepository *vacanciesRepository;

@end

@implementation UpdateService

- (instancetype)initWithApiService:(ApiService *)apiService parserService:(ParserService *)parserService vacanciesRepository:(VacanciesRepository *)vacanciesRepository
{
    self = [super init];
    if (self) {
        _apiService          = apiService;
        _parserService       = parserService;
        _vacanciesRepository = vacanciesRepository;
        _vacanciesRepository.currentApiPage = 0;
    }
    return self;
}

- (void)preloadData
{
    [self requestWithParameters:nil];
}

- (void)loadMore
{
    NSDictionary *parameters = @{
                                 @"page" : [NSString stringWithFormat:@"%lu",++self.vacanciesRepository.currentApiPage]
                                 };
    [self requestWithParameters:parameters];
}

- (void)requestWithParameters:(NSDictionary *)parameters {
    NSURL *vacanciesURL = [self.apiService urlForEndpoint:HHApiVacanciesEndpoint];
    typeof(self) __weak weakSelf = self;
    [self.apiService requestToURL:vacanciesURL withParameters:parameters completion:^(id responseObject, NSError *error) {
        if (error) {
            // handle error
        } else {
            @synchronized(weakSelf) {
                [weakSelf.vacanciesRepository saveParsedVacancies:[weakSelf.parserService prepareNetworkData:responseObject]];
            }
        }
    }];
}

@end
