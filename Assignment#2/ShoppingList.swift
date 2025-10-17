import Foundation

var shoppingList: [String] = []
var isProgramRunning = true;

func displayShoppingList(){
    print("")
    if shoppingList.count==0{
        print("--Your shopping list is empty--")
    }
    for (i, item) in shoppingList.enumerated(){
        print("\(i+1). \(item)")
    }
    print("")
}

func removeItem(id : Int) {
    let id = id - 1
    if id>=0, id<=shoppingList.count-1{
        shoppingList.remove(at : id)
    }else{
        print("The id is out of bound")
    }
}

func addItem(product : String){
    shoppingList.append(product)
}

while isProgramRunning {
    print("""
    ✨Enter a comand number:
    1. Add item
    2. Remove item
    3. Display shopping list
    4. Exit
    """)
    if let input = readLine(){
        switch input {
        case "1":
            print("Please enter the name of product:")
            if let product = readLine(){
                addItem(product: product)
                displayShoppingList()
            }else{
                print("Input is incorrect")
            }
        case "2":
            if shoppingList.count == 0{
                print("You have an empty list, nothing to delete")
            }
            displayShoppingList()
            print("Please enter the number of item you want to delete:")
            if let idStr = readLine(), let id = Int(idStr) {
                removeItem(id : id )
                displayShoppingList()
            }else{
                print("Input is incorrect")
            }
        case "3":
            displayShoppingList()
        case "4":
            isProgramRunning = false
        default:
            print("Enter correct number from 1 to 4")
        }
    }
}