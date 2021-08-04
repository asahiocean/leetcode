import Foundation

// 71. Simplify Path
// https://leetcode.com/problems/simplify-path/

class Solution {
    func simplifyPath(_ path: String) -> String {
        var stack = Array<String>(), result = ""
        
        let parts = path.split(separator: "/").map{"\("/" + $0)"}
        
        for sub in parts {
            if sub == "/.."  {
                if !stack.isEmpty { stack.removeLast() }
                continue
            }
            if sub == "/." { continue }
            stack.append(sub)
        }
        stack.forEach { result += $0 }
        return result == "" ? "/" : result
    }
}
