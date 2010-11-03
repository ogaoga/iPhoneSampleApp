//
//  FormViewController.m
//  iPhoneSampleApp
//
//  Created by ogaoga on 10/10/28.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import "FormViewController.h"


@implementation FormViewController

//
// 保存する配列をセット
//
- (void)setRecordsArray:(NSMutableArray*)array {
	records = array;
}

//
// 扱うデータのインデックスを設定。
//
- (void)setIndex:(int)indexValue {
	index = indexValue;
}

//
// キャンセルボタンが押されたときの処理
//
- (IBAction)pressCancelButton:(id)sender {

	// 自分自身を閉じる
	[self dismissModalViewControllerAnimated:YES];
}

//
// 保存ボタンが押されたときの処理
//
- (IBAction)pressSaveButton:(id)sender {

	// 入力値をコンソールに出力してみる。
	NSLog(@"%@ %@ %@", dateField.text, amountField.text, noteField.text);
	
	//
	// 保存処理
	//

	// 日付の保存のため、テキストから日付型に変換する処理。
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy/MM/dd"];
	NSDate *dateValue = [dateFormatter dateFromString:dateField.text];
	[dateFormatter release];
	
	// 金額保存のため、テキストから数値型に変換する処理
	NSNumber *amountValue = [NSNumber numberWithInt:[amountField.text intValue]];

	// NSDictinary を生成
	NSDictionary *record = [NSDictionary dictionaryWithObjectsAndKeys:
							dateValue, @"date",
							amountValue, @"amount",
							noteField.text, @"note", nil];

	// 新規の場合は配列に追加する。
	// 編集の場合は差し替え
	if ( index == INDEX_OF_NEW_DATA ) {
		[records addObject:record];
	}
	else {
		[records replaceObjectAtIndex:index withObject:record];
	}
	
	// 自分自身を閉じる
	[self dismissModalViewControllerAnimated:YES];
}

//
// 初期化時に呼ばれる
//
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		
		// 指定のない場合は、新規のデータとして扱うように、
		// INDEX_OF_NEW_DATA で初期化しておく。
		index = INDEX_OF_NEW_DATA;
    }
    return self;
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

//
// 表示前の処理。編集の場合には、そのデータをセットする。
//
- (void)viewWillAppear:(BOOL)animated {
	if ( index != INDEX_OF_NEW_DATA ) {
		// データの読み出し
		NSDictionary *record = [records objectAtIndex:index];

		//
		//  値を各 text field にセット
		//
		
		// date
		NSDate *dateValue = [record objectForKey:@"date"];
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yyyy/MM/dd"];
		dateField.text = [formatter stringFromDate:dateValue];
		[formatter release];	// formatter のリリースを忘れずに。

		// amount
		amountField.text = [NSString stringWithFormat:@"%d",
					   [[record objectForKey:@"amount"] intValue]];
		
		// note
		noteField.text = [record objectForKey:@"note"];
	}
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
