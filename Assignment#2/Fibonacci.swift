func fibonacci(_ number : Int) -> [Int] {
    if(number <= 0){
        return []
    }
    if(number == 1){
        return [1]
    }
    if(number == 2){
        return [1, 1]
    }
    let prevFib = fibonacci(number-1)
    let fib = prevFib + [prevFib[prevFib.count-2] + prevFib[prevFib.count-1]]
    return fib
}

print(fibonacci(9))