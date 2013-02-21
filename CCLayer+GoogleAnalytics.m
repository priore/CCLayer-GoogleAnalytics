//
//  CCScene+GoogleAnalytics.m
//
//  Created by Danilo Priore on 20/02/13.
//  www.prioregroup.com
//

#import "CCLayer+GoogleAnalytics.h"
#import "GAI.h" // Google Analytics SDK

@implementation CCLayer (GoogleAnalytics)

// overwrite original method of CCLayer
- (void)onEnterTransitionDidFinish {
    
    NSString *className = NSStringFromClass([self class]);
    
    // filter only for my classes (in this case the names start with "game")
    if (![[className substringToIndex:4] isEqualToString:@"Game"])
        return;

#ifndef DEBUG
    // track of the specified view was displayed
    [[GAI sharedInstance].defaultTracker sendView:className];
#else
    NSLog(@"Class Name: %@", className);
#endif
    
// original code of CCLayer
#ifdef __CC_PLATFORM_IOS
	if( isAccelerometerEnabled_ )
		[[UIAccelerometer sharedAccelerometer] setDelegate:self];
#endif
    
	[super onEnterTransitionDidFinish];

}

@end
