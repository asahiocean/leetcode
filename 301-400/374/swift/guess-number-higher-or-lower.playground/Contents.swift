import Foundation

// 374. Guess Number Higher or Lower
// https://leetcode.com/problems/guess-number-higher-or-lower/

class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var low = 1, high = n
        
        while low <= high {
            let mid = low + (high - low) / 2
            let res = guess(mid)
            if res == 0 {
                return mid
            } else if res == -1 {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return low
    }
}
