//: Playground - noun: a place where people can play

import UIKit

var str = "Dali irá ser finalizado, no Sabado!"

//Localiza o indice(Objeto)
var indexDaMetade = str.index(str.startIndex, offsetBy: str.count/2)

//Procurando entre dois indices
str[str.startIndex..<indexDaMetade]

let letraBuscada:Character = ","

//Achando indice da virgula
let indiceVirgula = str.index(of:letraBuscada) ?? str.startIndex

//Caracteres antes da virgula
str[str.startIndex...str.index(before: indiceVirgula)]


//Caracteres depois da virgula
str[str.index(after: indiceVirgula) ... str.index(before: str.endIndex)]

//Range aberto incluindo 1 e 5
let range1 = 1...5

//range fechado não inclui o 5
let range2 = 1..<5


var array1 = [1,2,3,4,5]
array1[0...1] = [0,1]
array1

/*  SWITCH  */

switch "v1" {
case "v1","v2":
    print("É V1 e V2")
case let x where x.hasSuffix("5") :
    print("Começa com 5")

default:
    print("Default")
}

switch ("curto","") {
case let (v1,v2) where v1==v2:
    "Iguais!"
case ("curto",_):
    "Curto Encontrado!"
default:
    "Default"
}



let switchInt:UInt64 = UInt64(100000000000000)

switch switchInt {
case 0...UInt64(UInt8.max):
    "UInt8 Interval"
case UInt64(UInt8.max)...UInt64(UInt16.max):
    "UInt16 Interval"
case UInt64(UInt16.max)...UInt64(UInt32.max):
    "UInt32 Interval"
case UInt64(UInt32.max)...UInt64(UInt64.max):
    "UInt64 Interval"
default:
    "Default"
}





let swtchTuple = (550," Concluido!")

switch (swtchTuple) {
case (200,"OK"):
    "Sucess"
    
case (200,let message):
    "Mensagem : \(message)"
    
case (500...600,let message):
    "Erro Ocorreu! \(message)"
    break;
    
case (100...700,_):
    "Status HTTP!"
    fallthrough
    
case (404,"Page not found"):
    "Error 404"
    break;
    
default:
    break;
}




var total = 0

for i in 0...500{
    total += i
}

for c in "Dali vai apanhar sabado denovo!"{
    print(c)
}

let array3 = [1,2,3,4,5,6]

//for (i,c) in array3.enumerated(){
//    print(" Indice: \(i)  Numero: \(c)")
//}

//for i in array3.reversed().enumerated(){
//    print(" Indice: \(i.offset)  Numero: \(i.element)")
//}

let dicionario = ["IOS":"Xcode", "Android":"Eclipse", "Windows":"Visual Studio"]

for i in dicionario{
    print(" S.O: \(i.key) Ferramenta de DEV: \(i.value)")
}


/*   Do While */

repeat {
    
}while false




/*     Functions    */

func soma(com a:Int , e b:Int) -> Int{
    return a+b
}
soma(com: 10, e: 20)



func somaSubtrai(_ a:Int, _ b:Int) -> (Int, Int){
    return (a + b , a - b)
}

somaSubtrai(10, 20)



func somaVariadic(padrao:Int, valores:Int ...) -> Int{
    var soma: Int = padrao
    
    for i in valores {
        soma+=i
    }
    return soma
}
somaVariadic(padrao:10, valores:1,2,3,4)


var resultado:Int = 0
func somaVariadic(reference:inout Int, valores:Int ...){
    for i in valores {
       reference+=i
    }
}
somaVariadic(reference:&resultado, valores:1,2,3,4)

resultado




/*     Clousure   */

func find(inArray values:[Any], withPredicate predicate:(Any)->Bool )-> Int?{
    
    for (indice, valor) in values.enumerated() {
        if predicate (valor){
            return indice
        }
    }
    return nil
}

