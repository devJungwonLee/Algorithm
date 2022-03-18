import Foundation
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var arr = [String]()
var dict = [String: Int]()
for i in 0..<n {
    let pokemon = readLine()!
    arr.append(pokemon)
    dict[pokemon] = i + 1
}
for _ in 0..<m {
    let s = readLine()!
    if let num = Int(s) { print(arr[num - 1]) }
    else { print(dict[s]!) }
}