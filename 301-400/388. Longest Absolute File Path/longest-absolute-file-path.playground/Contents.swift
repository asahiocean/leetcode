import Foundation

// 388. Longest Absolute File Path
// https://leetcode.com/problems/longest-absolute-file-path/

class Solution {
    func lengthLongestPath(_ input: String) -> Int {
        guard !input.isEmpty else { return 0 }
        var res = 0, stack = [0]
        
        for var obj in input.components(separatedBy: "\n") {
            var lvl = 0
            while obj.hasPrefix("\t") {
                lvl += 1
                obj = String(Array(obj)[1..<obj.count])
            }
            
            while lvl + 1 < stack.count { stack.removeLast() }
            let len = stack.last! + obj.count + (obj.contains(".") ? 0 : 1)
            stack.append(len)
            if obj.contains(".") { res = max(res, len) }
        }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // We have two files:
    // "dir/subdir1/file1.ext" of length 21
    // "dir/subdir2/subsubdir2/file2.ext" of length 32.
    // We return 32 since it is the longest absolute path to a file.
    func test0() {
        let value = solution.lengthLongestPath("dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext")
        XCTAssertEqual(value, 32)
    }
    
    // We do not have any files, just a single directory named "a".
    func test1() {
        let value = solution.lengthLongestPath("a")
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
