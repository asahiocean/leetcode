import Foundation

// 278. First Bad Version
// https://leetcode.com/problems/first-bad-version/

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        guard n > 1 else { return n }
        var start = 1, end = n
        while start < end {
            let mid = start + (end - start) / 2
            isBadVersion(mid) ? (end = mid) : (start = mid + 1)
        }
        return isBadVersion(start) ? start : -1
    }
}

class VersionControl {
    
    private var versions: [Int]
    
    init(_ vers: [Int]) {
        self.versions = vers
    }
    
    func isBadVersion(_ version: Int) -> Bool {
        return versions[version - 1] == 1
    }
}
