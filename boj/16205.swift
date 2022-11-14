import Foundation

func findOutputs(type: Int, input: String) -> [String] {
    var outputs = [String]()
    if type == 1 {
        outputs.append(input)
        outputs.append(camelToSnake(input))
        outputs.append(camelToPascal(input))
    } else if type == 2 {
        outputs.append(snakeToCamel(input))
        outputs.append(input)
        outputs.append(snakeToPascal(input))
    } else {
        outputs.append(pascalToCamel(input))
        outputs.append(pascalToSnake(input))
        outputs.append(input)
    }
    return outputs
}

func camelToSnake(_ input: String) -> String {
    var output = ""
    for c in input {
        if (65...90) ~= c.asciiValue! {
            output += "_"
            output += String(c.lowercased())
        } else {
            output += String(c)
        }
    }
    return output
}

func snakeToCamel(_ input: String) -> String {
    var output = ""
    var flag = false
    for c in input {
        if String(c) == "_" {
            flag = true
        } else if flag {
            output += String(c.uppercased())
            flag = false
        } else {
            output += String(c.lowercased())
        }
    }
    return output
}

func camelToPascal(_ input: String) -> String {
    var output = input
    let c = output.removeFirst()
    output = String(c.uppercased()) + output
    return output
}

func pascalToCamel(_ input: String) -> String {
    var output = input
    let c = output.removeFirst()
    output = String(c.lowercased()) + output
    return output
}

func snakeToPascal(_ input: String) -> String {
    return camelToPascal(snakeToCamel(input))
}

func pascalToSnake(_ input: String) -> String {
    return camelToSnake(pascalToCamel(input))
}

let s = readLine()!.components(separatedBy: " ")
let type = Int(s[0])!
let input = s[1]
let outputs = findOutputs(type: type, input: input)
for output in outputs { print(output) }
