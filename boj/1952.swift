let dir = [[0, 1], [1, 0], [0, -1], [-1, 0]]
var d = 0
var p = [0, 0]
var count = 1
var change = 0
let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0]
let n = input[1]
var a = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
a[p[0]][p[1]] = true
while count < m * n {
    var next = [p[0] + dir[d][0], p[1] + dir[d][1]]
    if next[0] < 0 || next[0] >= m || next[1] < 0 || next[1] >= n || a[next[0]][next[1]] {
        d = (d + 1) % 4
        next = [p[0] + dir[d][0], p[1] + dir[d][1]]
        change += 1
    }
    a[next[0]][next[1]] = true
    p = next
    count += 1
}
print(change)