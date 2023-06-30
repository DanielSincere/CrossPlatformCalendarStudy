import Foundation

extension Date {
  public func relative(to now: Date) -> String {

    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "en-US")
    calendar.timeZone = TimeZone(identifier: "America/New_York")!
    let minute = calendar.dateComponents([.minute], from: self, to: now).minute ?? 0
    let hour = calendar.dateComponents([.hour], from: self, to: now).hour ?? 0
    let day = calendar.dateComponents([.day], from: self, to: now).day ?? 0
    let weekOfYear = calendar.dateComponents([.weekOfYear], from: self, to: now).weekOfYear ?? 0
    let month = calendar.dateComponents([.month], from: self, to: now).month ?? 0
    let year = calendar.dateComponents([.year], from: self, to: now).year ?? 0

    if year != 0 {
      return format(year: year)
    } else if month != 0 {
      return format(month: month)
    } else if weekOfYear != 0 {
      return format(week: weekOfYear)
    } else if day != 0 {
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
