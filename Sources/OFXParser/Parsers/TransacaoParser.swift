//
//  TransacaoParser.swift
//  OFXParser
//
//  Created by Luciano Paranhos on 27/03/25.
//

import Foundation

public struct TransacaoParser {
    public static func extrairTransacoes(ofxContent: String) -> [Transacao] {
        var transacoes: [Transacao] = []

        let blocos = ofxContent.components(separatedBy: "<STMTTRN>").dropFirst()

        for bloco in blocos {
            guard let fim = bloco.range(of: "</STMTTRN>") else { continue }
            let conteudo = String(bloco[..<fim.lowerBound])

            let tipo = extrairValor(tag: "TRNTYPE", em: conteudo)
            let data = extrairData(tag: "DTPOSTED", em: conteudo)
            let valor = extrairDouble(tag: "TRNAMT", em: conteudo)
            let id = extrairValor(tag: "FITID", em: conteudo)
            let nome = extrairValor(tag: "NAME", em: conteudo)
            let memo = extrairValor(tag: "MEMO", em: conteudo)

            if let tipo = tipo, let data = data, let valor = valor, let id = id {
                let transacao = Transacao(
                    tipo: tipo,
                    data: data,
                    valor: valor,
                    id: id,
                    nome: nome ?? "",
                    memo: memo ?? ""
                )
                transacoes.append(transacao)
            }
        }

        return transacoes
    }

    private static func extrairValor(tag: String, em texto: String) -> String? {
        guard let range = texto.range(of: "<\(tag)>") else { return nil }
        let inicio = texto[range.upperBound...]
        return inicio.split(separator: "<", maxSplits: 1).first.map { String($0).trimmingCharacters(in: .whitespacesAndNewlines) }
    }

    private static func extrairDouble(tag: String, em texto: String) -> Double? {
        guard let valorStr = extrairValor(tag: tag, em: texto) else { return nil }
        return Double(valorStr.replacingOccurrences(of: ",", with: "."))
    }

    private static func extrairData(tag: String, em texto: String) -> Date? {
        guard let dataStr = extrairValor(tag: tag, em: texto) else { return nil }

        let formatos = ["yyyyMMddHHmmss", "yyyyMMdd"]
        for formato in formatos {
            let formatter = DateFormatter()
            formatter.dateFormat = formato
            formatter.timeZone = TimeZone(identifier: "GMT")
            if let date = formatter.date(from: dataStr) {
                return date
            }
        }

        return nil
    }
}
