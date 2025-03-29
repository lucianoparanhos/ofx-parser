//
//  Transacao.swift
//  OFXParser
//
//  Created by Luciano Paranhos on 27/03/25.
//

public struct Transacao: Sendable {
    public let tipo: String         // Ex: DEBIT ou CREDIT
    public let data: Date
    public let valor: Double
    public let id: String           // FITID
    public let nome: String         // Nome do estabelecimento
    public let memo: String         // Descrição adicional
}
