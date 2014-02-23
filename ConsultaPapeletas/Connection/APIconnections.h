//
//  APIconnections.h
//  ConsultaPapeletas
//
//  Created by David Céspedes on 22/02/14.
//  Copyright (c) 2014 LSR Marketing Service. All rights reserved.
//

#import <Foundation/Foundation.h>

//Protocol
@class APIconnections;

@protocol APIconnectionsDelegate <NSObject>
//API v3 Delegate Methods
@optional
-(void)checkInfractionsByLicensePlateDidFinishSuccessfully:(NSDictionary*)checkInfractionsByLicensePlateResponse;//received by ...
-(void)checkInfractionsByLicensePlateDidFinishWithFailure:(NSDictionary*)checkInfractionsByLicensePlateResponse;//received by ...
-(void)checkInfractionsSamuelByLicensePlateDidFinishSuccessfully:(NSArray*)checkInfractionsByLicensePlateResponse;//received by ...
-(void)checkInfractionsSamuelByLicensePlateDidFinishWithFailure:(NSDictionary*)checkInfractionsByLicensePlateResponse;//received by ...
@end

@interface APIconnections : NSObject

@property (nonatomic, weak) IBOutlet id<APIconnectionsDelegate> delegate;

-(void)checkInfractionsByLicensePlateWithParameters:(NSDictionary *)params;

@end
