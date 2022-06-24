import Cocoa

//enum PasswordError: Error {
//    case short,obvious
//}
//
//enum FindRoot: Error{
//    case noroot,outOfBounds
//}
//func checkSqrt(_ number:Int) throws -> Int{
//    var root = 0
//    if number < 1 || number > 10000{
//        throw FindRoot.outOfBounds
//    }
//    for i in 1...100 {
//        if (i*i == number){
//           root = i
//        }
//    }
//    if (root == 0){
//        throw FindRoot.noroot
//    }
//    else{
//        return root
//    }
//}
//let myNum = 9
//do{
//    let sqr = try checkSqrt(myNum)
//    print("square number of \(myNum) is: \(sqr)")
//}
//catch FindRoot.outOfBounds{
//    print("your nukmber must be > 1 and less than 10000")
//}
//catch FindRoot.noroot{
//    print("no root found for \(myNum)")
//}
//catch{
//    print("general error")
//}
//func repeatAction(count: Int, then action: () -> Void){
//    for _ in 0..<count {
//        action()
//    }
//}
//repeatAction(count:5){
//    print("tontin")
//}
//print(sqrt(2.0))
//func checkPassword(_ password: String)throws -> String{
//    if password.count < 5{
//        throw PasswordError.short
//    }
//    if password == "12345"{
//        throw PasswordError.obvious
//    }
//    if password.count == 8x{
//        return "OK"
//    }
//    else{
//        return "Excellent"
//    }
//}
//do{
//    let result = try checkPassword("12345")
//    print("Password rating \(result)")
//}
//catch PasswordError.short{
//    print("please use longer password")
//}
//catch PasswordError.obvious{
//    print("echale mas ganitas con tu password")
//}
//catch{
//    print("error: \(error.localizedDescription)")
//}
/*CATCH 5
 Closures
 */
let luckynumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let reverse = luckynumbers.sorted{ $0 < $1 }
    .filter{ $0.isMultiple(of: 2)}
    .map{String($0)}.joined(separator: " is a lucky number")

//for item in reverse{
    print(reverse)
//}
/*
 Structs
 */
