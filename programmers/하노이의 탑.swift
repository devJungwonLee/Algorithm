import Foundation

func hanoi(_ from: Int, _ to: Int, _ n: Int) -> [[Int]] {
    if n < 1 { return [] }
    let a = hanoi(from, 6 - from - to, n - 1)
    let b = [[from, to]]
    let c = hanoi(6 - from - to, to, n - 1)
    return a + b + c
}

func solution(_ n:Int) -> [[Int]] {
    return hanoi(1, 3, n)
}