//
//  TipoContaIdentifierTests.swift
//  OFXParser
//
//  Created by Luciano Paranhos on 29/03/25.
//

import Testing
@testable import OFXParser

@Test
func deve_identificar_cartao_credito() async throws {
    let ofx = "<CREDITCARDMSGSRSV1><STMTTRNRS>...</STMTTRNRS></CREDITCARDMSGSRSV1>"
    let tipo = TipoContaIdentifier.identificar(ofxContent: ofx)
    #expect(tipo == .cartaoCredito)
}

@Test
func deve_identificar_conta_corrente() async throws {
    let ofx = "<BANKMSGSRSV1><STMTTRNRS>...</STMTTRNRS></BANKMSGSRSV1>"
    let tipo = TipoContaIdentifier.identificar(ofxContent: ofx)
    #expect(tipo == .contaCorrente)
}

@Test
func deve_retornar_tipo_desconhecido_para_ofx_sem_tags() async throws {
    let ofx = "<OUTRATAG>algum valor</OUTRATAG>"
    let tipo = TipoContaIdentifier.identificar(ofxContent: ofx)
    #expect(tipo == .desconhecida)
}

@Test
func deve_retornar_cartao_credito_quando_ambos_presentes() async throws {
    let ofx = "<CREDITCARDMSGSRSV1>...</CREDITCARDMSGSRSV1><BANKMSGSRSV1>...</BANKMSGSRSV1>"
    let tipo = TipoContaIdentifier.identificar(ofxContent: ofx)
    #expect(tipo == .cartaoCredito)
}

@Test
func deve_retornar_desconhecida_se_case_nao_casar() async throws {
    let ofx = "<creditcardmsgsrsv1>"
    let tipo = TipoContaIdentifier.identificar(ofxContent: ofx)
    #expect(tipo == .desconhecida)
}
