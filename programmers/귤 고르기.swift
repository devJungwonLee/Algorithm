import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var cnt = [Int: Int]()
    tangerine.forEach { 
        if let c = cnt[$0] { cnt[$0] = c + 1 }
        else { cnt[$0] = 1 }
    }
    let sorted = cnt.values.sorted { $0 > $1 }
    var i = 0
    var sum = 0
    while sum < k {
        sum += sorted[i]
        i += 1
    }
    return i
}