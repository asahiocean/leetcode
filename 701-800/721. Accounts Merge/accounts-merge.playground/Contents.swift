import Foundation

// 721. Accounts Merge
// https://leetcode.com/problems/accounts-merge/

class Solution {
    private var parents: [Int] = []
    
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        
        parents = [Int](0..<accounts.count)
        
        var dict = [String:Int]() // email to index
        for i in 0..<accounts.count {
            for j in 1..<accounts[i].count {
                let email = accounts[i][j]
                if let id = dict[email] {
                    union(id, i)
                } else {
                    dict[email] = i
                }
            }
        }
        
        var res = [Int:Set<String>]() // index to group
        for acc in accounts {
            let rootId = find(dict[acc[1]]!)
            for i in 1..<acc.count {
                res[rootId, default: Set<String>()].insert(acc[i])
            }
        }
        
        var ans = [[String]]()
        for (k, v) in res {
            let name = accounts[k][0], vs = v.sorted()
            var arr = [name]
            arr.append(contentsOf: vs)
            ans.append(arr)
        }
        return ans
    }
    
    private func union(_ i: Int, _ j: Int) {
        let rootA = find(i), rootB = find(j)
        if rootA != rootB { parents[rootA] = rootB }
    }
    
    private func find(_ i: Int) -> Int {
        var root = i
        while parents[root] != root { root = parents[root] }
        parents[i] = root
        return root
    }
}

// Runtime: 336 ms, faster than 100.00%
// Memory Usage: 16.4 MB, less than 74.36%
