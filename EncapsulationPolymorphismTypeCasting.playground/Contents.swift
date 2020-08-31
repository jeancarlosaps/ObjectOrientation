// MARK: - EMCAPSULAMENTO

class CreditCard {
    
    // MARK: - Properties
    
    let number: String
    let limit: Double
    private var invoiceValue: Double = 0
    let iof: Double = 6.38
    
    init(number: String, limit: Double) {
        self.number = number
        self.limit = limit
    }
    
    // MARK: - Methods
    
    final func makePurchase(off value: Double, isInternational: Bool) -> Bool {
        
        let debit = isInternational ? value * (1 + iof/100) : value
        let finalValue = invoiceValue + debit
        
        if finalValue > limit {
            return false
        } else {
            invoiceValue = finalValue
            return true
        }
    }
    
    func getInvoice() -> Double {
        return invoiceValue
    }
    
    var invoice: Double {
        return invoiceValue
    }
    
}


let creditCard = CreditCard(number: "98453621874", limit: 4500)
creditCard.makePurchase(off: 746.90, isInternational: true)

print(creditCard.getInvoice())
print(creditCard.invoice)

// Um cenário que não pode ser permitido, é ter acesso direto à fatura
//creditCard.invoiceValue = 0
//print(creditCard.invoiceValue)


class DebitCreditCard: CreditCard {
    
    private var _balance: Double = 0
    var balance: Double {
        return _balance
    }
    
    func makeTransaction(off value: Double) {
        _balance += value
    }
    
    // Instance method overrides a 'final' instance method
//    override func makePurchase(off value: Double, isInternational: Bool) -> Bool {
//        <#code#>
//    }
    
    
}


let debitCreditCard = DebitCreditCard(number: "98453621895", limit: 4500)
debitCreditCard.makeTransaction(off: 800)
debitCreditCard.makeTransaction(off: -280)

print(debitCreditCard.balance)


// MARK: - POLIMORFISMO

class Animal {
    
    // MARK: - Properties
    let color: String
    let gender: Character
    let breed: String
    
    // MARK: Initializer
    init(color: String, gender: Character, breed: String) {
        self.color = color
        self.gender = gender
        self.breed = breed
    }
    
    // MARK: - Methods
    
    func emitSoud() {
        print("...")
    }
}

class Dog: Animal {
    
    // MARK: - Methods
    
    override func emitSoud() {
        print("au au au")
    }
    
    func run() {
        print("O cachorro está correndo.")
    }
}


class Bird: Animal {
    
    // MARK: - Properties
    let canFly: Bool
    
    // MARK: - Initializer
    init(color: String, gender: Character, breed: String, canFly: Bool) {
        self.canFly = canFly
        super.init(color: color, gender: gender, breed: breed)
    }
    
    convenience init(color: String, breed: String) {
        self.init(color: color, gender: "M", breed: breed, canFly: true)
    }
    
    // MARK: - Methods
    
    func fly() {
        if canFly {
            print("O pássaro está voando.")
        } else {
            print("Este pássaro não voa.")
        }
    }
    override func emitSoud() {
        print("🎶 🎶 🎶")
    }
}

class Duck: Bird {

    // MARK: - Initializer
    init(color: String, gender: Character, breed: String) {
        super.init(color: color, gender: gender, breed: breed, canFly: true)
    }
    
    // MARK: - Methods
    override func emitSoud() {
        print("🦆 Quack quack quack")
    }
}

let thorDog = Dog(color: "Branco e bege", gender: "M", breed: "Bulldog Inglês")
let nicoBird = Bird(color: "Amarelo", gender: "M", breed: "Canario", canFly: true)
let maleBird = Bird(color: "Azul", breed: "Arára")
let donald = Duck(color: "Branco", gender: "M", breed: "Disney")

thorDog.emitSoud()
nicoBird.emitSoud()
maleBird.emitSoud()
donald.emitSoud()

print("============================================")

// MARK: - Type Casting (Tratar um tipo, como se fosse outro tipo)


let animals: [Animal] = [
    Animal(color: "Preto", gender: "F", breed: "Alelo"),
    Dog(color: "Preto", gender: "M", breed: "American Bully"),
    Dog(color: "Preto e branco", gender: "F", breed: "Sharpei"),
    Duck(color: "Cinza", gender: "M", breed: "Silvestre"),
    Bird(color: "Vermelho", gender: "F", breed: "Avestruz", canFly: false)
]

for animal in animals {
    animal.emitSoud()
    
//    if animal is Dog {
//        (animal as! Dog).run()
//    }
//
//    if animal is Duck {
//        (animal as! Duck).fly()
//    }
    
//    if let dog = animal as? Dog {
//        dog.run()
//    }
//
//    if let duck = animal as? Duck {
//        duck.fly()
//    }
    
    switch animal {
    case let dog as Dog:
        dog.run()
    case let duck as Duck:
        duck.fly()
    default:
        break
    }
}
