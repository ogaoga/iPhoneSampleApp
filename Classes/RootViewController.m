//
//  RootViewController.m
//  iPhoneSampleApp
//
//  Created by ogaoga on 10/10/28.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import "RootViewController.h"

#import "FormViewController.h"

@implementation RootViewController

//
// + ボタンが押されたときの処理
//
- (IBAction)pressAddButton:(id)sender {
	
	// デバッグ出力。
	NSLog(@"Add button pressed.");
	
	// フォームの view controller をインスタンス。
	FormViewController *formViewController
		= [[FormViewController alloc] initWithNibName:@"FormViewController"
											   bundle:nil];
	
	// 保存する配列を渡す。
	[formViewController setRecordsArray:records];

	// modal view として表示。
	[self presentModalViewController:formViewController animated:YES];
	
	// インスタンスしたフォームをリリース
	[formViewController release];
}

#pragma mark -
#pragma mark View lifecycle

//
// view が読み込まれた後に呼び出される処理。
//
- (void)viewDidLoad {
	// 親クラスの viewDidLoad を呼び出す。
	// 消してはいけない。
    [super viewDidLoad];

	// records のインスタンス、初期化。
	records = [[NSMutableArray alloc] init];
}

//
// view が解放された後に呼び出される処理。
//
- (void)viewDidUnload {
	// records を解放。
	[records release];
}

//
// このビューが表示される直前に呼び出される
//
- (void)viewWillAppear:(BOOL)animated {
	// 親クラスの viewWillAppear を呼び出す。
	// 消してはいけない。
    [super viewWillAppear:animated];
	
	// 配列の中身をデバッグ出力
	NSLog(@"%@", [records description]);

	// データの再描画を行う
	// UITableViewController を継承したクラスから TableView に
	// アクセスする場合、下記のように記述する。
	[self.tableView reloadData];
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
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


#pragma mark -
#pragma mark Table view data source

//
// テーブル内のセクションの数を返す。
//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


//
// 指定のセクションの中の行数を返す。
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	/*
    return 0;
	 */

	// 表示する行の数、すなわち records の数を返す。
	return [records count];
}

//
// 指定のセクション、行のセルを返す
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		/*
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		 */
		// セルの種類を変更するため、initWithStyle に渡す値を変更。
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
									   reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.

	// 表示するデータは、配列から呼び出す。
	NSDictionary *record = [records objectAtIndex:indexPath.row];
	
	// 日付を文字列に変換
	NSDate *dateValue = [record objectForKey:@"date"];
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy/MM/dd"];
	NSString *dateString = [formatter stringFromDate:dateValue];
	[formatter release];	// formatter のリリースを忘れずに。
	
	// cell に値をセット
	NSString *noteString = [record objectForKey:@"note"];
	cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", dateString, noteString];
	NSNumber *amountValue = [record objectForKey:@"amount"];
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%d円", [amountValue intValue]];	 

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
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
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

- (void)dealloc {
    [super dealloc];
}


@end

