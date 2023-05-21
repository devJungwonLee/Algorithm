import Foundation

func recursive(_ n: Int, _ l: Int64, _ r: Int64) -> Int {
    var result = 0
    if n == 1 {
        for i in l...r {
            if i != 2 { result += 1 } 
        }
        return result
    }
    let m = Int64(pow(Double(5), Double(n - 1)))
    let ql = l / m
    let qr = r / m
    let rl = l % m
    let rr = r % m
    if ql == qr {
        if ql == 2 { return 0 }
        return recursive(n - 1, rl, rr)
    } else {
        for i in (ql + 1)..<qr {
            if i != 2 { result += Int(pow(Double(4), Double(n - 1))) }
        }
        if ql != 2 { result += recursive(n - 1, rl, m - 1) }
        if qr != 2 { result += recursive(n - 1, 0, rr) }
        return result
    }
}

func solution(_ n:Int, _ l:Int64, _ r:Int64) -> Int {
    return recursive(n, l - 1, r - 1)
}