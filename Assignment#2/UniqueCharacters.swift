func hasUniqueCharacters(_ text: String) -> Bool{
    var characters = Set<Character>()
    for i in text{
        characters.insert(i)
    }
    return text.count == characters.count
}

print(hasUniqueCharacters("hgHf"))