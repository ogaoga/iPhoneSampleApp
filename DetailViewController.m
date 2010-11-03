//
//  DetailViewController.m
//  iPhoneSampleApp
//
//  Created by ogaoga on 10/11/03.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import "DetailViewController.h"


@implementation DetailViewController

//
// 扱うデータのインデックスを設定。
//
- (void)setIndex:(int)indexValue {
	index = indexValue;
}

//
// 配列をセット
//
- (void)setRecordsArray:(NSMutableArray*)array {
	records = array;
}

#pragma mark -
#pragma mark View lifecycle

/*
- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
*/

//
// 表示の直前に呼ばれる
//
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	// 表示のリフレッシュ
	[self.tableView reloadData];
	
	// タイトルの設定（日付を表示）
	NSDictionary *record = [records objectAtIndex:index];
	NSDate *dateValue = [record objectForKey:@"date"];
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy/MM/dd"];
	NSString *dateString = [formatter stringFromDate:dateValue];
	[formatter release];	// formatter のリリースを忘れずに。
	self.navigationItem.title = dateString;
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
	// セクションの数は１つ
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	// 表示する項目の数は３つ
    return 3;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		// スタイルを変更
		/*
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		 */
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    
    // 各セルに値を設定。
	NSDictionary *record = [records objectAtIndex:index];
	if ( indexPath.row == 0 ) {
		// 日付の表示
		cell.textLabel.text = @"Date";
		NSDictionary *record = [records objectAtIndex:index];
		NSDate *dateValue = [record objectForKey:@"date"];
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yyyy/MM/dd"];
		NSString *dateString = [formatter stringFromDate:dateValue];
		[formatter release];	// formatter のリリースを忘れずに。
		cell.detailTextLabel.text = dateString;
	}
	else if ( indexPath.row == 1 ) {
		// 金額の表示
		cell.textLabel.text = @"Amount";
		cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", [[record objectForKey:@"amount"] intValue]];
	}
	else if ( indexPath.row == 2 ) {
		// 用途の表示
		cell.textLabel.text = @"Note";
		cell.detailTextLabel.text = [record objectForKey:@"note"];
	}
	else {
	}	
	
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

