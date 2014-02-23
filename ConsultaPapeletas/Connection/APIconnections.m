//
//  APIconnections.m
//  ConsultaPapeletas
//
//  Created by David Céspedes on 22/02/14.
//  Copyright (c) 2014 LSR Marketing Service. All rights reserved.
//

#import "APIconnections.h"
#import "DCLimaODAPIClient.h"

@implementation APIconnections

-(void)checkInfractionsByLicensePlateWithParameters:(NSDictionary *)params{
    NSString * licensePlates = params[@"PLACA"];
    NSLog(@"Going to check Infractions for LicensePlate: %@", licensePlates);
    
    if ([params[@"DATA_ORIGIN"] isEqualToString:@"Samuel"]) {
        NSString * pathString =[NSString stringWithFormat:@"buscarplaca/%@", licensePlates];
        [[DCLimaODAPIClient sharedInstance] getPath:pathString
                                         parameters:nil
                                            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                //Print the received Data
                                                NSLog(@"The response to the checkInfractionsByLicensePlateWithParameters API request is: %@", responseObject);
                                                
                                                NSLog(@"We are going to call the checkInfractionsSamuelByLicensePlateDidFinishSuccessfully in the APIconnections delegate");
                                                [self.delegate checkInfractionsSamuelByLicensePlateDidFinishSuccessfully:responseObject];
                                            }
                                            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                //Print the received Data
                                                NSLog(@"The response to the checkInfractionsByLicensePlateWithParameters API has the following error: %@", error);
                                                
                                                NSLog(@"We are going to call the checkInfractionsSamuelByLicensePlateDidFinishWithFailure in the APIconnections delegate");
                                                [self.delegate checkInfractionsSamuelByLicensePlateDidFinishWithFailure:@{  @"operation": operation,
                                                                                                                      @"error": error}];
                                                
                                            }
         ];
    }else{
        NSString * authKey = @"ca69381ed8af30c9290fbc8568b2d5586d929b78";
        NSString * output = @"json_array";
        NSString * pathString =[NSString stringWithFormat:@"DIREC-DE-SANCI-2007-2010?auth_key=%@&output=%@",
                                authKey,
                                output];
        [[DCLimaODAPIClient sharedInstance] getPath:pathString
                                         parameters:nil
                                            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                //Print the received Data
                                                NSLog(@"The response to the checkInfractionsByLicensePlateWithParameters API request is: %@", responseObject);
                                                
                                                NSLog(@"We are going to call the checkInfractionsByLicensePlateDidFinishSuccessfully in the APIconnections delegate");
                                                [self.delegate checkInfractionsByLicensePlateDidFinishSuccessfully:responseObject];
                                            }
                                            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                //Print the received Data
                                                NSLog(@"The response to the checkInfractionsByLicensePlateWithParameters API has the following error: %@", error);
                                                
                                                NSLog(@"We are going to call the checkInfractionsByLicensePlateDidFinishWithFailure in the APIconnections delegate");
                                                [self.delegate checkInfractionsByLicensePlateDidFinishWithFailure:@{  @"operation": operation,
                                                                                                          @"error": error}];
                                                
                                            }
         ];
    }
    
    
}

@end
