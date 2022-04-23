import Foundation

// 187. Repeated DNA Sequences
// https://leetcode.com/problems/repeated-dna-sequences/

class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count > 10 else { return [] }
        let ssi = s.startIndex
        var str = String(s[ssi...s.index(ssi, offsetBy: 10 - 1)].filter{ ["A","C","G","T"].contains($0) })
        
        var res = [String](), set = Set<String>()
        set.insert(str)
        
        let arrS = Array(s)
        for i in 10..<s.count {
            str.removeFirst()
            str.append(arrS[i])
            
            if res.contains(str) { continue }
            
            if set.contains(str) {
                res.append(str)
                set.remove(str)
                continue
            }
            set.insert(str)
        }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.015 (0.017) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT")
        XCTAssertEqual(value, ["AAAAACCCCC","CCCCCAAAAA"])
    }
    
    func test1() {
        let value = solution.findRepeatedDnaSequences("AAAAAAAAAAAAA")
        XCTAssertEqual(value, ["AAAAAAAAAA"])
    }
}

Tests.defaultTestSuite.run()
