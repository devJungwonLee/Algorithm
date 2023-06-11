import Foundation

func solution(_ n:Int) -> Int {
    let m = 1000000007
    var a = [1, 1, 3, 10, 23, 62, 170]
    if n <= 6 { return a[n] }
    for i in 7...n {
        var sum = a[i-1]
        sum = (sum + 2 * a[i-2]) % m
        sum = (sum + 6 * a[i-3]) % m
        sum = (sum + a[i-4]) % m
        sum = (sum - a[i-6] + m) % m
        a.append(sum)
    }
    return a[n]
}