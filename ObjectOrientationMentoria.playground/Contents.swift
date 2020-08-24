
// Classes: São a base de um objeto, definem as características e seus comportamentos.
// Objetos: São a construção dessas classes, uma instância da classe.
// Métodos: são funções de uma classe
// Constantes e variáveis em uma classe, são suas propriedades.
// Variável computada: apenas return um valor definido.
// Métos de classe, precisam de uma instância do objeto da clase, para serem acessados, assim como propriedades de uma classe.
// Observadores de propriedade: didSet - avisa sempre que ouvir alguma mudança na propriedade.

/* OBS.: Uma das diferenças entre uma classe e uma struct, é que na classe é preciso definir seu método cronstrutor.
 Esse construtor, precisar construir todas as propriedades que não foram inicializadas */

/* OBS2.:   */

// Classe exemplo:

class Person {
    
    // MARK:- PROPERTIES
    
    let name: String
    let gender: Character
    var age = 0
    
    init(name: String, gender: Character) {
        self.name = name
        self.gender = gender
    }
    
    // MARK:- METHODS
    
    func speack(sentence: String) {
        if age <= 3 {
            print("gugudadá")
        }else {
            print(sentence)
        }
    }
    
    func introduce() {
        speack(sentence: "Olá, meu nome é \(name)!")
    }
}


class Job {
    
    // MARK:- PROPERTIES
    
    var title: String
    var sallary: Double
    
    // MARK:- INITIALIZER
    
    init(title: String, sallary: Double) {
        self.title = title
        self.sallary = sallary
    }
}

let jean = Person(name: "Jean Carlos", gender: "M")
let duda = Person(name: "Maria Eduarda", gender: "F")
let juan = Person(name: "Juan Vitor", gender: "M")
let tchalinha = Person(name: "T'chala", gender: "M")

jean.age = 34
duda.age = 14
juan.age = 12
tchalinha.age = 2

jean.introduce()
duda.introduce()
juan.introduce()
tchalinha.introduce()


class Vehicle {
    
    // MARK:- PROPERTIES OBSERVERS
    var speed: Double = 0 {
        didSet {
            self.speed = min(self.speed, maxSpeed)
        }
    }
    
    // MARK:- PROPERTIES
    var model: String
    
    // Tipo de variável computada, que apenas retorna um valor:
    var maxSpeed: Double {
        return 250
    }
    
    // Tipo de variável computada, que é possível consumir e setar um valor:
    var speedInMilesPerHour: Double {
        get {
            return speed / 1.60934
        }
        set {
            return speed = newValue * 1.60934
        }
    }
    
    // MARK:- CLASS PROPERTIES
    
    static let speedUnit = "Km/h"
    
    // MARK:- INITIALIZER
    
    init(model: String) {
        self.model = model
    }
    
    // MARK:- METHODS
    
    func descript() -> String {
        return "Veículo: \(model), velocidade atual de: \(speed)."
    }
    
    // MARK:- CLASS METHODS
    
    class func alert() -> String {
        return "Se beber, não dirija."
    }
    
}

// Não é preciso instanciar a classe, para ter acesso aos métodos e propriedades de classe.
print(Vehicle.alert())
print(Vehicle.speedUnit)

let car = Vehicle(model: "Honda Civic")
car.speed = 500

print(car.descript())
