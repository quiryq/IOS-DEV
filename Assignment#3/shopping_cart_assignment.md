# Shopping Cart System Assignment
**iOS Development Course - Classes & Structs**

---

## 📋 Overview

Build a shopping cart system that demonstrates the difference between **classes** (reference types) and **structs** (value types). You'll create a product catalog, shopping cart functionality, and order processing system.

**Estimated Time:** 4-6 hours  
**Due Date:** Before deadline  
**Total Points:** 100

---

## 🎯 Learning Objectives

By completing this assignment, you will:
- ✅ Understand when to use **structs** vs **classes**
- ✅ Implement **value semantics** and **reference semantics**
- ✅ Use **computed properties** and **methods**
- ✅ Work with **mutating** methods in structs
- ✅ Practice **encapsulation** and **access control**
- ✅ Demonstrate **initialization** patterns

---

## 🏗️ System Architecture

### Architecture Diagram

```
┌─────────────────────────────────────────────────────────┐
│                    Shopping Cart System                 │
└─────────────────────────────────────────────────────────┘
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
        ▼                   ▼                   ▼
   ┌─────────┐        ┌──────────┐       ┌─────────┐
   │ Product │        │ CartItem │       │ Address │
   │ (struct)│        │ (struct) │       │ (struct)│
   └─────────┘        └──────────┘       └─────────┘
        │                   │
        │                   │
        └──────────┬────────┘
                   │
                   ▼
            ┌─────────────┐
            │ShoppingCart │
            │   (class)   │◄──────┐
            └─────────────┘       │
                   │              │
                   │              │
                   ▼              │
              ┌─────────┐    ┌────────┐
              │  Order  │    │  User  │
              │ (struct)│    │ (class)│
              └─────────┘    └────────┘
```

### Type Selection Rationale

| Type | Class/Struct | Why? |
|------|--------------|------|
| **Product** | `struct` | No identity needed, pure data, can be copied freely |
| **CartItem** | `struct` | Value type, represents quantity of a product |
| **ShoppingCart** | `class` | Has identity, needs to be shared across app, mutable state |
| **Order** | `struct` | Immutable record/snapshot, no identity needed |
| **Address** | `struct` | Pure data, no behavior, can be copied |
| **User** | `class` | Has identity, persists across app lifecycle |

---

## 📝 Assignment Parts

### Part 1: Product Models (35 points)

#### 1.1 Product Struct

**Requirements:**
- Create a `Product` struct with appropriate properties
- Implement a `Category` enum
- Add computed property for formatted price display
- Make sure properties are correctly mutable/immutable

**Template:**

```swift
// TODO: Implement Product struct
struct Product {
    // TODO: Add properties
    // - id: String (unique identifier)
    // - name: String
    // - price: Double (must be positive)
    // - category: Category enum
    // - description: String
    
    // TODO: Define Category enum
    enum Category {
        // Add cases: electronics, clothing, food, books
    }
    
    // TODO: Add computed property
    var displayPrice: String {
        // Format price as currency string (e.g., "$19.99")
    }
    
    // TODO: Add initializer with validation
    // Ensure price is positive, throw error or use failable init
}
```

**Diagram:**
```
┌─────────────────────────┐
│       Product           │
│       (struct)          │
├─────────────────────────┤
│ + id: String            │
│ + name: String          │
│ + price: Double         │
│ + category: Category    │
│ + description: String   │
├─────────────────────────┤
│ + displayPrice: String  │ (computed)
└─────────────────────────┘
```

#### 1.2 CartItem Struct

**Requirements:**
- Links a product with a quantity
- Calculate subtotal based on product price and quantity
- Implement `mutating` method to update quantity
- Validate quantity (must be > 0)

**Template:**

```swift
// TODO: Implement CartItem struct
struct CartItem {
    // TODO: Add properties
    // - product: Product
    // - quantity: Int (must be positive)
    
    // TODO: Add computed property for subtotal
    var subtotal: Double {
        // Calculate: product.price * quantity
    }
    
    // TODO: Add mutating method to update quantity
    mutating func updateQuantity(_ newQuantity: Int) {
        // Validate newQuantity > 0
        // Update quantity
    }
    
    // TODO: Add method to increase quantity
    mutating func increaseQuantity(by amount: Int) {
        // Add to existing quantity
    }
}
```

**Diagram:**
```
┌─────────────────────────┐
│      CartItem           │
│       (struct)          │
├─────────────────────────┤
│ + product: Product      │
│ + quantity: Int         │
├─────────────────────────┤
│ + subtotal: Double      │ (computed)
│ + updateQuantity()      │ (mutating)
│ + increaseQuantity()    │ (mutating)
└─────────────────────────┘
```

---

### Part 2: Shopping Cart Class (35 points)

**Requirements:**
- Use `class` because cart identity matters and should be shared
- Manage array of `CartItem`
- Implement add/remove/update operations
- Calculate totals with optional discount
- Use `private(set)` for proper encapsulation

