//
//  TipoConta.swift
//  OFXParser
//
//  Created by Luciano Paranhos on 27/03/25.
//

public enum TipoConta: String, Sendable {
    case contaCorrente = "<BANKMSGSRSV1>"
    case cartaoCredito = "<CREDITCARDMSGSRSV1>"
    case desconhecida
}
