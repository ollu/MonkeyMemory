//
//  MonkeyMemoryViewController.h
//  MonkeyMemory
//
//  Created by Ola Lundén on 1/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonkeyMemoryViewController : UIViewController {
    NSMutableArray *uniqueRandomNumbers;
    NSMutableArray *correctOrder;
    NSTimer *timer;
}

@property (nonatomic, retain) NSMutableArray *uniqueRandomNumbers;
@property (nonatomic, retain) NSMutableArray *correctOrder;
@property (nonatomic, retain) NSTimer *timer;

- (void)setupButtons;
- (void)hideLabels;
- (void)init;
- (NSMutableArray *)shuffle:(NSMutableArray *)mutableArray;
- (NSMutableArray *)createArray:(int)withAmoutOfNumbers;

- (IBAction)buttonPressed:(UIButton *)sender;

@end

