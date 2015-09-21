//
//  VacancyTableViewCell.h
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Vacancy;

@interface VacancyTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *name;
@property (nonatomic, strong) IBOutlet UILabel *salary;
@property (nonatomic, strong) IBOutlet UILabel *employerName;
@property (nonatomic, strong) IBOutlet UIImageView *employerLogo;

- (VacancyTableViewCell *)fillWithVacancy:(Vacancy *)vacancy;

@end
