import Foundation

let n = Int(readLine()!)!
let str = readLine()!.map { String($0) }
var number = [String: Double]()
let op: Set<String> = ["+", "-", "*", "/"]
var stack = [Double]()

(0..<n).forEach {
    let c = String(UnicodeScalar(UInt8(65 + $0)))
    let num = Double(readLine()!)!
    number[c] = num
}

str.forEach { c in
    if op.contains(c) {
        let b = stack.removeLast()
        let a = stack.removeLast()
        switch c {
            case "+": stack.append(a+b)
            case "-": stack.append(a-b)
            case "*": stack.append(a*b)
            case "/": stack.append(a/b)
            default: break
        }
    } else {
        stack.append(number[c]!)
    }
}
print(String(format: "%.02f", stack[0]))
