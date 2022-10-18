let n = Int(readLine()!)!
let a = [2, 3, 5, 7]
let b = [1, 3, 5, 7, 9]

func isPrime(_ num: Int) -> Bool {
    if num == 1 { return false }
    var i = 2
    while i * i <= num {
        if num % i == 0 { return false }
        i += 1
    }
    return true
}

func check(_ depth: Int, _ num: Int) {
    if depth == n {
        print(num)
        return
    }
    if depth == 0 {
        for x in a {
            let newNum = num * 10 + x
            check(depth + 1, newNum)
        }
    } else {
        for x in b {
            let newNum = num * 10 + x
            if isPrime(newNum) {
                check(depth + 1, newNum)
            }
        }
    }
}
check(0, 0)
