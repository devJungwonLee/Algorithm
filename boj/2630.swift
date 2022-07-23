import Foundation
var a = [[Bool]]()
var white = 0
var blue = 0
func find(_ row: Int, _ col: Int, _ size: Int) -> Int {
    if size == 1 { 
        if a[row][col] {
            blue += 1
            return 1
        } else {
            white += 1
            return 0
        }
    } else {
        var results = [Int]()
        results.append(find(row, col, size/2))
        results.append(find(row, col+size/2, size/2))
        results.append(find(row+size/2, col, size/2))
        results.append(find(row+size/2, col+size/2, size/2))
        if results == [1, 1, 1, 1] {
            blue -= 3
            return 1
        } else if results == [0, 0, 0, 0] {
            white -= 3
            return 0
        } else { 
            return -1
        }
    }
}
let n = Int(readLine()!)!
for _ in 0..<n {
    let s = readLine()!.components(separatedBy: " ").map { $0 == "1" ? true : false }
    a.append(s)
}
let _ = find(0, 0, n)
print(white)
print(blue)