import Foundation

// 204. Count Primes
// https://leetcode.com/problems/count-primes/

class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n < 2 || n == 2 { return 0 } else if n == 3 { return 1 }
        
        var primes = [Bool](repeating: true, count: n)
        primes[0] = false; primes[1] = false; var p: Int = 2
        
        while (p * p) <= n {
            if primes[p] {
                stride(from: (p * p), to: n, by: p).forEach {
                    do { primes[$0] = false }
                }
            }
            p += 1
        }
        return primes.filter{$0}.count
    }
}
