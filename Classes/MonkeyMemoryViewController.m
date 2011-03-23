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
@synthesize correctOrder;
@synthesize timer;
@synthesize clickCount;

- (IBAction)buttonPressed:(UIButton *)sender {
    
    clickCount++;
    
    if ([sender.titleLabel.text isEqual:[NSString stringWithFormat:@"%@", [correctOrder objectAtIndex:0]]]) {
        [correctOrder removeObjectAtIndex:0];
        sender.enabled = NO;
    }
    
    if (![correctOrder lastObject]) {
		NSString *windowTitle = @"Du klarade det!";
		NSString *gameResult = [NSString stringWithFormat:@"Du behövde %d klick \nför att hitta alla siffrorna.\nFörsök igen och \nförbättra ditt resultat.", clickCount];
		NSString *newGame = @"Givet!";
        
        UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:windowTitle
                                                        message:gameResult	
                                                       delegate:self 
                                              cancelButtonTitle:newGame 
                                              otherButtonTitles: nil] autorelease];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self resetAndNewGame];
    }
}

- (NSMutableArray *)createArray:(int)withAmoutOfNumbers {
    NSMutableArray *numbersInArray = [NSMutableArray arrayWithCapacity:withAmoutOfNumbers];
    
    // Create array with numbers from 1 to withAmoutOfNumbers
    for ( int i = 1; i < withAmoutOfNumbers+1; ++i ) {
        [numbersInArray addObject:[NSNumber numberWithInt:i]];
    }
    
    return numbersInArray;    
}

- (NSMutableArray *)shuffle:(NSMutableArray *)mutableArray {
    // Scramble the numbers in the array
    for ( int i = 0; i < 9; ++i ) {
        int randNumb = arc4random() % 9;
        [mutableArray exchangeObjectAtIndex:i withObjectAtIndex:randNumb];
    }
    return mutableArray;
}

- (void)setupButtons {

    uniqueRandomNumbers = [self shuffle:[self createArray:9]];
    
    for (int i = 1; i < 10; i++) {
        NSString *aTitle = [NSString stringWithFormat:@"%@", [uniqueRandomNumbers objectAtIndex:i-1]];
        
        UIButton *button = (UIButton *)[self.view viewWithTag:i];
        [button setTitle:aTitle forState:UIControlStateNormal];
        [button setTitle:aTitle forState:UIControlStateDisabled];
    }
}

- (void)hideLabels {
    for (int i = 1; i < 10; i++) {
        
        UIButton *button = (UIButton *)[self.view viewWithTag:i];
        [button setTitle:@"" forState:UIControlStateNormal];
    }
}

- (void)init {
    [self setupButtons];
    self.correctOrder = [self createArray:9];
    self.clickCount = 0;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:2 
                                             target:self 
                                           selector:@selector(hideLabels) 
                                           userInfo:nil 
                                            repeats:NO];    
}

- (void)resetAndNewGame {
    for (int i = 1; i < 10; i++) {   
        UIButton *button = (UIButton *)[self.view viewWithTag:i];
        button.enabled = YES;
    }
    [self init];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    [self init];
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
    [uniqueRandomNumbers release];
    [correctOrder release];
    [timer release];
}

@end
