//
//  BancoIdentifierTests.swift
//  OFXParser
//
//  Created by Luciano Paranhos on 29/03/25.
//

import Testing
@testable import OFXParser

@Test
func deve_identificar_banco_nubank_por_codigo_compe() async throws {
    let texto: String = "<FID>260</FID>"
    let banco = BancoIdentifier.identificar(ofxContent: texto)

    #expect(banco == .nubank)
}

@Test
func deve_identificar_banco_bradesco_por_fid() async throws {
    let texto = "<FID>237</FID>"
    let banco = BancoIdentifier.identificar(ofxContent: texto)
    #expect(banco == .bradesco)
}

@Test
func deve_retornar_desconhecido_para_codigo_desconhecido() async throws {
    let texto = "<FID>999</FID>"
    let banco = BancoIdentifier.identificar(ofxContent: texto)
    #expect(banco == .desconhecido)
}

@Test
func deve_retornar_desconhecido_para_ofx_sem_fid_ou_bankid() async throws {
    let texto = "<OUTRATAG>123</OUTRATAG>"
    let banco = BancoIdentifier.identificar(ofxContent: texto)
    #expect(banco == .desconhecido)
}

@Test
func deve_retornar_desconhecido_para_fid_invalido() async throws {
    let texto = "<FID>abc</FID>"
    let banco = BancoIdentifier.identificar(ofxContent: texto)
    #expect(banco == .desconhecido)
}

@Test
func deve_usar_fid_quando_fid_e_bankid_estao_presentes() async throws {
    let texto = "<BANKID>237</BANKID><FID>260</FID>"
    let banco = BancoIdentifier.identificar(ofxContent: texto)
    #expect(banco == .nubank) // FID = 260 deve ser usado
}
