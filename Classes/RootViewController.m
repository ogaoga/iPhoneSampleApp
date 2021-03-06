//
//  RootViewController.m
//  iPhoneSampleApp
//
//  Created by ogaoga on 10/10/28.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import "RootViewController.h"

#import "FormViewController.h"
#import "GraphViewController.h"
#import "DetailViewController.h"

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

/**
 * データを Google Chart API の URL に変換
 * http://code.google.com/intl/ja/apis/chart/index.html
 */
- (NSString*)getGraphURL {
	// 一時的に保存する配列を用意。
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:0];
	NSMutableArray *labels = [NSMutableArray arrayWithCapacity:0];
	// 合計を計算
	int sum = 0;
	for ( NSDictionary *record in records ) {
		sum += [[record objectForKey:@"amount"] intValue];
	}
	if ( sum == 0 ) {
		// 合計が 0 ならば、空文字を返す。
		return @"";
	}
	// 各データを、配列にセット。
	for ( NSDictionary *record in records ) {
		[labels addObject:[record objectForKey:@"note"]];
		[values addObject:[NSString stringWithFormat:@"%d", [[record objectForKey:@"amount"] intValue]*100/sum]];
	}
	// URL に整形。パラメータは、区切り文字で連結する。
	NSString *urlString = [NSString stringWithFormat:@"http://chart.apis.google.com/chart?cht=p3&chd=t:%@&chs=320x120&chl=%@&chtt=合計 %d円",
						   [values componentsJoinedByString:@","],
						   [labels componentsJoinedByString:@"|"],
						   sum];
	// url エンコード
	NSString *encodedURLString = (NSString*)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,  
																					(CFStringRef)urlString,  
																					NULL,  
																					NULL,  
																					kCFStringEncodingUTF8  
																					);
	return [encodedURLString autorelease];
}

/**
 * Graph ボタンを押されたら、Graph View に切り替える。
 */
- (IBAction)pressGraphButton:(id)sender {
	
	// view controller の読み込み
	GraphViewController *controller = [[GraphViewController alloc] initWithNibName:@"GraphViewController"
																			bundle:nil];
	// url を設定する。
	[controller setURLString:[self getGraphURL]];
	
	// トランジッションスタイルのセット。今回はフリップ。
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	// モーダルビューとして呼び出し。
	[self presentModalViewController:controller animated:YES];
	// view controller のリリース
	[controller release];
}

//
// 合計の計算と表示
//
- (void)showSum {
	// 合計の計算と表示。
	// タイトル部分に表示する。
	int sum = 0;
	for ( NSDictionary *record in records ) {
		sum += [[record objectForKey:@"amount"] intValue];
	}
	self.navigationItem.title = [NSString stringWithFormat:@"合計 %d円", sum];	
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
	
	// 合計の計算と表示。
	[self showSum];
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

	// cell のスタイルをセット
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
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

//
// セルが選択されたときに呼ばれる
//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	
	// フォームの view controller をインスタンス。
	DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController"
																						bundle:nil];
	// データの配列と、表示対象のインデックスを指定
	[detailViewController setRecordsArray:records];
	[detailViewController setIndex:indexPath.row];
	
	// navigation controller にプッシュ
	[self.navigationController pushViewController:detailViewController animated:YES];
	
	// インスタンスした view controller をリリース。
	[detailViewController release];
	
	// 選択されたセルのハイライトを解除
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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

