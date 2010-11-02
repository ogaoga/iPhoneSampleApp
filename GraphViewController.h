//
//  GraphViewController.h
//  iPhoneSampleApp
//
//  Created by ogaoga on 10/11/03.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GraphViewController : UIViewController {
	// 表示するページの URL
	NSMutableString *url;
	// Web view のアウトレット
	IBOutlet UIWebView *webView;
}

// Done ボタンを押したときの処理
- (IBAction)pressDoneButton:(id)sender;
// URL を受け取る変数
- (void)setURLString:(NSString*)urlString;

@end
