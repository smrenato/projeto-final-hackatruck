//
//  File.swift
//  SmartNote
//
//  Created by Student on 07/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import Foundation

class Pasta{
    var nomePasta: String?
    var pastas =  [SubPasta]()
    var imagePath: String?
    
    init(nome: String, imagePath: String) {
        self.nomePasta = nome
        self.imagePath = imagePath
        
    }
    
    func addPasta(nome: String) {
        self.pastas.append(SubPasta(nome: nome, arquivos: [Arquivo]()))
    }
}

class SubPasta{
    var nomeSubPasta: String?
    var arquivos = [Arquivo]()

    init(nome: String, arquivos: [Arquivo]) {
        self.arquivos = arquivos
        self.nomeSubPasta = nome
    }
    
    func addArquivo(nome: String, texto: String) {
        self.arquivos.append(Arquivo(nome: nome, texto: texto))
    }

}

class Arquivo {
    var nome: String?
    var data: String?
    var texto: String?
    
    init(nome: String, texto: String) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        self.data = dateFormatter.string(from: date)
        self.texto = texto
        self.nome = nome
    }
}

//class Pasta1 {
//    let name:String
//    let image: String
//
//    init(name:String, imagePath:String) {
//        self.name = name
//        self.image = imagePath
//    }
//
//}

class PastaDAO{
    
    static func getList()->[Pasta]{
        return [
            Pasta(nome: "UFPB", imagePath: "caderno"),
            Pasta(nome: "HackaTruck", imagePath: "caderno"),
            Pasta(nome: "Trabalho", imagePath: "caderno"),
        
        ]
    }
}

class Pasta2{
    let name: String?

    init(name: String){
        self.name = name
    }
}


class Pasta2DAO{
    
    static func getList()->[SubPasta]{
        return[
            SubPasta(nome: "Estrutura de Dados",
                     arquivos: [
                        Arquivo(nome: "ED", texto: "Lista encadeada")
            ]),
            SubPasta(nome: "Inteligência Artificial", arquivos: []),
            SubPasta(nome: "Linguagem de Programação 2", arquivos: [])
        ]
    }

    static func getList2()->[SubPasta]{
        return[
            SubPasta(nome: "Revisão Swift", arquivos: []),
            SubPasta(nome: "Framework Map", arquivos: []),
            SubPasta(nome: "Collection View", arquivos: [])
        ]
    }

    static func getList3()->[SubPasta]{
        return[
            SubPasta(nome: "Dinheiro", arquivos: []),
            SubPasta(nome: "Planilha", arquivos: []),
            SubPasta(nome: "Projeto versão final 4K funcionando agora vai", arquivos: [])
        ]
    }

}
