//
//  DateTests.swift
//  jsonlogicTests
//

import XCTest
@testable import jsonlogic

class DateTests: XCTestCase {

    func testYearsLessOrEqual() {
        let rule =
        """
        { "years<=" : [{ "var": "temp" }, -18] }
        """
        
        let twentyYearsAgo = Calendar.current.date(byAdding: .year, value: -20, to: Date())!
        var data =
        """
        { "temp": \(twentyYearsAgo.timeIntervalSince1970) }
        """
        XCTAssertEqual(true, try applyRule(rule, to: data))
        
        let oneYearAgo = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
        data =
        """
        { "temp": \(oneYearAgo.timeIntervalSince1970) }
        """
        XCTAssertEqual(false, try applyRule(rule, to: data))
    }
}
