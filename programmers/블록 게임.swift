import Foundation

struct Rect {
    var r1: Int
    var c1: Int
    var r2: Int
    var c2: Int
}

var b = [[Int]]()
var blocks = [Int: Rect]()
var blanks = [Int: [(Int, Int)]]()
var answer = 0

func findBlank(_ block: Rect, _ num: Int) {
    let width = block.c2 - block.c1 + 1
    if width == 3 {
        for j in block.c1...block.c2 {
            if b[block.r1][j] != num { blanks[num]!.append((block.r1, j)) }
        }
    } else {
        if b[block.r1][block.c1] != num, b[block.r1+1][block.c1] != num {
            blanks[num]!.append((block.r1+1, block.c1))
        }
        if b[block.r1][block.c2] != num, b[block.r1+1][block.c2] != num {
            blanks[num]!.append((block.r1+1, block.c2))
        }
    }
}

func canErase(_ num: Int) -> Bool {
    if let blank = blanks[num], !blank.isEmpty {
        for (r, c) in blank {
            var i = r
            while i >= 0 {
                if b[i][c] != 0 { return false }
                i -= 1
            }
        }
        return true
    } else { return false }
}

func erase(_ num: Int) {
    guard let block = blocks[num] else { return }
    for i in block.r1...block.r2 {
        for j in block.c1...block.c2 {
            if b[i][j] == num { b[i][j] = 0 }
        }
    }
}

func solution(_ board:[[Int]]) -> Int {
    b = board
    for i in 0..<board.count {
        for j in 0..<board.count {
            if board[i][j] == 0 { continue }
            let num = board[i][j]
            if let block = blocks[num] {
                blocks[num]!.r1 = min(block.r1, i)
                blocks[num]!.c1 = min(block.c1, j)
                blocks[num]!.r2 = max(block.r2, i)
                blocks[num]!.c2 = max(block.c2, j)
            } else {
                blocks[num] = Rect(r1: i, c1: j, r2: i, c2: j)
                blanks[num] = []
            }
            
        }
    }
    for (i, block) in blocks { findBlank(block, i) }
    for i in 0..<b.count {
        for j in 0..<b.count {
            if b[i][j] == 0 { continue }
            let num = b[i][j]
            if canErase(num) {
                erase(num)
                answer += 1
            }
        }
    }
    return answer
}