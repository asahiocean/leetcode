import Foundation

// 210. Course Schedule II
// https://leetcode.com/problems/course-schedule-ii/

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        guard !prerequisites.isEmpty else { return [Int](0..<numCourses) }
        
        var graph = [[Int]](repeating: [Int](), count: numCourses)
        var studied = [Int]()
        var inDgree = [Int](repeating: 0, count: numCourses)
        
        for pre in prerequisites {
            graph[pre[1]].append(pre[0])
            inDgree[pre[0]] += 1
        }
        
        var queue = [Int]()
        
        func inDgreeNull(_ v: Int) {
            if inDgree[v] == 0 { queue.append(v) }
        }
        
        for n in 0..<numCourses {
            inDgreeNull(n)
        }
        
        while !queue.isEmpty {
            let i = queue.removeFirst()
            studied.append(i)
            for k in 0..<graph[i].count {
                let k = graph[i][k]
                inDgree[k] -= 1
                inDgreeNull(k)
            }
        }
        return numCourses == studied.count ? studied : [Int]()
    }
}
