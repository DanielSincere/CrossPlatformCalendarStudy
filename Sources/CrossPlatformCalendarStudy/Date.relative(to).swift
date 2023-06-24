import Foundation

extension Date {
  public func relative(to now: Date) -> String {

    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "en-US")
    calendar.timeZone = TimeZone(identifier: "America/New_York")!
    let components = calendar.dateComponents([.minute, .hour, .day, .weekOfYear, .month, .year], from: self, to: now)

    if let year = components.year, year != 0 {
      return format(year: year)
    } else if let month = components.month, month != 0 {
      return format(month: month)
    } else if let weekOfYear = components.weekOfYear, weekOfYear != 0 {
      return format(week: weekOfYear)
    } else if let day = components.day, day != 0 {
      return format(day: day)
    } else {
      if self < now {
        return "earlier today"
      } else {
        return "later today"
      }
    }
  }

  private func format(year: Int) -> String {
    if year > 0 {
      return abs(year) == 1
      ? "last year"
      : "\(year) years ago"
    } else {
      return abs(year) == 1
      ? "next year"
      : "in \(abs(year)) years"
    }
  }

  private func format(month: Int) -> String {
    if month > 0 {
      return month == 1
      ? "last month"
      : "\(month) months ago"
    } else {
      return abs(month) == 1
      ? "next month"
      : "in \(abs(month)) months"
    }
  }

  private func format(week: Int) -> String {
    if week > 0 {
      return week == 1
      ? "last week"
      : "\(week) weeks ago"
    } else {
      return abs(week) == 1
      ? "next week"
      : "in \(abs(week)) weeks"
    }
  }

  private func format(day: Int) -> String {

    if day > 0 {
      return day == 1
      ? "yesterday"
      : "\(day) days ago"
    } else {
      return abs(day) == 1
      ? "tomorrow"
      : "in \(abs(day)) days"
    }
  }
}