**Template:**

```swift
// TODO: Implement ShoppingCart class
class ShoppingCart {
    // TODO: Add properties
    // - items: [CartItem] (private set, public get)
    // - discountCode: String? (optional)
    
    // TODO: Implement initializer
    init() {
        // Initialize empty cart
    }
    
    // TODO: Add item to cart
    func addItem(product: Product, quantity: Int = 1) {
        // Check if product already exists in cart
        // If yes: update quantity
        // If no: add new CartItem
    }
    
    // TODO: Remove item from cart
    func removeItem(productId: String) {
        // Remove CartItem with matching product.id
    }
    
    // TODO: Update item quantity
    func updateItemQuantity(productId: String, quantity: Int) {
        // Find item and update quantity
        // If quantity is 0, remove item
    }
    
    // TODO: Clear all items
    func clearCart() {
        // Remove all items
    }
    
    // TODO: Computed property for subtotal
    var subtotal: Double {
        // Sum all item subtotals
    }
    
    // TODO: Computed property for discount amount
    var discountAmount: Double {
        // Calculate discount based on discountCode
        // Example: "SAVE10" = 10% off, "SAVE20" = 20% off
    }
    
    // TODO: Computed property for total
    var total: Double {
        // subtotal - discountAmount
    }
    
    // TODO: Computed property for item count
    var itemCount: Int {
        // Total number of individual items (sum of quantities)
    }
    
    // TODO: Check if cart is empty
    var isEmpty: Bool {
        // Return true if no items
    }
}
```

**Diagram:**
```
┌────────────────────────────────┐
│       ShoppingCart             │
│         (class)                │
├────────────────────────────────┤
│ - items: [CartItem]            │ (private set)
│ + discountCode: String?        │
├────────────────────────────────┤
│ + addItem(product, quantity)   │
│ + removeItem(productId)        │
│ + updateItemQuantity()         │
│ + clearCart()                  │
│ + subtotal: Double             │ (computed)
│ + discountAmount: Double       │ (computed)
│ + total: Double                │ (computed)
│ + itemCount: Int               │ (computed)
│ + isEmpty: Bool                │ (computed)
└────────────────────────────────┘
```

---

### Part 3: Order & Address (20 points)

#### 3.1 Address Struct

**Template:**

```swift
// TODO: Implement Address struct
struct Address {
    // TODO: Add properties
    // - street: String
    // - city: String
    // - zipCode: String
    // - country: String
    
    // TODO: Add computed property for formatted address
    var formattedAddress: String {
        // Return multi-line formatted address
    }
}
```

#### 3.2 Order Struct

**Requirements:**
- Immutable snapshot of cart at checkout time
- Cannot be modified after creation
- All properties should be `let` (constants)

**Template:**

```swift
// TODO: Implement Order struct
struct Order {
    // TODO: Add properties (all should be 'let')
    // - orderId: String (generate UUID)
    // - items: [CartItem] (copy from cart)
    // - subtotal: Double
    // - discountAmount: Double
    // - total: Double
    // - timestamp: Date
    // - shippingAddress: Address
    
    // TODO: Implement initializer
    init(from cart: ShoppingCart, shippingAddress: Address) {
        // Create immutable snapshot of cart
        // Generate unique orderId
        // Set timestamp to now
        // Copy all values from cart
    }
    
    // TODO: Add computed property
    var itemCount: Int {
        // Total number of items in order
    }
}
```

**Diagram:**
```
┌────────────────────────────┐
│         Order              │
│        (struct)            │
├────────────────────────────┤
│ + orderId: String          │
│ + items: [CartItem]        │
│ + subtotal: Double         │
│ + discountAmount: Double   │
│ + total: Double            │
│ + timestamp: Date          │
│ + shippingAddress: Address │
├────────────────────────────┤
│ + itemCount: Int           │ (computed)
└────────────────────────────┘
```

---

### Part 4: Testing & Demonstrations (10 points)

Create a test file that demonstrates all functionality. You must show:

**Required Test Scenarios:**

```swift
// TODO: Create test scenarios

// 1. Create sample products
let laptop = Product(...)
let book = Product(...)
let headphones = Product(...)

// 2. Test adding items to cart
let cart = ShoppingCart()
cart.addItem(product: laptop, quantity: 1)
cart.addItem(product: book, quantity: 2)

// 3. Test adding same product twice (should update quantity)
cart.addItem(product: laptop, quantity: 1)
// Verify laptop quantity is now 2

// 4. Test cart calculations
print("Subtotal: \(cart.subtotal)")
print("Item count: \(cart.itemCount)")

// 5. Test discount code
cart.discountCode = "SAVE10"
print("Total with discount: \(cart.total)")

// 6. Test removing items
cart.removeItem(productId: book.id)

// 7. Demonstrate REFERENCE TYPE behavior
func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: headphones, quantity: 1)
}
modifyCart(cart)
// Verify original cart was modified

// 8. Demonstrate VALUE TYPE behavior
let item1 = CartItem(product: laptop, quantity: 1)
var item2 = item1
item2.updateQuantity(5)
// Verify item1.quantity is still 1 (not affected)

// 9. Create order from cart
let address = Address(...)
let order = Order(from: cart, shippingAddress: address)

// 10. Modify cart after order creation
cart.clearCart()
// Verify order still contains original items (immutable snapshot)

print("Order items count: \(order.itemCount)") // Should not be 0
print("Cart items count: \(cart.itemCount)")   // Should be 0
```

