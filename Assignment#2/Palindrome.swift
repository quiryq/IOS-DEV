func isLetter(_ letter : Character) -> Bool {
    let restring = "[a-zA-Z]+"
        if let re = try? Regex(restring){
            if let _ = "\(letter)".firstMatch(of : re){
                return true
            }
        }
        return false
}

func isPalindrome(_ text : String) -> Bool {
    var i = 0, j=text.count - 1
    while (i<j){
        let leftCharacter =  text[text.index(text.startIndex, offsetBy: i)]
        let rightCharacter = text[text.index(text.startIndex, offsetBy: j)]
        if(!isLetter(leftCharacter)){
            i += 1
            continue
        }
        if(!isLetter(rightCharacter)){
            j -= 1
            continue
        }
        if(leftCharacter.lowercased()==rightCharacter.lowercased()){
            i += 1
            j -= 1
        }else{
            return false
        }
    }
    return true
}

print(isPalindrome("aB!!bb,,  .,. a"))