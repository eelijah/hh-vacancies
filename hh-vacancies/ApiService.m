//
//  ApiService.m
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 20/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import "ApiService.h"
#import "Constants.h"

@implementation ApiService

#pragma mark - Vacancies

- (NSURL *)urlForEndpoint:(NSString *)endpoint {
    NSString * urlString = [NSString stringWithFormat:@"%@://%@/%@",HHApiScheme,HHApiDomain,endpoint];
    return [NSURL URLWithString:urlString];
}

#pragma mark - Logos

- (NSURL *)urlForEmployerLogoWithLogoId:(NSString *)logoId {
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HHApiEmployerLogo,logoId];
    return [NSURL URLWithString:urlString];
}

#pragma mark - General request method

- (void)requestToURL:(NSURL *)url withParameters:(NSDictionary *)parameters completion:(void (^)(id responseObject, NSError *error))completion
{
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    /* Create session, and optionally set a NSURLSessionDelegate. */
    NSURLSession* session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    
    if (parameters) {
        url = NSURLByAppendingQueryParameters(url, parameters);
    }
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    
    /* Start a new Task */
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            // Failure
//            NSLog(@"URL Session Task Failed: %@", [error localizedDescription]);
            completion(nil,error);
        }
        else {
            // Success
//            NSLog(@"URL Session Task Succeeded: HTTP %ld", ((NSHTTPURLResponse*)response).statusCode);
            completion(data,nil);
        }
    }];
    [task resume];
}



#pragma mark - Helper

static NSString* NSStringFromQueryParameters(NSDictionary* queryParameters)
{
    NSMutableArray* parts = [NSMutableArray array];
    [queryParameters enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        NSString *part = [NSString stringWithFormat: @"%@=%@",
                          [key stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding],
                          [value stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]
                          ];
        [parts addObject:part];
    }];
    return [parts componentsJoinedByString: @"&"];
}

static NSURL* NSURLByAppendingQueryParameters(NSURL* URL, NSDictionary* queryParameters)
{
    NSString* URLString = [NSString stringWithFormat:@"%@?%@",
                           [URL absoluteString],
                           NSStringFromQueryParameters(queryParameters)
                           ];
    return [NSURL URLWithString:URLString];
}


@end
