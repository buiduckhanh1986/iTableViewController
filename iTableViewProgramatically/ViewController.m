//
//  ViewController.m
//  iTableViewProgramatically
//
//  Created by Bui Duc Khanh on 11/24/16.
//  Copyright © 2016 Bui Duc Khanh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *data;
}

- (void)viewDidLoad {
    // Khởi tạo data
    data = @[ @{@"Title" : @"Banana", @"SubTitle" : @"Hoa quả miền nhiệt đới", @"Image" : @"Banana.png"}
             ,@{@"Title" : @"Orange", @"SubTitle" : @"Ăn rất chua", @"Image" : @"Orange.png"}
             ,@{@"Title" : @"Peach", @"SubTitle" : @"Nhiều vitamin C", @"Image" : @"Peach.png"}
             ,@{@"Title" : @"Strawberry", @"SubTitle" : @"Ngọt ngào, quyến rũ", @"Image" : @"Strawberry.png"}];

    [super viewDidLoad];
    
    self.title = @"Table View Controller Programmatically";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Thiết lập 1 số thuộc tính
    self.tableView.rowHeight = 70; // Chiều cao
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0); // Biên giới hạn separator
    
}


#pragma mark - Table view data source

// Trả về số section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Trả về số row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [data count];
}


// Thiết lập dữ liệu cho các cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
    }

    NSDictionary* menuItem = data[indexPath.row];
    
    cell.textLabel.text = [menuItem objectForKey:@"Title"];
    cell.detailTextLabel.text = [menuItem objectForKey:@"SubTitle"];
    cell.imageView.image = [UIImage imageNamed:[menuItem objectForKey:@"Image"]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
