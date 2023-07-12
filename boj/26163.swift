let b = readLine()!.split(separator: " ").map { Int($0)! }
var answer = 0

func f(_ a: [Int], _ k: Int) {
    if k < 0 { return }
    if a.count == 3 || k == 0 {
        let sum = a.map { b[$0 - 1] }.reduce(0, +)
        answer = max(answer, sum)
        return
    }
    for i in 1...5 {
        f(a + [i], k - i)
    }
}

func g(_ a: [Int], _ k: Int) {
    if k < 0 { return }
    if k == 0, a.count < 4 { return }
    if k == 0 {
        let sum = a.map { b[$0 - 1] }.reduce(0, +)
        answer = max(answer, sum)
        return
    }
    for i in 1...5 {
        g(a + [i], k - i)
    }
}

f([], 10)
g([], 15)
print(answer)