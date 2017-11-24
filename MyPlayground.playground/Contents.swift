
//import biblioteca
import UIKit

//var criacao de variavel
var str = "Hello, Fábio"
var int = 10
int += 8

//let é usado para criacao de constantes
let constante = 10

//podemos criar variaveis com palavras reservadas
let `let` = 10

//imprimindo variaveis
print(`let`);

//linguagem fortemente tipada
//str += 2


let nome: String
nome = "Fábio"
nome + " Santos"

//Colocando ? depois do tipo criamos o optional da variavel
let nome2 : String? = nil

//Com o ! o programador se responsabiliza se o objeto for null
//nome2!.description + ""


//Removendo o optinal de uma variavel
let numero1 : Int?  = 27
let numero2: Int  = numero1!

let variasLinhas = """
Primeira Linha
Segunda Linha
Terceira Linha
"""

//Concatenando String com variaveis e expressoes
let soma = "2 + 2 = \(2+2)"
let usuario = "Nome Usuario \(nome)"



/*                                                     Trabalhando com Arrays                                                              */

//Array vazios
let array1:[Float] = []
let array2 = [Int]()
let array3 = ["1","2"]

//Acessando posicoes
array3[0]
array3[1]
//array3[2] identifica exception em tempo de compilacao


let array4 = ["1","2"]
let array5 = ["3","4"]

//Concatenando array
array4 + array5


//Tipo de dado Heterogenio
var myTuple = (0, 1, "2")
let (a,b,c) = myTuple

a == myTuple.0
b == myTuple.1
c == myTuple.2


/* Dicionarios */

//Criando um dicionario vazio
//var nameOfEmail = [String:String]()


var nameOfEmail : [String:String] = [:]

nameOfEmail ["Fabio Santos"] = "fabio@mail.com"
nameOfEmail ["Fabio Santos"]

let emailOfName = [
    "Fabio Santos":"fabio@mail.com"
]

emailOfName

//Criacao de varias variaveis
let m1,m2,m3 : Int


let I💜Swift = true

/*Comentario Externo
 
 /* Comentario Interno */
 
*/

//Dando apelidos para os tipos(Classes)
typealias inteiro = Int
let teste : inteiro = 2


//criando variaveis binarias
let binario = 0xd

//Criando variaveis com notacoes
let notacao = 1.25e-2


let milhao = 1_000_000

let octal = 0o0017


var optionalValue : Any?


optionalValue = Float(2.2) / 1

var optionalValue2 : Any

//Apenas numeros positivos
//optionalValue2 =  UInt(-1)

//Numeros ate 255
//optionalValue2 =  UInt8(-1)

optionalValue = 2

if optionalValue != nil {
    print("Não sou nil")
}else{
    print("Sou sou nil")
}

if let unwaraped = optionalValue{
    print("Eu não sou nil \(unwaraped)")
    
}

let qualquer : Int? = Int(String(27))

if let firstNumber = Int("4"), let secondNumber = Int("42"),
    firstNumber < secondNumber && secondNumber < 100 {
    "\(firstNumber) < \(secondNumber) < 100"
}


/*     Cast    */

optionalValue = nil
//(optionalValue as? Int)! + 1


(optionalValue as? Int ?? 2) + 1

































































