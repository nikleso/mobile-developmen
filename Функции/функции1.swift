// задача 1
import Foundation

let choices = ["камень", "ножницы", "бумага"]

// Выбор компьютера
let computer = Int(arc4random_uniform(3))

// Выбор игрока
print("Выбери: 1 - камень, 2 - ножницы, 3 - бумага")
let player = Int(readLine()!)! - 1

// Вывод выборов
print("Компьютер: \(choices[computer])")
print("Вы: \(choices[player])")

// Определение победителя
if computer == player {
    print("Ничья! Переиграйте.")
} else if (computer == 2 && player == 0) { // Бумага побеждает камень
    print("Бумага обёртывает камень! Вы проиграли!")
} else if (computer == 0 && player == 1) { // Камень побеждает ножницы
    print("Камень затупляет ножницы! Вы проиграли!")
} else if (computer == 1 && player == 2) { // Ножницы побеждают бумагу
    print("Ножницы разрезают бумагу! Вы проиграли!")
} else {
    print("Вы выиграли!")
}


// задача 2
import Foundation

// Правильно объявляем алфавит как массив строк
let alphabet: [String] = [
 "А", "Б", "В", "Г", "Д", "Е", "Ж", "З", "И", "К",
 "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф",
 "Х", "Ц", "Ч", "Ш", "Щ", "Ъ", "Ы", "Ь", "Э", "Ю", "Я"
]

// Создаем таблицу 31x31
var table = [[Int]]()
var counter = 1
for _ in 0..<31 {
    var row = [Int]()
    for _ in 0..<31 {
        row.append(counter)
        counter += 1
    }
    table.append(row)
}

func encrypt(message: String, filler: String) -> String {
    // Обработка сообщения
    let processedMessage = message
        .uppercased()
        .replacingOccurrences(of: "Ё", with: "Е")
        .replacingOccurrences(of: "Й", with: "И")
        .replacingOccurrences(of: " ", with: "")
    
    // Добавляем заполняющий символ, если длина нечетная
    let finalMessage = processedMessage + (processedMessage.count % 2 != 0 ? filler : "")
    
    var result = ""
    
    // Обработка каждой пары символов
    for i in stride(from: 0, to: finalMessage.count, by: 2) {
        let firstChar = String(finalMessage[finalMessage.index(finalMessage.startIndex, offsetBy: i)])
        let secondChar = String(finalMessage[finalMessage.index(finalMessage.startIndex, offsetBy: i + 1)])
        
        guard let row = alphabet.firstIndex(of: firstChar),
              let col = alphabet.firstIndex(of: secondChar) else {
            fatalError("Недопустимый символ в сообщении")
        }
        
        let code = table[row][col]
        result += String(format: "%03d ", code)
    }
    
    return result
}


// Получаем сообщение от пользователя
print("Введите сообщение для шифрования:")
if let input = readLine() {
    let message = input
    let filler = "Я"  // Заполнитель
    
    let encryptedMessage = encrypt(message: message, filler: filler)
    print("Исходное сообщение: \(message)")
    print("Зашифрованное сообщение: \(encryptedMessage)")
    
    // Проверка ЯЯ 
    let testYY = encrypt(message: "ЯЯ", filler: "")
    print("Проверка ЯЯ: \(testYY)")  // Должно вывести 961
} else {
    print("Ошибка при вводе данных")
}

// задача 3
// задача 4
