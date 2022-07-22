import Foundation
let n = Int(readLine()!)!
let num = Int(readLine()!)!
var a = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
let dir = [[-1, 0], [0, 1], [1, 0], [0, -1]]
var d = 0
var row = n/2
var col = n%2 == 0 ? n/2-1 : n/2
var minR = row
var maxR = row
var minC = col
var maxC = col
var coordinates = [Int: (Int, Int)]()
for cnt in 1...(n*n) {
    coordinates[cnt] = (row, col)
    a[row][col] = cnt
    if row < minR || row > maxR || col < minC || col > maxC {
        minR = min(minR, row)
        maxR = max(maxR, row)
        minC = min(minC, col)
        maxC = max(maxC, col)
        d = (d + 1) % 4
    }
    row = row + dir[d][0]
    col = col + dir[d][1]
}
for i in 0..<n {
    for j in 0..<n {
        print(a[i][j], terminator: " ")
    }
    print("")
}
print(coordinates[num]!.0 + 1, coordinates[num]!.1 + 1)