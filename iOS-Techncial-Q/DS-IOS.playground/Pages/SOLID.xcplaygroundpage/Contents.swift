//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// S - Single resposiblity principle

// Bad Example: Violating SRP by mixing user validation and saving logic
class UserManager {
    func validateUser(username: String, password: String) -> Bool {
        // Validation logic
        return username == "admin" && password == "password"
    }
    func saveUser(user: String) {
        // Saving user to database
    }
}

// SRP Example: Separate responsibilities
class UserValidator {
    func validate(username: String, password: String) -> Bool {
        return username == "admin" && password == "password"
    }
}

class UserRepository {
    func save(user: String) {
        // Save user to the database
    }
}

// O - Open/Closed Principle (OCP)'

// Bad Example: Modifying the class for every new payment type
class Payment {
    func processPayment(method: String) {
        if method == "creditCard" {
            // process credit card
        } else if method == "paypal" {
            // process PayPal
        }
    }
}

// Good Examples
protocol PaymentMethod {
    func processPayment()
}

class CreditCardPayment: PaymentMethod {
    func processPayment() {
        print("Processing credit card payment")
    }
}

class PayPalPayment: PaymentMethod {
    func processPayment() {
        print("Processing paypal payment")
    }
}
class PaymentProcessor {
    func processs(payment: PaymentMethod) {
        payment.processPayment()
    }
}
// Example usage:

let creditCard = CreditCardPayment()
let payPal = PayPalPayment()
let paymentProcessor = PaymentProcessor()

paymentProcessor.process(payment: creditCard)  // Output: Processing credit card payment
paymentProcessor.process(payment: payPal)      // Output: Processing PayPal payment


// LSP:

// Bad Examples:
class BaseAccount {
    func makePayment(amount: Double) {
        print("Payment of \(amount) made from BaseAccount")
    }
}

class SavingsAccount: BaseAccount {
    override func makePayment(amount: Double) {
        if amount > 1000 {
            print("Payment limit exceeded for SavingsAccount")
        } else {
            print("Payment of \(amount) made from SavingsAccount")
        }
    }
}
// Good Examples

protocol Account {
    func makePayment(amount: Double)
}
class BaseAccount:Account {
    func makePayment(amount: Double) {
        print("Payment of \(amount) made from BaseAccount")
    }
}

class SavingsAccount: Account {
    func makePayment(amount: Double) {
        print("Payment of \(amount) made from BaseAccount")
    }
}

var baseAccount: Account = BaseAccount()
baseAccount.makePayment(amount: 100.0)

var savingAccount: Account = SavingsAccount()
savingAccount.makePayment(amount: 2000.0)
