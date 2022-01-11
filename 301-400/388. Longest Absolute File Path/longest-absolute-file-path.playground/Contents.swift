import Foundation

// 388. Longest Absolute File Path
// https://leetcode.com/problems/longest-absolute-file-path/

class Solution {
    func lengthLongestPath(_ input: String) -> Int {
        guard input.count > 0 else { return 0 }
        
        var stack: [Int] = []
        stack.append(0)
        
        var lenTotal = 0
        
        for str in input.components(separatedBy: "\n") {
            var level = 0
            var subStr = str
            
            while subStr.hasPrefix("\t") {
                level += 1
                subStr = String(Array(subStr)[1..<subStr.count])
            }
            
            while level + 1 < stack.count {
                stack.removeLast()
            }
            
            let slashCount = subStr.contains(".") ? 0 : 1
            let len = stack.last! + subStr.count + slashCount
            
            stack.append(len)
            
            if subStr.contains(".") {
                lenTotal = max(lenTotal, len)
            }
        }
        return lenTotal
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
