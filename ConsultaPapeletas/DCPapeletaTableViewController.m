//
//  DCPapeletaTableViewController.m
//  ConsultaPapeletas
//
//  Created by David Céspedes on 22/02/14.
//  Copyright (c) 2014 LSR Marketing Service. All rights reserved.
//

#import "DCPapeletaTableViewController.h"

@interface DCPapeletaTableViewController ()

@end

@implementation DCPapeletaTableViewController

@synthesize papeletas=_papeletas;



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return self.papeletas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSArray *papeletaAtSection = [self.papeletas objectAtIndex:section];
    return papeletaAtSection.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSDictionary *papeletaAtSection = [self.papeletas objectAtIndex:section];
    return [NSString stringWithFormat:@"Papeleta # %@", papeletaAtSection[@"idPapeleta"]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *papeletaAtSection = [self.papeletas objectAtIndex:indexPath.section];
    // Configure the cell...
    NSString * textStr = [[NSString alloc] init];
    switch (indexPath.row) {
        case 0:
            textStr = @"placa";
            break;
        case 1:
            textStr = @"idInfracion";
            break;
        case 2:
            textStr = @"fechainfracion";
            break;
        case 3:
            textStr = @"nomclasifinfra";
            break;
        case 4:
            textStr = @"nomtipinfra";
            break;
        case 5:
            textStr = @"numerors";
            break;
        case 6:
            textStr = @"sinplaca";
            break;
        case 7:
            textStr = @"macavehi";
            break;
        case 8:
            textStr = @"aniofabri";
            break;
        case 9:
            textStr = @"numdocinfra";
            break;
        case 10:
            textStr = @"apesinfra";
            break;
        case 11:
            textStr = @"nominfra";
            break;
        case 12:
            textStr = @"docprop";
            break;
        case 13:
            textStr = @"nompro";
            break;
        case 14:
            textStr = @"rutaveh";
            break;
        case 15:
            textStr = @"nombreviainfra";
            break;
        case 16:
            textStr = @"distritoinfra";
            break;
            
        default:
            textStr = @"NO DATA : ";
            break;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ : %@", textStr, papeletaAtSection[textStr]];

    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
