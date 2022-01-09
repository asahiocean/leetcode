# [856. Score of Parentheses](https://leetcode.com/problems/score-of-parentheses/)

<div><p>Given a balanced parentheses string <code>s</code>, compute the score of the string based on the following rule:</p>

<ul>
	<li><code>()</code> has score 1</li>
	<li><code>AB</code> has score <code>A + B</code>, where A and B are balanced parentheses strings.</li>
	<li><code>(A)</code> has score <code>2 * A</code>, where A is a balanced parentheses string.</li>
</ul>


<p><strong>Example 1:</strong></p>

<pre><strong>Input:</strong> s = "()"
<strong>Output:</strong> 1
</pre>

<p><strong>Example 2:</strong></p>

<pre><strong>Input:</strong> s = "(())"
<strong>Output:</strong> 2
</pre>

<p><strong>Example 3:</strong></p>

<pre><strong>Input:</strong> s = "()()"
<strong>Output:</strong> 2
</pre>

<p><strong>Example 4:</strong></p>

<pre><strong>Input:</strong> s = "(()(()))"
<strong>Output:</strong> 6
</pre>


<p><strong>Note:</strong></p>

<ol>
	<li><code>s</code> is a balanced parentheses string, containing only <code>(</code> and <code>)</code>.</li>
	<li><code>2 &lt;= s.length &lt;= 50</code></li>
</ol>
</div>