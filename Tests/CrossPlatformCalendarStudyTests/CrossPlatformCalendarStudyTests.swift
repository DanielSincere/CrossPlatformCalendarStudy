import XCTest
@testable import CrossPlatformCalendarStudy
import Foundation

final class RelativeDateFormattingTests: XCTestCase {

  func testRelativeByFewMinutes() {
    let relativeString = Date(timeIntervalSinceNow: -60 * 5).relative(to: Date())
    XCTAssertEqual(relativeString, "earlier today")
  }

  func testRelativeByFewMinutesInTheFuture() {
    let relativeString = Date(timeIntervalSinceNow: 60 * 5).relative(to: Date())
    XCTAssertEqual(relativeString, "later today")
  }

  // MARK: Days

  func testRelativeByFewDays() {
    let relativeString = Date(timeIntervalSinceNow: -86400 * 5 - 60).relative(to: Date())
    XCTAssertEqual(relativeString, "5 days ago")
  }

  func testRelativeByFewDaysInTheFuture() {
    let relativeString = Date(timeIntervalSinceNow: 86400 * 5 + 60).relative(to: Date())
    XCTAssertEqual(relativeString, "in 5 days")
  }

  func testRelativeByOneDay() {
    let relativeString = Date(timeIntervalSinceNow: -86400 * 1 - 60).relative(to: Date())
    XCTAssertEqual(relativeString, "yesterday")
  }

  func testRelativeByOneDayInTheFuture() {
    let relativeString = Date(timeIntervalSinceNow: 86400 * 1 + 60).relative(to: Date())
    XCTAssertEqual(relativeString, "tomorrow")
  }

  // MARK:Weeks

  func testRelativeByFewWeeks() {
    let relativeString = Date(timeIntervalSinceNow: -86400 * 15 - 60).relative(to: Date())
    XCTAssertEqual(relativeString, "2 weeks ago")
  }

  func testRelativeByFewWeeksInTheFuture() {
    let relativeString = Date(timeIntervalSinceNow: 86400 * 15 + 60).relative(to: Date())
    XCTAssertEqual(relativeString, "in 2 weeks")
  }

  func testRelativeByOneWeek() {
    let relativeString = Date(timeIntervalSinceNow: -86400 * 7 - 60).relative(to: Date())
    XCTAssertEqual(relativeString, "last week")
  }

  func testRelativeByOneWeekInTheFuture() {
    let relativeString = Date(timeIntervalSinceNow: 86400 * 7 + 60).relative(to: Date())
    XCTAssertEqual(relativeString, "next week")
  }

  // MARK: Months

  func testRelativeByFewMonths() {
    let dateA = Date(timeIntervalSinceReferenceDate: 695260766.771354) // Jan 12, 2023
    let dateB = dateA.addingTimeInterval(-86400 * 92 - 60)

    let relativeString = dateB.relative(to: dateA)
    XCTAssertEqual(relativeString, "2 months ago")
  }

  func testRelativeByFewMonthsInTheFuture() {
    let dateA = Date(timeIntervalSinceReferenceDate: 695260766.771354) // Jan 12, 2023
    let dateB = dateA.addingTimeInterval(86400 * 92 + 60)

    let relativeString = dateB.relative(to: dateA)
    XCTAssertEqual(relativeString, "in 3 months")
  }

  func testRelativeByOneMonth() {
    let relativeString = Date(timeIntervalSinceNow: -86400 * 35 - 60).relative(to: Date())
    XCTAssertEqual(relativeString, "last month")
  }

  func testRelativeByOneMonthInTheFuture() {
    let relativeString = Date(timeIntervalSinceNow: 86400 * 35 + 60).relative(to: Date())
    XCTAssertEqual(relativeString, "next month")
  }

  // MARK: Years

  func testRelativeByFewYears() {
    let dateA = Date(timeIntervalSinceReferenceDate: 695260766.771354) // Jan 12, 2023
    let dateB = dateA.addingTimeInterval(-525600 * 60 * 4)

    let relativeString = dateB.relative(to: dateA)
    XCTAssertEqual(relativeString, "3 years ago")
  }

  func testRelativeByFewYearsInTheFuture() {
    let dateA = Date(timeIntervalSinceReferenceDate: 695260766.771354) // Jan 12, 2023
    let dateB = dateA.addingTimeInterval(525600 * 60 * 4 + 60)

    let relativeString = dateB.relative(to: dateA)
    XCTAssertEqual(relativeString, "in 3 years")
  }

  func testRelativeByOneYear() {
    let dateA = Date(timeIntervalSinceReferenceDate: 695260766.771354) // Jan 12, 2023
    let dateB = dateA.addingTimeInterval(525600 * 60 * -1 + -86400 * 50)
    let relativeString = dateB.relative(to: dateA)
    XCTAssertEqual(relativeString, "last year")
  }

  func testRelativeByOneYearInTheFuture() {
    let dateA = Date(timeIntervalSinceReferenceDate: 695260766.771354) // Jan 12, 2023
    let dateB = dateA.addingTimeInterval(525600 * 60 + 86400 * 50)
    let relativeString = dateB.relative(to: dateA)
    XCTAssertEqual(relativeString, "next year")
  }

}
