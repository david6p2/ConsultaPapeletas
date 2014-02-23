//
//  DCFirstViewController.m
//  ConsultaPapeletas
//
//  Created by David Céspedes on 22/02/14.
//  Copyright (c) 2014 LSR Marketing Service. All rights reserved.
//

#import "DCFirstViewController.h"
#import "SVProgressHUD.h"
#import "DCPapeletaTableViewController.h"

@interface DCFirstViewController ()
@property (nonatomic, strong) APIconnections * bookingAPIConnection;
@end

@implementation DCFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)requestAction:(id)sender {
    //Pedir Infracciones
    if ([self.requestButton.titleLabel.text isEqualToString:@"Consultar"]) {
        [self.platesTxtField resignFirstResponder];
        [self requestInfoWithParameters];
        [SVProgressHUD showWithStatus:NSLocalizedString(@"Buscando papeletas...", nil)
                             maskType:SVProgressHUDMaskTypeGradient];
    }else if ([self.requestButton.titleLabel.text isEqualToString:@"Borrar"]) {
        self.requestButton.titleLabel.text = @"Consultar";
        self.verPapeletasButton.hidden = YES;
        self.infoTextView.text = @"Consulta las papeletas de un conductor";
        self.platesTxtField.text = @"";
    }
    
    
    
    
}

- (IBAction)textFieldShouldReturn:(id)sender {
    [self requestAction:nil];
    
}

- (IBAction)verPapeletasEnTabla:(id)sender {
    DCPapeletaTableViewController *papeletaTableViewController = [[DCPapeletaTableViewController alloc] init];
    papeletaTableViewController.papeletas = self.papeletas;
    //UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [self presentViewController:papeletaTableViewController
                       animated:YES
                     completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showPapeletasTableVC"]) {
        DCPapeletaTableViewController *upcomingViewController = (DCPapeletaTableViewController *)[segue destinationViewController];
        upcomingViewController.papeletas = self.papeletas;
    }
}

- (void)requestInfoWithParameters{
    
    NSDictionary * params = @{@"PLACA": self.platesTxtField.text,
                              @"DATA_ORIGIN" : @"Samuel"};
                              
    
    if (!self.bookingAPIConnection) {
        self.bookingAPIConnection = [[APIconnections alloc] init];
    }
    self.bookingAPIConnection.delegate = self;
    [self.bookingAPIConnection checkInfractionsByLicensePlateWithParameters:params];
}


#pragma mark - APIconnectionsDelegate

-(void)checkInfractionsSamuelByLicensePlateDidFinishSuccessfully:(NSArray*)checkInfractionsByLicensePlateResponse{
    if (checkInfractionsByLicensePlateResponse[@"result"]) {
        NSArray * result = checkInfractionsByLicensePlateResponse[@"result"];
        if (!self.papeletas) {
            self.papeletas = [[NSMutableArray alloc] init];
        }else{
            if (self.papeletas.count) {
                [self.papeletas removeAllObjects];
            }
        }
        
        
        for (NSArray * papeleta in result) {
            NSString * placa = [papeleta objectAtIndex:0];
            if ([placa isEqualToString:self.platesTxtField.text]) {
                [self.papeletas addObject:papeleta];
            }
        }
        if ([SVProgressHUD isVisible]) {
            [SVProgressHUD showSuccessWithStatus:NSLocalizedString(@"Consulta finalizada!", nil)];
        }
        self.requestButton.titleLabel.text = @"Borrar";
        if (self.papeletas.count) {
            NSLog(@"Las papeletas son: %@", self.papeletas);
            NSString * papeletasString = [[NSString alloc] init];
            if (self.papeletas.count > 1) {
                papeletasString = @"papeletas";
            }else{
                papeletasString = @"papeleta";
            }
            self.infoTextView.text = [NSString stringWithFormat:@"La placa %@ tiene %lu %@",  self.platesTxtField.text, (unsigned long)self.papeletas.count, papeletasString];
            self.verPapeletasButton.hidden = NO;
        }else{
            self.infoTextView.text = [NSString stringWithFormat:@"La placa %@ no tiene papeletas",  self.platesTxtField.text];
        }
        
    }else{
        NSLog(@"No Results for checkInfractionsByLicensePlateDidFinishSuccessfully");
    }
    
}

-(void)checkInfractionsByLicensePlateDidFinishSuccessfully:(NSDictionary*)checkInfractionsByLicensePlateResponse{
    if (checkInfractionsByLicensePlateResponse[@"result"]) {
        NSArray * result = checkInfractionsByLicensePlateResponse[@"result"];
        if (!self.papeletas) {
            self.papeletas = [[NSMutableArray alloc] init];
        }else{
            if (self.papeletas.count) {
                [self.papeletas removeAllObjects];
            }
        }
        
        
        for (NSArray * papeleta in result) {
            NSString * placa = [papeleta objectAtIndex:0];
            if ([placa isEqualToString:self.platesTxtField.text]) {
                [self.papeletas addObject:papeleta];
            }
        }
        if ([SVProgressHUD isVisible]) {
            [SVProgressHUD showSuccessWithStatus:NSLocalizedString(@"Consulta finalizada!", nil)];
        }
        self.requestButton.titleLabel.text = @"Borrar";
        if (self.papeletas.count) {
            NSLog(@"Las papeletas son: %@", self.papeletas);
            NSString * papeletasString = [[NSString alloc] init];
            if (self.papeletas.count > 1) {
                papeletasString = @"papeletas";
            }else{
                papeletasString = @"papeleta";
            }
            self.infoTextView.text = [NSString stringWithFormat:@"La placa %@ tiene %lu %@",  self.platesTxtField.text, (unsigned long)self.papeletas.count, papeletasString];
            self.verPapeletasButton.hidden = NO;
        }else{
            self.infoTextView.text = [NSString stringWithFormat:@"La placa %@ no tiene papeletas",  self.platesTxtField.text];
        }

    }else{
        NSLog(@"No Results for checkInfractionsByLicensePlateDidFinishSuccessfully");
    }
    
}
-(void)checkInfractionsByLicensePlateDidFinishWithFailure:(NSDictionary*)checkInfractionsByLicensePlateResponse{
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"Consulta fallida", nil)];
    }
}


@end
