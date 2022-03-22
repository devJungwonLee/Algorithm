import Foundation

let div = 10000019
var r = 0
var c = 0
var cnt = [Int]()
var comb = [[Int]]()
var d = [[Int]]()

func makeCombination() {
    comb = [[Int]](repeating: [], count: r + 1)
    for i in 0...r {
        for j in 0...i {
            if j == 0 || j == i { comb[i].append(1) }
            else { comb[i].append((comb[i-1][j-1] + comb[i-1][j]) % div) }
        }
    }
}

func solution(_ a:[[Int]]) -> Int {
    r = a.count
    c = a[0].count
    
    for j in 0..<c {
        var tmp = 0
        for i in 0..<r {
            if a[i][j] == 1 { tmp += 1 }
        }
        cnt.append(tmp)
    }
    
    makeCombination()
    
    d = [[Int]](repeating: [Int](repeating: 0, count: c), count: r + 1)
    for j in 0..<c {
        if j == 0 {
            let num = cnt[j]
            d[r - num][j] = comb[r][num]
            continue
        }
        for i in 0...r {
            if d[i][j-1] == 0 { continue }
            for k in 0...cnt[j] {
                if i < k || r - i < cnt[j] - k { continue }
                let tmp = comb[i][k] * comb[r-i][cnt[j]-k] % div
                let even = i - k + cnt[j] - k
                d[even][j] = (d[even][j] + (d[i][j-1] * tmp % div)) % div
            }
        }
    }
    return d[r][c-1]
}