//
//  Employer.h
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 21/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Employer : NSObject

@property (nonatomic, strong) NSString *employerId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *logo;
@property (nonatomic, strong) NSString *logoOriginalNamePath;
@property (nonatomic, strong) NSString *logo90wNamePath;
@property (nonatomic, strong) NSString *logo240wNamePath;

@end
