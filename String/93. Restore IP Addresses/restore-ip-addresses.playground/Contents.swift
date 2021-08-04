import Foundation

// 93. Restore IP Addresses
// https://leetcode.com/problems/restore-ip-addresses/

class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        let s = Array(s)
        var result: [String] = []
        func helper(_ i: Int, _ arr: inout [String]) {
            guard i != s.count else {
                if arr.count == 4 { result.append(arr.joined(separator: ".")) }
                return
            }
            if arr.count >= 4 { return }
            for end in i ..< min(s.count, i + 3) {
                let text = String(s[i ... end])
                if let num = Int(text), num >= 0, num < 256, "\(num)" == text {
                    arr.append(text)
                    helper(end + 1, &arr)
                    arr.removeLast()
                }
            }
        }
        var array: [String] = []
        helper(0, &array)
        return result
    }
}

import XCTest

// Executed 5 tests, with 0 failures (0 unexpected) in 0.074 (0.077) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.restoreIpAddresses("25525511135")
        XCTAssertEqual(res, ["255.255.11.135","255.255.111.35"])
    }
    func test1() {
        let res = s.restoreIpAddresses("0000")
        XCTAssertEqual(res, ["0.0.0.0"])
    }
    func test2() {
        let res = s.restoreIpAddresses("1111")
        XCTAssertEqual(res, ["1.1.1.1"])
    }
    func test3() {
        let res = s.restoreIpAddresses("010010")
        XCTAssertEqual(res, ["0.10.0.10","0.100.1.0"])
    }
    func test4() {
        let res = s.restoreIpAddresses("101023")
        XCTAssertEqual(res, ["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"])
    }
}

Tests.defaultTestSuite.run()
