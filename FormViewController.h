//
//  FormViewController.h
//  iPhoneSampleApp
//
//  Created by ogaoga on 10/10/28.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import <UIKit/UIKit.h>

// 編集ではなく、新規の場合には -1 を指定する。
#define INDEX_OF_NEW_DATA (-1)

@interface FormViewController : UIViewController {

	// 日付の入力フィールドの IBOutlet
	IBOutlet UITextField *dateField;
 	// 金額の入力フィールドの IBOutlet
	IBOutlet UITextField *amountField;
	// 用途の入力フィールドの IBOutlet
	IBOutlet UITextField *noteField;
	
	// 配列を参照するポインタ
	NSMutableArray *records;
	// 扱うデータのインデックス
	int index;
}

// キャンセルボタンを押されたときの処理
- (IBAction)pressCancelButton:(id)sender;

// 保存ボタンを押されたときの処理
- (IBAction)pressSaveButton:(id)sender;

// 配列を参照するポインタをセットする処理
- (void)setRecordsArray:(NSMutableArray*)array;

// 扱うデータのインデックスを設定。
- (void)setIndex:(int)indexValue;

@end
