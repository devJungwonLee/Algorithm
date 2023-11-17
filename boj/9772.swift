while let a = readLine()?.split(separator: " ").map({ Double($0)! }) {
    if a[0] == 0.0 || a[1] == 0.0 { 
        print("AXIS")
        if a[0] == 0.0 && a[1] == 0.0 { break }
    }
    else if a[0] > 0 {
        if a[1] > 0 { print("Q1") }
        else { print("Q4") }
    } else {
        if a[1] > 0 { print("Q2") }
        else { print("Q3") }
    }
}