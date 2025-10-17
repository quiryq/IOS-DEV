var firstName: String = "Nurdaulet"
var lastName: String = "Mazhitov"
var age: Int = 20
var birthYear: Int = 2005
var isStudent: Bool = true
var height: Double = 1.78


var city: String = "Zhangale"
var country: String = "Kazakhstan" 
var favoriteColor: String = "Pink"
var isRightHanded: Bool = true

let currentYear: Int = 2025
let calculatedAge: Int = currentYear - birthYear



var hobby: String = "Programming"
var numberOfHobbies: Int = 3
var favoriteNumber: Int = 7
var isHobbyCreative: Bool = true


var secondHobby: String = "Books"
var thirdHobby: String = "Gaming"
var sportsActivity: String = "Noting"
var musicGenre: String = "Indie-rock"



let lifeStory: String = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). 
I am currently a student studying iOS development. I am \(height) meters tall and I am from \(city), \(country).
I enjoy \(hobby), which is a creative hobby. I also love \(secondHobby) and \(thirdHobby).
I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber).
My favorite color is \(favoriteColor) and I play \(sportsActivity) in my free time.
I listen to \(musicGenre) music and I am \(isRightHanded ? "right" : "left")-handed.
"""


var futureGoals: String = "In the future, I want to become Game developer."
var dreamJob: String = "Game Designer 👨‍💻"
var favoriteEmoji: String = "🚀"
var motivationalQuote: String = "no pain, no gain"

let completeLifeStory: String = """
\(lifeStory)

\(futureGoals)
My dream job is to be a \(dreamJob).
My favorite emoji is \(favoriteEmoji) and my motto is: \(motivationalQuote)
"""


print(completeLifeStory)

print("Calculated age from birth year: \(calculatedAge)")
print("Student status: \(isStudent ? "Yes, I'm a student!" : "No, I'm not a student")")
