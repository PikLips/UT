//
//  UTTests.h
//  UTTests
//
//  Created by Michael Smith on 3/3/11.
//  Copyright 2011 PikLips LLC. 
//  MIT Open Source License, see license.txt for details.
//

#import <SenTestingKit/SenTestingKit.h>
// PikLips: added code --
/* PikLips:
 * Here is the link between the application and the test.  Add the necessary header(s) to identify 
 * the app delegate and view controller(s).  Usually, a project's app delegate header references its
 * view controller headers.
 */
#import "UIViewConstants.h" // PikLips: UIView and UIWindow default property values
#import "UTAppDelegate.h" // PikLips: the app delegate, which includes the viewController and Subview 
#import "UTViewController.h" // PikLips: the viewController and its view 
// PikLips: code ends


@interface UTTests : SenTestCase {
@private
/* PikLips: code begins --
 * Creates the test instances to be tested.
 */
    UTAppDelegate       *testAppDelegate; // PikLips: this is our test instance of the app delegate, including the window
    UTViewController    *testViewController; //PikLips: this is the test instance of the view, created by IB
    UTSubviewController *testSubviewController; // PikLips: this is the test instance of the subview, created in Objective-C
// PikLips: code ends
}

@end
