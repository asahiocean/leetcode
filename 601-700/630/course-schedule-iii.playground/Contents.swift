import Foundation

// 630. Course Schedule III
// https://leetcode.com/problems/course-schedule-iii/

class Solution {
    func scheduleCourse(_ courses: [[Int]]) -> Int {
        var lhs = 0, rhs = 0, srt = courses.sorted { $0[1] < $1[1] }
        for i in srt.indices {
            let cs0 = srt[i][0]
            if lhs + cs0 <= srt[i][1] {
                lhs += cs0
                rhs += 1
            } else {
                var idx = i
                for j in stride(from: 0, to: i, by: 1) {
                    if srt[j][0] > srt[idx][0] { idx = j }
                }
                if srt[idx][0] > cs0 { lhs = lhs - srt[idx][0] + cs0 }
                srt[idx][0] = -1
            }
        }
        return rhs
    }
}
