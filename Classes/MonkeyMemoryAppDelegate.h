//
//  MonkeyMemoryAppDelegate.h
//  MonkeyMemory
//
//  Created by Ola Lundén on 1/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MonkeyMemoryViewController;

@interface MonkeyMemoryAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MonkeyMemoryViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MonkeyMemoryViewController *viewController;

@end

