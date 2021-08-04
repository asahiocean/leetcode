# [1162. As Far from Land as Possible](https://leetcode.com/problems/as-far-from-land-as-possible)

### Solution
```swift
class Solution {
    func maxDistance(_ grid: [[Int]]) -> Int {
        var grid = grid
        var lands: [(x: Int, y: Int)] = []
        var dist = 0
        for (i,r) in grid.enumerated() {
            for (y, item) in r.enumerated() {
                if item == 1{
                    grid[i][y] = 0
                    lands.append((i,y))
                } else {
                    grid[i][y] = -1
                }
            }
        }
        
        let rowCount = grid.count
        let columnCount = grid[0].count
        while !lands.isEmpty {
            let point: (x: Int, y: Int) = lands.removeFirst()
            for item: (x: Int, y: Int) in [(0,-1),(0,1),(-1,0),(1,0)] {
                let x = point.x + item.x
                let y = point.y + item.y
                if x >= 0 && x < rowCount && y >= 0 && y < columnCount && grid[x][y] == -1 {
                    let distance: Int = grid[point.x][point.y] + 1
                    grid[x][y] = distance
                    dist = max(distance,dist)
                    lands.append((x,y))
                }
            }
        }
        return (dist == 0) ? -1 : dist
    }
}
```

### Description

<div><p>Given an <code>n x n</code> <code>grid</code>&nbsp;containing only values <code>0</code> and <code>1</code>, where&nbsp;<code>0</code> represents water&nbsp;and <code>1</code> represents land, find a water cell such that its distance to the nearest land cell is maximized, and return the distance.&nbsp;If no land or water exists in the grid, return <code>-1</code>.</p>

<p>The distance used in this problem is the Manhattan distance:&nbsp;the distance between two cells <code>(x0, y0)</code> and <code>(x1, y1)</code> is <code>|x0 - x1| + |y0 - y1|</code>.</p>

<p><strong>Example 1:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2019/05/03/1336_ex1.JPG" style="width: 185px; height: 87px;">
<pre><strong>Input:</strong> grid = [[1,0,1],[0,0,0],[1,0,1]]
<strong>Output:</strong> 2
<strong>Explanation:</strong> The cell (1, 1) is as far as possible from all the land with distance 2.
</pre>

<p><strong>Example 2:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2019/05/03/1336_ex2.JPG" style="width: 184px; height: 87px;">
<pre><strong>Input:</strong> grid = [[1,0,0],[0,0,0],[0,0,0]]
<strong>Output:</strong> 4
<strong>Explanation:</strong> The cell (2, 2) is as far as possible from all the land with distance 4.
</pre>

<p><strong>Constraints:</strong></p>

<ul>
	<li><code>n == grid.length</code></li>
	<li><code>n == grid[i].length</code></li>
	<li><code>1 &lt;= n&nbsp;&lt;= 100</code></li>
	<li><code>grid[i][j]</code>&nbsp;is <code>0</code> or <code>1</code></li>
</ul>
</div>