import Foundation

func makeNumber(_ num: Int) -> Int {
    var num = num
    var result = ""
    for i in 0..<10 {
        let r = num % 2
        if r == 1 { result = String(i) + result }
        num /= 2   
    }
    return Int(result)!
}

let n = Int(readLine()!)!
if n >= 1023 { print(-1) }
else { print((1..<1024).map { makeNumber($0) }.sorted()[n]) }