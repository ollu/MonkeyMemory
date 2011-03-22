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
}

@property (nonatomic, retain) NSMutableArray *uniqueRandomNumbers;

- (void)setupButtons;
- (NSMutableArray *)createRandomNumbers;

- (IBAction)buttonPressed:(UIButton *)sender;

@end

