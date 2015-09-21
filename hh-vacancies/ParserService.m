//
//  ParserService.m
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import "ParserService.h"
#import "Vacancy.h"
#import "Employer.h"

@implementation ParserService

- (NSMutableArray *)prepareNetworkData:(id)networkData {
    NSError *error;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:networkData options:0 error:&error];
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
        return nil;
    }
    
    NSMutableArray *array = [NSMutableArray array];
    NSArray *vacancies = [parsedObject valueForKey:@"items"];
    for (NSDictionary *item in vacancies) {
        Vacancy *vacancy = [[Vacancy alloc] init];
        vacancy.name = [item valueForKey:@"name"];
        vacancy.salary = [self salary:[item valueForKey:@"salary"]];
        
        NSDictionary *emlpoyerDictionary = [item objectForKey:@"employer"];
        if (emlpoyerDictionary) {
            Employer *employer = [[Employer alloc] init];
            employer.name = [emlpoyerDictionary valueForKey:@"name"];
            
            NSDictionary *employerLogo = [emlpoyerDictionary objectForKey:@"logo_urls"];
            if ([[employerLogo valueForKey:@"90"] respondsToSelector:@selector(lastPathComponent)]) {
                employer.logo90wNamePath = [[employerLogo valueForKey:@"90"] lastPathComponent];
            }
            if ([[employerLogo valueForKey:@"240"] respondsToSelector:@selector(lastPathComponent)]) {
                employer.logo240wNamePath = [[employerLogo valueForKey:@"240"] lastPathComponent];
            }
            if ([[employerLogo valueForKey:@"original"] respondsToSelector:@selector(lastPathComponent)]) {
                employer.logoOriginalNamePath = [[employerLogo valueForKey:@"original"] lastPathComponent];
            }
            vacancy.employer = employer;
        }
        
        [array addObject:vacancy];
    }
    
    return array;
}

- (NSString *)salary:(NSDictionary *)salary {
    NSNumber *to       = [salary valueForKey:@"to"];
    NSNumber *from     = [salary valueForKey:@"from"];
    NSString *currency = [salary valueForKey:@"currency"];
    
    NSMutableString *salaryString;
    if (![from isKindOfClass:[NSNull class]]) {
        salaryString = [NSMutableString stringWithFormat:@"%@",from];
    }
    if (![to isKindOfClass:[NSNull class]]) {
        if (salaryString.length > 0) {
            [salaryString appendFormat:@"-%@",to];
        } else {
            salaryString = [NSMutableString stringWithFormat:@"%@",to];
        }
    }
    if (![currency isKindOfClass:[NSNull class]]) {
        if (salaryString.length > 0) {
            [salaryString appendFormat:@" %@",currency];
        }
    }
    if (!salaryString) {
        return @"Зарплата не указана";
    }
    return salaryString;
}

@end
