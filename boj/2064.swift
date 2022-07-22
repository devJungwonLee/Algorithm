import Foundation

func bitString(of num: [Bool]) -> String {
    var num = num.reduce(UInt32(0)) { $0 * 2 + ($1 ? 1 : 0) }
    var a = [String]()
    for _ in 0..<4 {
        a.insert(String(num % 256), at: 0)
        num /= 256
    }
    return a.joined(separator: ".")
}

extension String {
    func padding() -> String {
        var result = self
        while result.count < 32 {
            result = "0" + result
        }
        return result
    }
}

let n = Int(readLine()!)!
var numbers = [[Bool]]()
for _ in 0..<n {
    let num = readLine()!.components(separatedBy: ".").map { UInt32($0)! }.reduce(UInt32(0)) { $0 * 256 + $1 }
    numbers.append(String(num, radix: 2).padding().map { $0 == "1" } )
}
var mask = [Bool]()
var flag = true
for i in 0..<32 {
    let digit = numbers[0][i]
    var result = true
    for number in numbers {
        if number[i] != digit {
            result = false
            break
        }
    }
    if !result { flag = false }
    if !flag { mask.append(false) }
    else { mask.append(true) }
}
let address = mask.indices.map { numbers[0][$0] && mask[$0] }
print(bitString(of: address))
print(bitString(of: mask))