---

## 🎁 Bonus Challenges

### Bonus 1: User Class

```swift
// TODO: Implement User class
class User {
    let userId: String
    let name: String
    let email: String
    private(set) var orderHistory: [Order]
    
    // Add method to place order
    func placeOrder(_ order: Order) {
        // Add order to history
    }
    
    // Computed property for total spent
    var totalSpent: Double {
        // Sum all order totals
    }
}
```

### Bonus 2: Advanced Discount System

Implement different discount types:
```swift
enum DiscountType {
    case percentage(Double)  // 10% off
    case fixedAmount(Double) // $5 off
    case buyXGetY(buy: Int, get: Int) // Buy 2 Get 1 Free
}
```

### Bonus 3: Product Inventory

Add stock management:
```swift
// Modify Product to include stock
var stockQuantity: Int

// Modify ShoppingCart to check stock
func addItem(product: Product, quantity: Int) -> Bool {
    // Return false if insufficient stock
}
```

---

## 📤 Submission Requirements

### What to Submit:

1. **Swift Playground** or **Xcode Project** with:
   - All implemented structs and classes
   - Complete test scenarios
   - Comments explaining your code

2. **README.md** file (300-500 words) answering:
   - **Why did you choose class for ShoppingCart?**
   - **Why did you choose struct for Product and Order?**
   - **Explain one example where reference semantics matter in your code**
   - **Explain one example where value semantics matter in your code**
   - **What challenges did you face and how did you solve them?**

3. **Optional:** Screenshot or screen recording of your code running

### File Structure:
```
ShoppingCartAssignment/
├── Sources/
│   ├── Product.swift
│   ├── CartItem.swift
│   ├── ShoppingCart.swift
│   ├── Order.swift
│   ├── Address.swift
│   └── Tests.swift
└── README.md
```

---

## 📊 Grading Rubric

| Category | Points | Criteria |
|----------|--------|----------|
| **Correct Type Choice** | 25 | Used struct/class appropriately with clear reasoning |
| **Implementation** | 35 | Code works correctly, handles edge cases, no crashes |
| **Code Quality** | 20 | Clean code, proper naming, good structure, comments |
| **Testing** | 10 | All required scenarios demonstrated clearly |
| **Documentation** | 10 | README answers all questions with good explanations |
| **TOTAL** | 100 | |

### Detailed Grading Criteria:

**A (90-100):** All requirements met, excellent code quality, thorough testing, clear understanding of concepts

**B (80-89):** Most requirements met, good code quality, adequate testing, good understanding

**C (70-79):** Basic requirements met, acceptable code quality, basic testing, basic understanding

**D (60-69):** Some requirements missing, poor code quality, incomplete testing

**F (<60):** Many requirements missing or not working

---

## 💡 Tips for Success

1. **Start with structs and classes separately** - Get Product and CartItem working before moving to ShoppingCart

2. **Test frequently** - Don't write everything at once. Test each method as you implement it

3. **Use print statements** - Debug by printing values to see what's happening

4. **Think about mutability** - When do you need `var` vs `let`? When do you need `mutating`?

5. **Edge cases matter** - What happens with negative quantities? Empty cart? Invalid discount codes?

6. **Read the error messages** - Swift's compiler errors are helpful! They often tell you exactly what's wrong

7. **Ask questions** - If you're stuck, ask for clarification during office hours

---

## 📚 Resources

- [Swift Documentation - Structures and Classes](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)
- [Swift Documentation - Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
- [Swift Documentation - Methods](https://docs.swift.org/swift-book/LanguageGuide/Methods.html)
- [Choosing Between Structures and Classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes)

---

## ❓ FAQ

**Q: Can I add more features beyond the requirements?**  
A: Yes! Extra features can earn bonus points if they demonstrate advanced understanding.

**Q: Should I create a user interface?**  
A: Not required, but you can create a simple SwiftUI interface if u want.

**Q: How should I handle errors (like negative prices)?**  
A: Use either assertions, guard statements, or failable initializers - document your choice.

**Q: Can I use external libraries?**  
A: No, use only Swift standard library for this assignment.

**Q: What should I do if I'm stuck?**  
A: Review lecture materials, check the resources above, and attend office hours!

---

**Good luck! 🚀**

Remember: The goal is to understand **why** we choose classes vs structs, not just to make the code work. Focus on demonstrating that understanding in your README!