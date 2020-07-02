import XCTest

import ObfuscationTests

var tests = [XCTestCaseEntry]()
tests += ObfuscationTests.allTests()
XCTMain(tests)
