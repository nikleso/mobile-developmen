// задача 1
let s=readLine()!.split(separator:" ").map{Int($0)!}
var a=[[Int]]()
for _ in 0..<s[0]{a.append(readLine()!.split(separator:" ").map{Int($0)!})}
var d=Set<Int>()
for r in a{for n in r{d.insert(n/100);d.insert(n%100/10);d.insert(n%10)}}
for r in a{print(r.map{String($0)}.joined(separator:"   "))}
print("В массиве использовано \(d.count) различных цифр")


// задача 2
var a = [[Int]]()
for _ in 0..<5 {
    a.append(readLine()!.split(separator:" ").map{Int($0)!})
}
var ok = true
for i in 0..<5 {
    for j in i+1..<5 {
        if a[i][j] != a[j][i] {
            ok = false
            break
        }
    }
    if !ok { break }
}
print(ok ? "Симметрична" : "Несимметрична")


// задача 3
let alphabet = ["А","Б","В","Г","Д","Е","Ё","Ж","З","И","Й","К","Л","М","Н","О","П","Р","С","Т","У","Ф","Х","Ц","Ч","Ш","Щ","Ь","Ы","Ъ","Э","Ю","Я"]
let numbers = [21,13,4,20,22,1,25,12,24,14,2,28,9,23,3,29,6,16,15,11,26,5,30,27,8,18,10,33,31,32,19,7,17]
var charToNum = [String:Int]()
for (i,n) in numbers.enumerated() {charToNum[alphabet[i]] = n}

let key = readLine()!.uppercased().map{String($0)}
let text = readLine()!.uppercased().map{String($0)}
var shifts = key.map{charToNum[$0]!}

var result = ""
for (i,c) in text.enumerated() {
    let totalShift = shifts[i % shifts.count]
    guard let originalNum = charToNum[c] else { continue }
    let newNum = (originalNum + totalShift - 1) % 33
    let newIndex = newNum == 0 ? 33 : newNum
    result += alphabet.first{charToNum[$0]! == newIndex} ?? ""
}
print(result)


// задача 4
let a1 = readLine()!.split(separator:" ").map{Int($0)!}
let a2 = readLine()!.split(separator:" ").map{Int($0)!}

var d1 = [Int:Int](), d2 = [Int:Int]()
a1.forEach{d1[$0] = (d1[$0] ?? 0) + 1}
a2.forEach{d2[$0] = (d2[$0] ?? 0) + 1}

var r = [Int]()
for (k,v) in d1 {
    if let c = d2[k] {r += [Int](repeating:k, count:min(v,c))}
}
print(r.sorted())


// задача 5
print("Введите слова через пробел:")
let input = readLine()!

let words = input.split(separator: " ").map { String($0) }.filter { !$0.isEmpty }

var groups = [String: [String]]()
for word in words {
 let sortedWord = String(word.sorted())
 groups[sortedWord, default: []].append(word)
}

let sortedGroups = groups.values
 .map { $0.sorted() }
 .sorted {
 if $0.count == $1.count {
 return $0.first! < $1.first!
 }
 return $0.count > $1.count
 }


print("\nРезультат:")
for group in sortedGroups {
 let formatted = group.map { "\"\($0)\"" }.joined(separator: ", ")
 print(formatted)
}

/* та же задача но без запроса на ввод 
let words = ["eat", "tea", "tan", "ate", "nat", "bat"]
var groups = [String: [String]]()

for word in words {
    let sortedWord = String(word.sorted())
    groups[sortedWord, default: []].append(word)
}

let sortedGroups = groups.values
    .map { $0.sorted() }
    .sorted {
        if $0.count == $1.count {
            return $0.first! < $1.first!
        }
        return $0.count > $1.count
    }

for group in sortedGroups {
    let formatted = group.map { "\"\($0)\"" }.joined(separator: ", ")
    print(formatted)
}
*/


