import Foundation

// 71. Simplify Path
// https://leetcode.com/problems/simplify-path/

class Solution {
    func simplifyPath(_ path: String) -> String {
        var stack: [Substring] = []
        
        for p in path.split(separator: "/") {
            if p == ".." { stack.popLast() }
            else
                if p != "." { stack.append(p) }
        }
        return "/" + stack.joined(separator: "/")
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Note that there is no trailing slash after the last directory name.
    func test0() {
        let value = solution.simplifyPath("/home/")
        XCTAssertEqual(value, "/home")
    }
    
    // Going one level up from the root directory is a no-op, as the root level is the highest level you can go.
    func test1() {
        let value = solution.simplifyPath("/../")
        XCTAssertEqual(value, "/")
    }
    
    // In the canonical path, multiple consecutive slashes are replaced by a single one.
    func test2() {
        let value = solution.simplifyPath("/home//foo/")
        XCTAssertEqual(value, "/home/foo")
    }
}

Tests.defaultTestSuite.run()
