//
//  DCLimaODAPIClient.m
//  ConsultaPapeletas
//
//  Created by David Céspedes on 22/02/14.
//  Copyright (c) 2014 LSR Marketing Service. All rights reserved.
//

#import "DCLimaODAPIClient.h"
#import "AFNetworking.h"

@implementation DCLimaODAPIClient
+ (id)sharedInstance{
    static DCLimaODAPIClient *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[DCLimaODAPIClient alloc] initWithBaseURL:[NSURL URLWithString:SERVER_APIv2_URL]];
    });
    
    return _sharedInstance;
}

//API V3
- (id)initWithBaseURL:(NSURL *)url{
    self = [super initWithBaseURL:url];
    if (self) {
        //custom settings
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        self.parameterEncoding = AFFormURLParameterEncoding;
    }
    return self;
}

@end
