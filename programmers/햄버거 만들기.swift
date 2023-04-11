import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var stack = [Int]()
    var result = 0
    for ing in ingredient {
        if ing == 1 {
            if stack.isEmpty || stack.last! != 3 {
                stack.append(ing)
            } else {
                for _ in 0..<3 { stack.removeLast() }
                result += 1
            }
        } else {
            if !stack.isEmpty, stack.last! == ing - 1 {
                stack.append(ing)
            } else {
                stack = []
            }
        }
    }
    return result
}