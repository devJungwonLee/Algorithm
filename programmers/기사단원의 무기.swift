import Foundation

func numOfDivisor(_ num: Int) -> Int {
    if num == 1 { return 1 }
    var cnt = 0
    var i = 1

    while i*i <= num {
        if num % i == 0 {
            cnt += 2
            if i*i == num { cnt -= 1 }
        }
        i += 1
    }
    return cnt
}

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var result = 0
    for num in (1...number) {
        let cnt = numOfDivisor(num)
        result += (cnt > limit ? power : cnt)
    }
    return result
}