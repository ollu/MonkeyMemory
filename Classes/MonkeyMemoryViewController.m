//
//  MonkeyMemoryViewController.m
//  MonkeyMemory
//
//  Created by Ola Lundén on 1/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MonkeyMemoryViewController.h"

@implementation MonkeyMemoryViewController

@synthesize uniqueRandomNumbers;

- (IBAction)buttonPressed:(UIButton *)sender {
    NSLog(@"You pressed: %@", sender.titleLabel.text);
}

- (NSMutableArray *)createRandomNumbers {
    
    NSMutableArray *numbersInArray = [NSMutableArray arrayWithCapacity:9];

    // Create array with numbers from 1 to 9
    for ( int i = 1; i < 10; ++i ) {
        [numbersInArray addObject:[NSNumber numberWithInt:i]];
    }
    
    // Scramble the numbers in the array
    for ( int i = 0; i < 9; ++i ) {
        int randNumb = arc4random() % 9;
        [numbersInArray exchangeObjectAtIndex:i withObjectAtIndex:randNumb];
    }
    
    return numbersInArray;
}

- (void)changeButtonLabel:(int)buttonWithLabelTag toNewLabel:(NSNumber *)newLabelText {

    // Convert from NSNumber to NSString
    NSString *aTitle = [NSString stringWithFormat:@"%@", newLabelText];

    UIButton *button = (UIButton *)[self.view viewWithTag:buttonWithLabelTag];
    [button setTitle:aTitle forState:UIControlStateNormal];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

    uniqueRandomNumbers = [self createRandomNumbers];

    for (int i = 0; i < 9; i++) {
        NSString *aTitle = [NSString stringWithFormat:@"%@", [uniqueRandomNumbers objectAtIndex:i]];
        
        UIButton *button = (UIButton *)[self.view viewWithTag:i];
        [button setTitle:aTitle forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
