//
//  FormViewController.h
//  iPhoneSampleApp
//
//  Created by ogaoga on 10/10/28.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FormViewController : UIViewController {

	// 日付の入力フィールドの IBOutlet
	IBOutlet UITextField *dateField;
 	// 金額の入力フィールドの IBOutlet
	IBOutlet UITextField *amountField;
	// 用途の入力フィールドの IBOutlet
	IBOutlet UITextField *noteField;

}

// キャンセルボタンを押されたときの処理
- (IBAction)pressCancelButton:(id)sender;

 // 保存ボタンを押されたときの処理
- (IBAction)pressSaveButton:(id)sender;

@end
