import Foundation

// 421. Maximum XOR of Two Numbers in an Array
// https://leetcode.com/problems/maximum-xor-of-two-numbers-in-an-array/

class Solution {
    private class TrieNode {
        var children = [Character:TrieNode]()
    }
    func findMaximumXOR(_ nums: [Int]) -> Int {
        guard let numMax = nums.max() else { return 0 }
        
        let bitmask = (1 << String(numMax, radix: 2).count)
        var strNums = [String](repeating: "", count: nums.count)
        
        for (i,n) in nums.enumerated() {
            var str = String(bitmask | n, radix: 2)
            str.removeFirst()
            strNums[i] = str
        }
        
        let node = TrieNode()
        var value = 0
        
        for n in strNums {
            var node = node
            var xorNode: TrieNode? = node
            var xorCurr = 0
            
            for bit in n {
                if let child = node.children[bit] {
                    node = child
                } else {
                    let newNode = TrieNode()
                    node.children[bit] = newNode
                    node = newNode
                }
                
                let toggled: Character = bit == "1" ? "0" : "1"
                if let xor = xorNode?.children[toggled] {
                    xorCurr = (xorCurr << 1) | 1
                    xorNode = xor
                } else {
                    xorCurr = xorCurr << 1
                    xorNode = xorNode?.children[bit]
                }
            }
            value = max(value, xorCurr)
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.031 (0.033) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The maximum result is 5 XOR 25 = 28.
    func test0() {
        let value = solution.findMaximumXOR([3,10,5,25,2,8])
        XCTAssertEqual(value, 28)
    }
    
    func test1() {
        let value = solution.findMaximumXOR([14,70,53,83,49,91,36,80,92,51,66,70])
        XCTAssertEqual(value, 127)
    }
}

Tests.defaultTestSuite.run()
