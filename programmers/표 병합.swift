import Foundation

var p = [[[Int]]]()
var a = [[String]]()

func parent(_ x: [Int]) -> [Int] {
    if x == p[x[0]][x[1]] { return x }
    p[x[0]][x[1]] = parent(p[x[0]][x[1]])
    return p[x[0]][x[1]]
}

func update(_ r: Int, _ c: Int, _ value: String) {
    let pa = parent([r, c])
    a[pa[0]][pa[1]] = value
}

func update(_ value1: String, _ value2: String) {
    for i in 1...50 {
        for j in 1...50 {
            let pa = parent([i, j])
            if a[pa[0]][pa[1]] == value1 {
                a[pa[0]][pa[1]] = value2
            }
        }
    }
}

func merge(_ r1: Int, _ c1: Int, _ r2: Int, _ c2: Int) {
    let pa1 = parent([r1, c1])
    let pa2 = parent([r2, c2])
    if pa1 == pa2 { return }
    if a[pa1[0]][pa1[1]].isEmpty {
        p[pa1[0]][pa1[1]] = pa2
    } else {
        p[pa2[0]][pa2[1]] = pa1
    }
}

func unmerge(_ r: Int, _ c: Int) {
    let pa = parent([r, c])
    let value = a[pa[0]][pa[1]]
    var cells = [[Int]]()
    for i in 1...50 {
        for j in 1...50 {
            let x = parent([i, j])
            if x == pa { cells.append([i, j]) }
        }
    }
    for cell in cells {
        p[cell[0]][cell[1]] = [cell[0], cell[1]]
        a[cell[0]][cell[1]] = ""
    }
    a[r][c] = value
}

func printCell(_ r: Int, _ c: Int) -> String {
    let pa = parent([r, c])
    if a[pa[0]][pa[1]].isEmpty { return "EMPTY" }
    else { return a[pa[0]][pa[1]] }
}

func solution(_ commands:[String]) -> [String] {
    var answer = [String]()
    p = [[[Int]]](repeating: [[Int]](repeating: [0, 0], count: 51), count: 51)
    a = [[String]](repeating: [String](repeating: "", count: 51), count: 51)
    for i in 1...50 {
        for j in 1...50 {
            p[i][j] = [i, j]
        }
    }
    for command in commands {
        let s = command.components(separatedBy: " ")
        switch s[0] {
        case "UPDATE":
            if s.count == 3 {
                update(s[1], s[2])
            } else {
                update(Int(s[1])!, Int(s[2])!, s[3])
            }
        case "MERGE":
            merge(Int(s[1])!, Int(s[2])!, Int(s[3])!, Int(s[4])!)
        case "UNMERGE":
            unmerge(Int(s[1])!, Int(s[2])!)
        case "PRINT":
            let output = printCell(Int(s[1])!, Int(s[2])!)
            answer.append(output)
        default:
            break
        }
    }
    return answer
}