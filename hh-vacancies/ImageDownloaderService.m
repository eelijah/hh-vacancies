//
//  ImageDownloaderService.m
//  hh-vacancies
//
//  Created by Elijah Ponkratenko on 21/09/15.
//  Copyright © 2015 Elijah Ponkratenko. All rights reserved.
//

#import "ImageDownloaderService.h"
#import "ApiService.h"

@interface ImageDownloaderService ()
@property (nonatomic, strong) NSCache *imageCache;
@property (nonatomic, weak) ApiService *apiService;
@end

@implementation ImageDownloaderService

- (instancetype)initWithApiService:(ApiService *)apiService {
    self = [super init];
    if (self) {
        _apiService = apiService;
        _imageCache = [[NSCache alloc] init];
        [_imageCache setName:@"HHImageCache"];
    }
    return self;
}

- (void)imageForImageId:(NSString *)imageId completion:(void(^)(UIImage *logo))completion
{
    __block UIImage *imageLogo;
    imageLogo = [self.imageCache objectForKey:imageId];
    if (imageLogo) {
        completion(imageLogo);
    }
    NSURL *url = [self.apiService urlForEmployerLogoWithLogoId:imageId];
    typeof(self) __weak weakSelf = self;
    [self.apiService requestToURL:url withParameters:nil completion:^(id responseObject, NSError *error) {
        if (responseObject) {
            UIImage *image = [UIImage imageWithData:responseObject];
            if (image) {
                [weakSelf.imageCache setObject:image forKey:imageId];
                completion(image);
            }
        }
    }];
}


@end
