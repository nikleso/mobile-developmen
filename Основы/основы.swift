// задача 1
let s1 = "AAADSSSRRTTHAAAA"
var res1 = ""
var i1 = 0
while i1 < s1.count {
    let c = s1[s1.index(s1.startIndex, offsetBy: i1)]
    var count = 1
    while i1 + count < s1.count && s1[s1.index(s1.startIndex, offsetBy: i1 + count)] == c {
        count += 1
    }
    res1 += String(c) + (count > 1 ? String(count) : "")
    i1 += count
}
print(res1)

// задача 2
let s2 = "AASADDSS"
var d = [String: Int]()
for c in s2 {
    d[String(c)] = (d[String(c)] ?? 0) + 1
}
let sortedD = d.sorted { $0.key < $1.key }
for (k, v) in sortedD {
    print("\(k) - \(v)")
}

// задача 3
let n = Int(readLine()!)!
var res3 = ""
var x = n
while x > 0 {
    res3 = String(x % 2) + res3
    x /= 2
}
print(res3)

// задача 4
print("Введите через пробел: число1, число2 и операцию(+,-,*,/)")
let input1 = readLine()!.split(separator: " ")
let a = Double(input1[0])!
let b = Double(input1[1])!
let op = input1[2]

var result1: Double = 0

if op == "+" {
    result1 = a + b
} else if op == "-" {
    result1 = a - b
} else if op == "*" {
    result1 = a * b
} else if op == "/" {
    result1 = a / b
}

print(result1)

// задача 5
let input2 = readLine()!.split(separator: " ")
let n2 = Int(input2[0])!
let x2 = Int(input2[1])!
var y = 0
var result2 = 1

while result2 < n2 {
    y += 1
    result2 *= x2
}

if result2 == n2 {
    print(y)
} else {
    print("Целочисленный показатель не существует")
}

// задача 6
let num1 = Int(readLine()!)!
let num2 = Int(readLine()!)!

if num1 % 2 != 0 {
    if num2 % 2 == 0 {
        print(num1)
    } else {
        print(10 * num1 + num2)
    }
} else if num2 % 2 != 0 {
    print(num2)
} else {
    print("Создать нечетное число невозможно")
}
