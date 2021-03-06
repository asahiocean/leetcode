# [920. Number of Music Playlists](https://leetcode.com/problems/number-of-music-playlists)

### Solution:
```swift
class Solution {
    func numMusicPlaylists(_ n: Int, _ goal: Int, _ k: Int) -> Int {
        let mod = Int(1e9 + 7)
        
        // songs "n" to form the "goal' playlist
        var dp = [[Int]](repeating: .init(repeating: 0, count: goal + 1), count: n + 1)
        dp[0][0] = 1
        
        for l in 1...goal {
            for s in 1...min(n, l) {
                // new song
                dp[s][l] = dp[s - 1][l - 1] * (n - (s - 1))
                // adding old songs, even though "k" should not be selected
                dp[s][l] += dp[s][l - 1] * max(s - k, 0) % mod
                dp[s][l] %= mod
            }
        }
        return dp[n][goal]
    }
}
```

### Description:

<div><p>Your music player contains <code>n</code>&nbsp;different songs and she wants to listen to <code>goal</code><strong> </strong>(not necessarily different) songs during your trip. &nbsp;You&nbsp;create&nbsp;a playlist so&nbsp;that:</p>

<ul>
	<li>Every song is played at least once</li>
	<li>A song can only be played again only if&nbsp;<code>k</code>&nbsp;other songs have been played</li>
</ul>

<p>Return the number of possible playlists.&nbsp; <strong>As the answer can be very large, return it modulo </strong><code>10<sup>9</sup> + 7</code>.</p>


<div>
<div>
<div>
<p><strong>Example 1:</strong></p>

<pre><strong>Input: </strong>n = <span id="example-input-1-1">3</span>, goal = <span id="example-input-1-2">3</span>, k = <span id="example-input-1-3">1</span>
<strong>Output: </strong><span id="example-output-1">6
<strong>Explanation</strong>: </span><span>There are 6 possible playlists. [1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1].</span>
</pre>

<div>
<p><strong>Example 2:</strong></p>

<pre><strong>Input: </strong>n = <span id="example-input-2-1">2</span>, goal = <span id="example-input-2-2">3</span>, k = <span id="example-input-2-3">0</span>
<strong>Output: </strong><span id="example-output-2">6
</span><span id="example-output-1"><strong>Explanation</strong>: </span><span>There are 6 possible playlists. [1, 1, 2], [1, 2, 1], [2, 1, 1], [2, 2, 1], [2, 1, 2], [1, 2, 2]</span>
</pre>

<div>
<p><strong>Example 3:</strong></p>

<pre><strong>Input: </strong>n = <span id="example-input-3-1">2</span>, goal = <span id="example-input-3-2">3</span>, k = <span id="example-input-3-3">1</span>
<strong>Output: </strong><span id="example-output-3">2
<strong>Explanation</strong>: </span><span>There are 2 possible playlists. [1, 2, 1], [2, 1, 2]</span>
</pre>
</div>
</div>


<p><strong>Note:</strong></p>

<ol>
	<li><code>0 &lt;= k &lt; n &lt;= goal &lt;= 100</code></li>
</ol>
</div>
</div>
</div>
</div>