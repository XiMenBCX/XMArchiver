//
//  XMArchiverDemoTests.m
//  XMArchiverDemoTests
//
//  Created by 秦正华 on 2019/6/10.
//  Copyright © 2019 秦正华. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUser.h"
#import "XMArchiver.h"

@interface XMArchiverDemoTests : XCTestCase

@end

@implementation XMArchiverDemoTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    TestUser *user = [[TestUser alloc] init];
    user.age = 18;
    user.name = @"xm";
    user.isMan = true;
    
    BOOL result = [user xm_archiveToFileName:@"testUser"];
    XCTAssertTrue(result == true);
    
    TestUser *user2 = [TestUser xm_unarchiveToFileName:@"testUser"];
    XCTAssertTrue([user2.name isEqualToString:user.name]);
    XCTAssertTrue(user2.age == user.age);
    XCTAssertTrue(user2.isMan == user.isMan);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
