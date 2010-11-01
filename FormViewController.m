//
//  FormViewController.m
//  iPhoneSampleApp
//
//  Created by ogaoga on 10/10/28.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import "FormViewController.h"


@implementation FormViewController

/*
//
// 保存する配列をセット
//
- (void)setRecordsArray:(NSMutableArray*)array {
	records = array;
}
 */

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
	
	/*
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

	// 配列に追加する。
	[records addObject:record];
	 */
	
	// 自分自身を閉じる
	[self dismissModalViewControllerAnimated:YES];
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
