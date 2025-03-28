// swift-tools-version: 6.0

@_exported import Foundation

public typealias AnalisadorOFX = OFXDocumentoParser

public typealias ResultadoOFX = (
    banco: Banco,
    tipoConta: TipoConta,
    transacoes: [Transacao]
)
