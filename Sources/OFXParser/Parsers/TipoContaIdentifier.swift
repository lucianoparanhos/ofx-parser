//
//  TipoContaIdentifier.swift
//  OFXParser
//
//  Created by Luciano Paranhos on 27/03/25.
//

public struct TipoContaIdentifier {
    public static func identificar(ofxContent: String) -> TipoConta {

        for tipoConta in [TipoConta.cartaoCredito, TipoConta.contaCorrente] {
            if ofxContent.contains(tipoConta.rawValue) {
                return tipoConta
            }
        }

        return .desconhecida
    }
}
