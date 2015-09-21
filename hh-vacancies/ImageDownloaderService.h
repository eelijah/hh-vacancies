//
//  ImageDownloaderService.h
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 21/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ApiService;

@interface ImageDownloaderService : NSObject
- (instancetype)initWithApiService:(ApiService *)apiService;
- (void)imageForImageId:(NSString *)imageId completion:(void(^)(UIImage *logo))completion;

@end
