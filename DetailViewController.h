//
//  DetailViewController.h
//  iPhoneSampleApp
//
//  Created by ogaoga on 10/11/03.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UITableViewController {
	// 扱うデータのインデックス
	int index;
	// 扱うデータ
	NSArray *records;
}

// 扱うデータのインデックスを設定。
- (void)setIndex:(int)indexValue;

// 配列をセット
- (void)setRecordsArray:(NSMutableArray*)array;


@end
