//
//  RootViewController.h
//  iPhoneSampleApp
//
//  Created by ogaoga on 10/10/28.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {

	// 家計簿データを保存する配列。
	// プログラム内で追加、変更があるので Mutable。
	NSMutableArray *records;
}

// + ボタンが押されたときの処理
- (IBAction)pressAddButton:(id)sender;

@end
