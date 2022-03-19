import Foundation

// 895. Maximum Frequency Stack
// https://leetcode.com/problems/maximum-frequency-stack/

class FreqStack {
    private var freq: [Int:Int]
    private var dict: [Int:[Int]]
    private var highest: Int
    
    init() {
        freq = [:]
        dict = [:]
        highest = 0
    }
    
    func push(_ x: Int) {
        freq[x, default: 0] += 1
        if freq[x, default: 0] > highest {
            highest = freq[x, default: 0]
        }
        dict[freq[x, default: 0], default: []].append(x)
    }
    
    func pop() -> Int {
        if let last = dict[highest, default: []].popLast() {
            freq[last, default: 1] -= 1
            if dict[highest, default: []].isEmpty {
                highest -= 1
            }
            return last
        }
        return -1
    }
}
