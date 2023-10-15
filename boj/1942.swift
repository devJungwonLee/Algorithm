import Foundation

func second(_ s: String) -> Int {
    return s.components(separatedBy: ":").map { Int($0)! }.reduce(0) { $0 * 60 + $1 }
}

func clockInt(_ x: Int) -> Int {
    return x / 3600 * 10000 + (x % 3600 / 60) * 100 + x % 60
}

for _ in 0..<3 {
    let input = readLine()!.components(separatedBy: " ")
    let start = second(input[0])
    let end = second(input[1])
    var numbers = [Int]()
    if (start <= end) {
        (start...end).forEach { numbers.append(clockInt($0)) }
    } else {
        let upper = second("23:59:59")
        (start...upper).forEach { numbers.append(clockInt($0)) }
        (0...end).forEach { numbers.append(clockInt($0)) }
    }
    print(numbers.filter { $0 % 3 == 0 }.count)
}