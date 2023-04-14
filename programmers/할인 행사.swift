import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var result = 0
    var shoppingList = [String: Int]()
    for i in 0..<want.count {
        shoppingList[want[i]] = number[i]
    }
    
    var counts = [String: Int]()
    for i in 0..<10 {
        let item = discount[i]
        if let c = counts[item] { counts[item] = c + 1 }
        else { counts[item] = 1 }
    }
    
    for i in 0...(discount.count - 10) {
        var flag = true
        for item in shoppingList.keys {
            if let c = counts[item] {
                if c < shoppingList[item]! {
                    flag = false
                    break
                }
            } else {
                flag = false
                break
            }
        }
        if flag { result += 1 }
        if i == discount.count - 10 { break }
        let left = discount[i]
        counts[left] = counts[left]! - 1
        let right = discount[i + 10]
        if let c = counts[right] { counts[right] = c + 1 }
        else { counts[right] = 1 }
    }
    return result
}