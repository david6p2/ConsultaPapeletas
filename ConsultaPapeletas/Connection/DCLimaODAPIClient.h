//
//  DCLimaODAPIClient.h
//  ConsultaPapeletas
//
//  Created by David Céspedes on 22/02/14.
//  Copyright (c) 2014 LSR Marketing Service. All rights reserved.
//

#import "AFHTTPClient.h"

@interface DCLimaODAPIClient : AFHTTPClient

+ (id)sharedInstance;

@end
