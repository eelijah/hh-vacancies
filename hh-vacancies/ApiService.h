//
//  ApiService.h
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiService : NSObject

/**
 *  Create URL by fill current shceme, domain constant and specefied endpoint.
 *
 *  @param endpoint Endpoint string
 *
 *  @return Return URL with current constatnt for specified endpoint
 */
- (NSURL *)urlForEndpoint:(NSString *)endpoint;

- (NSURL *)urlForEmployerLogoWithLogoId:(NSString *)logoId;

/**
 *  Make request to data fetch
 *
 *  @param url        Request URL
 *  @param parameters Request parameters
 *  @param completion Request comletion block
 */
- (void)requestToURL:(NSURL *)url withParameters:(NSDictionary *)parameters completion:(void (^)(id responseObject, NSError *error))completion;

@end
