//
//  OFXParser.swift
//  OFXParser
//
//  Created by Luciano Paranhos on 27/03/25.
//

public struct OFXDocumentoParser {
    public static func parse(ofxContent: String) -> (banco: Banco, tipoConta: TipoConta, transacoes: [Transacao]) {
        let banco = BancoIdentifier.identificar(ofxContent: ofxContent)
        let tipoConta = TipoContaIdentifier.identificar(ofxContent: ofxContent)
        let transacoes = TransacaoParser.extrairTransacoes(ofxContent: ofxContent)

        return (banco, tipoConta, transacoes)
    }
}
