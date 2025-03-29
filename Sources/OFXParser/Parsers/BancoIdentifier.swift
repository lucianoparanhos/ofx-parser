//
//  BancoIdentifier.swift
//  OFXParser
//
//  Created by Luciano Paranhos on 27/03/25.
//

public struct BancoIdentifier {

    public static func identificar(ofxContent: String) -> Banco {
        guard let idEncontrado = extrairIdentificadorBancario(de: ofxContent),
              let id = UInt16(idEncontrado),
              let banco = Banco(rawValue: id) else {
            return .desconhecido
        }
        
        return banco
    }

    private static func extrairIdentificadorBancario(de texto: String) -> String? {
        let patterns = ["<FID>(\\d+)", "<BANKID>(\\d+)"]

        for pattern in patterns {
            if let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive),
               let match = regex.firstMatch(in: texto, range: NSRange(texto.startIndex..., in: texto)),
               let range = Range(match.range(at: 1), in: texto) {
                return String(texto[range])
            }
        }

        return nil
    }
}
