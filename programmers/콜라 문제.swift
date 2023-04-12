import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var n = n
    var cnt = 0
    while n >= a {
        cnt += (n / a * b)
        n = n % a + (n / a * b)
    }
    return cnt
}