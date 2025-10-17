func isPrime(_ number : Int ) -> Bool {
    var i : Int = 2;
    let sqrt : Int = Int(Double(number).squareRoot())
    while (i<=sqrt){
        if(number%i==0){
            return false
        }
        i+=1
    }
    return true
} 

for i in 1...100{
    if(isPrime(i)){
        print(i)
    }
}