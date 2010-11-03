//
//  GraphViewController.m
//  iPhoneSampleApp
//
//  Created by ogaoga on 10/11/03.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import "GraphViewController.h"


@implementation GraphViewController

//
// 表示する URL をセットする
//
- (void)setURLString:(NSString*)urlString {
	if ( url == nil ) {
		// URL がインスタンスされていない場合には、インスタンスする。
		url = [[NSMutableString alloc] initWithCapacity:0];
	}
	[url setString:urlString];
}

//
// 閉じる処理
//
- (IBAction)pressDoneButton:(id)sender {
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

//
// ビューが表示される直前に呼び出される
//
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];	// 親クラスの呼び出し。消してはいけない。
	
	// Web View にリクエストを行う。
	if ( url ) {
		NSLog(@"%@", url);
		NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
		[webView loadRequest:request];
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
	// url を解放
	[url release];
	
	// 親クラスの dealloc も忘れずに。
    [super dealloc];
}


@end
