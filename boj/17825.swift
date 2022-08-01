import Foundation

struct Point {
    let blue: Int
    let red: Int
    let point: Int
}

var points = [
    Point(blue: 1, red: 1, point: 0),
    Point(blue: 2, red: 2, point: 2),
    Point(blue: 3, red: 3, point: 4),
    Point(blue: 4, red: 4, point: 6),
    Point(blue: 5, red: 5, point: 8),
    Point(blue: 6, red: 9, point: 10),
    Point(blue: 7, red: 7, point: 13),
    Point(blue: 8, red: 8, point: 16),
    Point(blue: 24, red: 24, point: 19),
    Point(blue: 10, red: 10, point: 12),
    Point(blue: 11, red: 11, point: 14),
    Point(blue: 12, red: 12, point: 16),
    Point(blue: 13, red: 13, point: 18),
    Point(blue: 14, red: 16, point: 20),
    Point(blue: 15, red: 15, point: 22),
    Point(blue: 24, red: 24, point: 24),
    Point(blue: 17, red: 17, point: 22),
    Point(blue: 18, red: 18, point: 24),
    Point(blue: 19, red: 19, point: 26),
    Point(blue: 20, red: 20, point: 28),
    Point(blue: 21, red: 27, point: 30),
    Point(blue: 22, red: 22, point: 28),
    Point(blue: 23, red: 23, point: 27),
    Point(blue: 24, red: 24, point: 26),
    Point(blue: 25, red: 25, point: 25),
    Point(blue: 26, red: 26, point: 30),
    Point(blue: 31, red: 31, point: 35),
    Point(blue: 28, red: 28, point: 32),
    Point(blue: 29, red: 29, point: 34),
    Point(blue: 30, red: 30, point: 36),
    Point(blue: 31, red: 31, point: 38),
    Point(blue: 32, red: 32, point: 40),
    Point(blue: -1, red: -1, point: 0),
]

var choice = [Int](repeating: 0, count: 10)
let dice = readLine()!.components(separatedBy: " ").map { Int($0)! }
var answer = 0

func dfs(_ depth: Int) {
    if depth == 10 {
        var sum = 0
        var mals = [0, 0, 0, 0]
        for i in 0..<10 {
            let idx = choice[i]
            let cnt = dice[i]
            var p = mals[idx]
            if p == 32 { return }
            for j in 1...cnt {
                if j == 1 { p = points[p].blue }
                else { p = points[p].red }
                if p == 32 { break }
            }
            for j in 0..<4 {
                if idx != j && p != 32 && p == mals[j] { return }
            }
            mals[idx] = p
            sum += points[p].point
        }
        answer = max(answer, sum)
        return
    }
    for i in 0..<4 {
        choice[depth] = i
        dfs(depth + 1)
    }
}

dfs(0)
print(answer)