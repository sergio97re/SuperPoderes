//
//  KeyChain.swift
//  ProyectoMarvel
//
//  Created by Sergio Reina Montes on 13/11/2023.
//
//UTILIZARIAMOS KEYCHAIN EN EL CASO DE TENER ALGO QUE GUARDAR COMO EL TOKEN

import KeychainSwift

//Guardamos
func saveKC(key: String, value: String) -> Bool {
    //Convertimos la cadena value en data codificacion utf8
    if let data = value.data(using: .utf8) {
        let kc = KeychainSwift()
        return kc.set(data, forKey: key)
    }else {
        return false
    }
}

//Leemos
func loadKC(key: String) -> String? {
    if let data = KeychainSwift().get(key){
        return data
    }else {
        return ""
    }
}


//Borramos
func deleteKC(key: String) -> Bool{
    KeychainSwift().delete(key)
}
