//
//  ServiceLayer.m
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import "ServiceLayer.h"
#import "ApiService.h"
#import "UpdateService.h"
#import "ParserService.h"
#import "VacanciesRepository.h"
#import "ImageDownloaderService.h"

@interface ServiceLayer ()
@property (nonatomic, strong) ApiService *apiService;
@property (nonatomic, strong) UpdateService *updateService;
@property (nonatomic, strong) ParserService *parserService;
@property (nonatomic, strong) VacanciesRepository *vacanciesRepository;
@property (nonatomic, strong) ImageDownloaderService *imageService;

@property (nonatomic, strong) NSMutableArray *networkUpdateListners;

@end

@implementation ServiceLayer

+ (instancetype)sharedServiceLayer {
    static ServiceLayer *sharedServiceLayer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedServiceLayer = [[self alloc] init];
    });
    return sharedServiceLayer;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self bootstrapServices];
    }
    return self;
}

- (void)bootstrapServices {
    _networkUpdateListners = [NSMutableArray new];
    
    _apiService = [[ApiService alloc]init];
    
    _imageService = [[ImageDownloaderService alloc]initWithApiService:_apiService];
    
    _parserService = [[ParserService alloc]init];
    
    _vacanciesRepository = [[VacanciesRepository alloc]init];
    
    _updateService = [[UpdateService alloc]initWithApiService:_apiService parserService:_parserService vacanciesRepository:(VacanciesRepository *)_vacanciesRepository];
    
    [_updateService preloadData];
    
}

- (void)addNetworkUpdateListner:(id<NetworkUpdateProtocol>)listner
{
    [self.networkUpdateListners addObject:listner];
}

- (void)removeNetworkUpdateListner:(id<NetworkUpdateProtocol>)listner
{
    [self.networkUpdateListners removeObject:listner];
}

- (void)notifyNetworkUpdateListners {
    for (id<NetworkUpdateProtocol> listner in self.networkUpdateListners) {
        [listner networkUpdate];
    }
}

@end
