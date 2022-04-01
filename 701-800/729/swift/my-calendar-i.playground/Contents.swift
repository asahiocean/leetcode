import Foundation

// 729. My Calendar I
// https://leetcode.com/problems/my-calendar-i/

class MyCalendar {
    
    private var calendars: [[Int]]
    
    init() {
        self.calendars = []
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        for c in calendars where start < c[1] && c[0] < end {
            return false
        }
        calendars.append([start, end])
        return true
    }
}
