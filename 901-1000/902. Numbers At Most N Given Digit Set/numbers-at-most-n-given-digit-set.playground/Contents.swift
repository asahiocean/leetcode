import Foundation

// 902. Numbers At Most N Given Digit Set
// https://leetcode.com/problems/numbers-at-most-n-given-digit-set/

class Solution {
    
    private var memo: [Int:Int] = [:]
    private var upperBound = [Int]()
    private var numbers = [Int]()
    
    func atMostNGivenDigitSet(_ digits: [String], _ n: Int) -> Int {
        upperBound = calcUpperBound(of: n)
        numbers = digits.map { Int($0)!}
        return dfs(0, upperBound.count - 1 , 0)
    }
    
    private func calcUpperBound(of num: Int) -> [Int] {
        var array = [Int]()
        var n = num
        while n > 0 {
            array.append(n % 10)
            n /= 10
        }
        return array
    }
    
    private func dfs(_ preNum: Int,_ cp: Int, _ tarMax: Int ) -> Int {
        guard cp >= 0 else { return 1 }
        
        let key = cp << 32 | (preNum < tarMax && preNum != 0 ? 1 : 0)
        
        guard memo[key] == nil else { return memo[key]! }
        
        let maxNum = preNum < tarMax ? 9 : upperBound[cp]
        
        var curNums = numbers
        if preNum == 0 && cp != 0 { curNums.append(0) }
        
        var value = 0
        for num in curNums where num <= maxNum {
            value += dfs(preNum * 10 + num, cp - 1, tarMax * 10 + upperBound[cp])
        }
        if preNum < tarMax && preNum != 0 { memo[key] = value }
        return value
    }
}