func findCharacter(valor:Any) ->Bool {
    return valor as! String == "F"
}
var index = find(inArray:["A","B","C","D","E","F","G",], withPredicate: findCharacter)


//Usando formato Lambda


var indexCaracter = find(inArray:["A","B","C","D","E","F","G",]){$0 as! String == "F"}



//funcao recebe o operador e retorna uma funcao que sera a operacao correspondente


func somar(_ a:Int, _ b:Int)->Int{return a+b}
func subtrair(_ a:Int, _ b:Int)->Int{return a-b}
func dividir(_ a:Int, _ b:Int)->Int{return a/b}
func multiplicar(_ a:Int, _ b:Int)->Int{return a*b}


func findFunctionOperator(_ operador:String) -> ((Int, Int)->Int)? {
   
    switch operador {
    case "+":
       return somar
    case "-":
        return subtrair
    case "/":
        return dividir
    case "*":
        return multiplicar
    default:
        return nil
    }
}

findFunctionOperator("o")?(2,2)



func iterator(_ array:[Int]) -> ()-> Int? {
    var i = 0
    return{
        i+=1
        return i <= array.count ? array[i-1] : nil
    }
}

let arrayNumeros = [1,2,3,4]
var it = iterator(arrayNumeros)
it()
it()
it()
it()
it()
it()


func processUser (_ name:String) -> (Float,String)?{
  
    var saldos = ["Dali":-500.0, "Fabio":-500.0]
    var sobrenomes = ["Dali":"Tanga","Fabio":"Santos"]
    
    guard let money = saldos[name] else {return nil}
    
    guard let sobrenome = (sobrenomes[name]) else {return nil}
    
    return (Float(money),"\(name) \(sobrenome)")
}

processUser("Fabio")






var idade = 27

assert(idade < 30 , "Está ficando velho!")



/*                                Classe                                  */


class Movie{
    static let defatulMovieTitle = "Movie Title Default"
    static let defatulMovieDirector = "Movie Directorle Default"
     var durationInMinutes:Double = 0.0
    var title:String
    var director:String
   
    
    var description:String{
        return "\(self.title): \(self.director)"
    }
    
    var durationInHours:Double{
        get{
            return self.durationInMinutes / 60
        }
        set(duracao){
            self.durationInMinutes = duracao * 60
        }
    }
    
    //Designated initialazer (Construtor da classe)
    init(title:String, director:String, duration:Double){
        self.title = title
        self.director = director
        self.durationInMinutes = duration
    }

    convenience init(title:String){
        self.init(title: title, director: Movie.defatulMovieDirector, duration:0.0)
    }
    
    
    //Quando objeto é destruido
    deinit{
        print("Estou sendo Destruido!!!")
    }
    
    static func printDefaultMovieTitle(){
        print(Movie.defatulMovieTitle)
    }

}

var starWars:Movie = Movie(title: "Star Wars", director:"George Lucas",duration: 1.0)

var demolidor:Movie? = Movie(title: "Demolidor", director:"Desconhecido",duration: 1.0)

demolidor = nil


var thor:Movie? = Movie(title: "Thor", director:"Desconhecido", duration: 1.0)

thor?.durationInHours = 1

thor?.durationInMinutes
thor?.durationInHours






var movie:Movie? = Movie(title: "Anonimo", director:"Desconhecido", duration: 1.0)

starWars === movie
starWars === starWars

//Herança
class FightMovie:Movie{
    
    var  bloodLevel:Int = 0
    
    override var description:String{
          return "\(self.title): \(self.director) -> \(bloodLevel)"
    }
    
    //Designated initialazer (Construtor da classe)
    convenience init(title:String, director:String, duration:Double, bloodLevel:Int){
        self.init(bloodLevel:bloodLevel)
        super.init(title: title, director: director, duration:duration)
       
    }
    
    init(bloodLevel:Int){
        self.bloodLevel = bloodLevel
    }
    
}













