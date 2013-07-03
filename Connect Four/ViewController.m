//
//  ViewController.m
//  Connect Four
//
//  Created by Jared Bergman on 6/18/13.
//  Copyright (c) 2013 iD Tech Camps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)startNewGame:(id)sender {
    [self performSegueWithIdentifier:@"newGame" sender:sender];
}

@end
