//
//  TipoContaIdentifier.swift
//  OFXParser
//
//  Created by Luciano Paranhos on 27/03/25.
//

public struct TipoContaIdentifier {
    private static let mapeamento: [String: TipoConta] = [
        "<CREDITCARDMSGSRSV1>": .cartaoCredito,
        "<BANKMSGSRSV1>": .contaCorrente
    ]

    public static func identificar(ofxContent: String) -> TipoConta {
        for (chave, tipo) in mapeamento {
            if ofxContent.contains(chave) {
                return tipo
            }
        }
        return .desconhecida
    }
}
