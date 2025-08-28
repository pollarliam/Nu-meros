//
//  main.swift
//  Números
//
//  Created by Ramael Cerqueira on 27/08/25.
//

import Foundation

// Primeiro pedimos o path para o usuário, então linkamos o path em um URL quechamei apenas de "url".
// Criamos if let path para verificar se o path tem algo escrito nele e não é nulo
// Após isso criamos o readnumbers para ler os conteúdos de url
// Após isso criamos o numbers para guardar os conteúdos em String.
// Adicionamos três métodos em numbers: o components para separar cada string por quebra de linha, o compactMap para mudar os strings para integers, e finalmente usamos o método .sorted para ajeitar os números de forma crescente.
// Após isso
// ref: https://developer.apple.com/documentation/swift/array/sorted() https://www.hackingwithswift.com/read/5/2/reading-from-disk-contentsof https://www.hackingwithswift.com/example-code/system/how-do-you-read-from-the-command-line https://stackoverflow.com/questions/25006235/how-to-benchmark-swift-code-execution

print("Digite PATH do arquivo. Insira um arquivo txt com números separados por quebra de linha.")

let path = readLine()

if let path = path {
    let starttimer = CFAbsoluteTimeGetCurrent()
    let url = URL(fileURLWithPath: path)
    let readnumbers = try String(contentsOf: url)
    let numbers = readnumbers
        .components(separatedBy: "\n")
        .compactMap { Int($0) }
        .sorted()
    for number in numbers {
        print(number)
    }
    let endtimer = CFAbsoluteTimeGetCurrent()
    let elapsed = endtimer - starttimer
    print("Tempo : \(elapsed)")
    } else {
    print("Nenhum PATH fornecido!")
}
    
// Tempo : 0.18513500690460205 s
