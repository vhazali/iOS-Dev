//: Playground - noun: a place where people can play

var numbers = [20,30,10,2,1,11,6,13]


numbers.map({
    (number: Int) -> Int in
    var result: Int
    if number%2==0 {
        result = 3 * number
    } else {
        result = 0 * number
    }
    return result
})

let sortedNumbers = sorted(numbers) { $0 > $1}

println(sortedNumbers)