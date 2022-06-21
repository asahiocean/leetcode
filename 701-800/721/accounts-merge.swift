import Foundation

// 721. Accounts Merge
// https://leetcode.com/problems/accounts-merge/

class Solution {
    private var arr: [Int] = []
    
    func accountsMerge(_ a: [[String]]) -> [[String]] {
        arr = [Int](a.indices)
        var eid = [String:Int]() // eml:idx
        for i in a.indices {
            for j in 1..<a[i].count {
                let eml = a[i][j]
                if let id = eid[eml] { union(id, i) } else { eid[eml] = i }
            }
        }
        var idg = [Int:Set<String>]() // id:group
        for i in a { for j in 1..<i.count { idg[find(eid[i[1]]!), default: []].insert(i[j]) } }
        return idg.map({ [a[$0][0]] + $1.sorted() })
    }
    
    private func union(_ i: Int, _ j: Int) {
        let idi = find(i), idj = find(j)
        if idi != idj { arr[idi] = idj }
    }
    
    private func find(_ i: Int) -> Int {
        var idx = i
        while arr[idx] != idx { idx = arr[idx] }
        arr[i] = idx
        return idx
    }
}
