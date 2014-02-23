//
//  DCFirstViewController.h
//  ConsultaPapeletas
//
//  Created by David Céspedes on 22/02/14.
//  Copyright (c) 2014 LSR Marketing Service. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIconnections.h"

@interface DCFirstViewController : UIViewController <APIconnectionsDelegate>

@property (strong, nonatomic) NSMutableArray * papeletas;

@property (weak, nonatomic) IBOutlet UITextView *infoTextView;
@property (weak, nonatomic) IBOutlet UITextField *platesTxtField;
@property (weak, nonatomic) IBOutlet UIButton *requestButton;
@property (weak, nonatomic) IBOutlet UIButton *verPapeletasButton;


- (IBAction)requestAction:(id)sender;
- (IBAction)textFieldShouldReturn:(id)sender;
- (IBAction)verPapeletasEnTabla:(id)sender;


@end
