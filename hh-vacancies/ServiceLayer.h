//
//  ServiceLayer.h
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ApiService;
@class UpdateService;
@class ParserService;
@class VacanciesRepository;
@class ImageDownloaderService;

@interface ServiceLayer : NSObject
@property (nonatomic, strong, readonly) ApiService *apiService;
@property (nonatomic, strong, readonly) UpdateService *updateService;
@property (nonatomic, strong, readonly) ParserService *parserService;
@property (nonatomic, strong, readonly) VacanciesRepository *vacanciesRepository;
@property (nonatomic, strong, readonly) ImageDownloaderService *imageService;

+ (id)sharedServiceLayer;

@end
