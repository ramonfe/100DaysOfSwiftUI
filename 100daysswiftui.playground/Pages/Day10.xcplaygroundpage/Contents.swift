import Cocoa
///Mutating
//struct Stapler {
//    var counter: Int//
//    mutating func stapler(){
//        if counter > 0 {
//            counter+=1
//            print("i did it")
//        }
//        else{
//            print("te la pelas")
//        }
//    }
//}
//var staple = Stapler(counter: 0)
//staple.stapler()
/*
 Computed properties dynamically
 */
//struct Employee {
//    let name:String
//    var vacationAllocated = 14
//    var vacationTaked=0

////this is a computed propery
//    var vacationRemaining: Int{
//        get{
//            vacationAllocated - vacationTaked
//        }
//        set{
//            vacationAllocated = newValue
//        }
//    }
//}
//
//var ramon = Employee(name: "Ramon Felix", vacationAllocated: 14)
//ramon.vacationTaked=4
//ramon.vacationRemaining=15
//print(ramon.vacationRemaining)
/*
 Take action when property changes (observers)
 */
//struct App {
//    var contacts = [String](){
//        willSet{
//            print("array will add \(newValue) to: \(contacts)")
//        }
//        didSet{
//            print("array changed \(contacts)")
//        }
//    }
//}
//
//var app = App()
//app.contacts.append("ramon")
//app.contacts.append("pepe")
//app.contacts.append("pancho")
/*
 inits
 */
struct Employee {
    var name:String
    var yearsActive=0
}
extension Employee{
    init() {
        self.name="No one"
    }
}
//creando una extension puedo instanciar los objectos libremente
var ramon = Employee(name: "paco",yearsActive: 1)
var emi = Employee()
print(ramon)
print(emi)
emi.name="emi"
print(emi)
