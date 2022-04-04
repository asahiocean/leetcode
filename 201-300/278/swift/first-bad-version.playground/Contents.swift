import Foundation

// 278. First Bad Version
// https://leetcode.com/problems/first-bad-version/

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        guard n > 1 else { return n }
        var lhs = 1, rhs = n
        while lhs < rhs {
            let mid = lhs + (rhs - lhs) / 2
            isBadVersion(mid) ? (rhs = mid) : (lhs = mid + 1)
        }
        return isBadVersion(lhs) ? lhs : -1
    }
}

// MARK: - VersionControl -

class VersionControl {
    private var vers: [Int]
    init(_ vers: [Int]) {
        self.vers = vers
    }
    func isBadVersion(_ v: Int) -> Bool {
        return vers[v - 1] == 1
    }
}
