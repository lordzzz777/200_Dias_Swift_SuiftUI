import Foundation


// MARK: - Funciones Dias 7 y 8

/// Hemos cubierto mucho sobre las funciones en los capítulos anteriores, así que recapitulemos:

/// Las funciones nos permiten reutilizar el código fácilmente tallando trozos de código y dándole un nombre.

/// Todas las funciones comienzan con la palabra func, seguida del nombre de la función. El cuerpo de la función está contenido dentro de las llaves de apertura y cierre.

/// Podemos agregar parámetros para que nuestras funciones sean más flexibles: enumerarlos uno por uno separados por comas: el nombre del parámetro, luego los dos puntos y luego el tipo del parámetro.

/// Puede controlar cómo se utilizan esos nombres de parámetros externamente, ya sea utilizando un nombre de parámetro externo personalizado o usando un guión bajo para desactivar el nombre externo de ese parámetro.

/// Si crees que hay ciertos valores de parámetros que usarás repetidamente, puedes hacer que tengan un valor predeterminado para que tu función tome menos código para escribir y haga lo inteligente de forma predeterminada.

/// Las funciones pueden devolver un valor si lo desea, pero si desea devolver varios datos de una función, debe usar una tupla. Estos contienen varios elementos con nombre, pero está limitado de una manera en que un diccionario no lo es: enumeras cada elemento específicamente, junto con su tipo.

/// Las funciones pueden lanzar errores: crea una enumeración que define los errores que desea que ocurran, arroja esos errores dentro de la función según sea necesario, luego usa do, try y catch para manejarlos en el sitio de la llamada.


// Función sin parámetros ni valor de retorno:
func saludar() {
    print("¡Hola!")
}

saludar() // Salida: ¡Hola!

// Función con parámetros:
func suma(_ a: Int, _ b: Int) -> Int {
    return a + b
}

let resultado = suma(5, 3)
print("La suma es: \(resultado)") // Salida: La suma es: 8


// Función con valor de retorno y parámetros con nombre externo:
func saludar(nombre: String) -> String {
    return "¡Hola, \(nombre)!"
}

let mensaje1 = saludar(nombre: "Juan")
print(mensaje1) // Salida: ¡Hola, Juan!


// Función con valor de parámetro predeterminado:
func saludar2(nombre: String = "Mundo") -> String {
    return "¡Hola, \(nombre)!"
}

print(saludar2()) // Salida: ¡Hola, Mundo!
print(saludar2(nombre: "Pedro")) // Salida: ¡Hola, Pedro!


// Función que devuelve una tupla:
func obtenerCoordenadas() -> (Double, Double) {
    return (40.7128, -74.0060)
}

let coordenadas = obtenerCoordenadas()
print("Latitud: \(coordenadas.0), Longitud: \(coordenadas.1)") // Salida: Latitud: 40.7128, Longitud: -74.0060


// Función que lanza errores:
enum ErrorPersonalizado: Error {
    case valorNegativo
}

func dividir(_ a: Int, por b: Int) throws -> Int {
    guard b != 0 else {
        throw ErrorPersonalizado.valorNegativo
    }
    return a / b
}

do {
    let resultado = try dividir(10, por: 0)
    print("Resultado: \(resultado)")
} catch ErrorPersonalizado.valorNegativo {
    print("¡Error! No se puede dividir por cero.")
} catch {
    print("Se produjo un error desconocido.")
}



// MARK: - Reto 4
/// El desafío es el siguiente: escribe una función que acepte un entero del 1 al 10,000, y devuelva la raíz cuadrada entera de ese número. Suena fácil, pero hay algunas cosas que tener en cuenta:

/// No puedes usar la función sqrt() u otras similares incorporadas de Swift, necesitas encontrar la raíz cuadrada por ti mismo.
/// Si el número es menor que 1 o mayor que 10,000, debes lanzar un error de "fuera de límites".

/// Solo debes considerar raíces cuadradas enteras; no te preocupes por la raíz cuadrada de 3 siendo 1.732, por ejemplo.
/// Si no puedes encontrar la raíz cuadrada, lanza un error de "sin raíz".

/// Como recordatorio, si tienes el número X, la raíz cuadrada de X será otro número que, cuando se multiplica por sí mismo, da como resultado X. Entonces, la raíz cuadrada de 9 es 3, porque 3x3 es 9, y la raíz cuadrada de 25 es 5, porque 5x5 es 25.

/// Te daré algunas pistas en un momento, pero como siempre te animo a que lo intentes primero por ti mismo: luchar por recordar cómo funcionan las cosas, y a menudo tener que buscarlas de nuevo, es una forma poderosa de progresar.


enum ErrorRaizCuadrada: Error {
    case fueraDeLimites
    case sinRaiz
}

func raizCuadradaEntera(_ numero: Int) throws -> Int {
    guard numero >= 1 && numero <= 10000 else {
        throw ErrorRaizCuadrada.fueraDeLimites
    }
    
    for i in 1...100 {
        if i * i == numero {
            return i
        }
    }
    
    throw ErrorRaizCuadrada.sinRaiz
}

do {
    let numero = 25
    let resultado = try raizCuadradaEntera(numero)
    print("La raíz cuadrada de \(numero) es \(resultado)")
} catch ErrorRaizCuadrada.fueraDeLimites {
    print("Error: El número está fuera de los límites permitidos.")
} catch ErrorRaizCuadrada.sinRaiz {
    print("Error: No se pudo encontrar la raíz cuadrada entera del número.")
}
