import Foundation

// 187. Repeated DNA Sequences
// https://leetcode.com/problems/repeated-dna-sequences/

class Solution {
    private let limit: Int = 10
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        
        guard s.count > limit else { return [] }
        
        let ssi = s.startIndex, valid: Set<Character> = ["A", "C", "G", "T"]
        var str = String(s[ssi...s.index(ssi, offsetBy: limit - 1)].filter{ valid.contains($0) })
        
        var result: [String] = []
        
        var uniqset: Set<String> = []
        uniqset.insert(str)
        
        let chars = [Character](s)
        
        for i in limit..<s.count {
            str.removeFirst()
            str.append(chars[i])
            
            if result.contains(str) { continue }
            
            if uniqset.contains(str) {
                result.append(str)
                uniqset.remove(str)
                continue
            }
            uniqset.insert(str)
        }
        return [String](result)
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
