//
//  TableViewDataSource.m
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import "TableViewDataSource.h"
#import "ServiceLayer.h"
#import "VacanciesRepository.h"
#import "VacancyTableViewCell.h"
#import "UpdateService.h"
#import "Constants.h"
#import "ImageDownloaderService.h"
#import "Employer.h"
#import "Vacancy.h"

@interface TableViewDataSource ()
@property (nonatomic, weak) VacanciesRepository *vacanciesRepository;
@property (nonatomic, weak) UpdateService *updateService;
@property (nonatomic, weak) ImageDownloaderService *imageService;
@end

@implementation TableViewDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        _vacanciesRepository = [[ServiceLayer sharedServiceLayer] vacanciesRepository];
        _updateService = [[ServiceLayer sharedServiceLayer] updateService];
        _imageService = [[ServiceLayer sharedServiceLayer] imageService];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.vacanciesRepository countOfAvailableVacancies];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == [self.vacanciesRepository countOfAvailableVacancies] - 1)
    {
        [self.updateService loadMore];
    }
    
    VacancyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([VacancyTableViewCell class]) forIndexPath:indexPath];

    Vacancy *vacancy = [self.vacanciesRepository vacancyForIndex:[indexPath row]];
    [self.imageService imageForImageId:vacancy.employer.logo240wNamePath completion:^(UIImage *logo) {
        dispatch_async(dispatch_get_main_queue(), ^{
            VacancyTableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
            if (updateCell) {
                vacancy.employer.logo = logo;
                [updateCell.employerLogo setImage:logo];
            }
        });
    }];
    if (vacancy) {
        [cell fillWithVacancy:vacancy];
    }
    
    
    return cell;
}



@end
