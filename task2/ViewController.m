//
//  Copyright © 2016 LodewijkSikkel. All rights reserved.
//
//  @file: ViewController.m
//  @brief: Populate the table view of the root view controller
//
//  @notes: The table view is updated upon receiving the kEmployeeDirectoryDidUpdateNotification notification

#import "ViewController.h"
#import "Employee.h"
#import "DetailedViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create a temporary placeholder array
    NSArray *tempArray = [[NSArray alloc] initWithObjects:[[Employee alloc] init], nil]; // released automatically by the ARC
    array = tempArray; // copy the pointer to the object
    
    // Initialize the table view
    _tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    
    // Set the table delegate and data source
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    // Subscribe to the kEmployeeDirectoryDidUpdateNotification notification
    [[NSNotificationCenter defaultCenter] addObserverForName:kEmployeeDirectoryDidUpdateNotification
                                                      object:_directory
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note){
                                                      // Point to the directory array
                                                      array = _directory.employees;
                                                      
                                                      // Update the table view
                                                      [self update];
                                                  }];
    
    // Call update function of the EmployeeDirectoy class
    _directory = [[EmployeeDirectory alloc] init];
    [_directory update];
    
    // Add the table
    [self.view addSubview:_tableView];

    // Add a sort button to the navigation bar
    UIBarButtonItem *sortButton = [[UIBarButtonItem alloc] initWithTitle:@"Sort" style:UIBarButtonItemStylePlain target:_directory action:@selector(sort)];
    self.navigationItem.rightBarButtonItem = sortButton;
    
    self.title = @"Employees";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75; // arbitrary
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    // Set the cell
    Employee *employee = [array objectAtIndex:indexPath.row]; // to cast an id to an Employee object
    cell.textLabel.text = employee.name;
    if (employee.name != nil) {
        
        // Create a mutable string
        NSMutableString *detailText = [[NSMutableString alloc] initWithString:[employee formatSalary]];
        
        // Append the birth year
        [detailText appendString:[NSString stringWithFormat:@"\n Born:%lu", (unsigned long)employee.birthYear]];

        // Set the detailed text
        cell.detailTextLabel.text = detailText;
        cell.detailTextLabel.numberOfLines = 0;
        cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Create a detailed view controller instance
    DetailedViewController *detailedViewController = [[DetailedViewController alloc] initWithObject:[array objectAtIndex:indexPath.row]];
    
    // Push the view controller onto the navigation stack
    [self.navigationController pushViewController:detailedViewController animated:true];
    
    // Deselect table view cell
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:true];
}

- (void)update
{
    // Reload the table data
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
