// MARK:- Super class

public class Country {
    
    // MARK:- Properties
    
    let countryName: String
    let nationality: String
    
    var city: String {
        willSet {
            changeCity(msg: "I'm changing from \(city) to \(newValue)")
        }

        didSet {
            changeCity(msg: "I just changed from \(oldValue) to \(city)")
        }
    }
    
    // MARK:- Initializer
    
    init(countryName: String, nationality: String, city: String) {
        self.countryName = countryName
        self.nationality = nationality
        self.city = city
    }
    
    // MARK:- Methods
    func changeCity(msg: String) {
        print(msg)
    }
}

// MARK:- SubClass
public class Person: Country {
    
    // MARK:- Properties
    
    let name: String
    let gender: Character
    var age = 0
    
    // MARK:- Initializer
    
    init(name: String, gender: Character, countryName: String, nationality: String, city: String) {
        self.name = name
        self.gender = gender
        super.init(countryName: countryName, nationality: nationality, city: city)
    }
}

// MARK:- Creating Person Object

var tchala = Person(name: "Tchala", gender: "M", countryName: "Wakanda", nationality: "Wakandense", city: "WakanCit")
tchala.age = 34
tchala.city = "Brooklyn"
