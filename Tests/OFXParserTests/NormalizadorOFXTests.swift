//
//  NormalizadorOFXTests.swift
//  OFXParser
//
//  Created by Luciano Paranhos on 29/03/25.
//

import Testing
@testable import OFXParser

struct NormalizacaoOFXTests {
    @Test
    func deve_normalizar_removendo_quebras_e_espacos() async throws {
        let original = """
        <STMTTRN>
            <TRNAMT> -50.00 </TRNAMT>
        </STMTTRN>
        """
        let esperado = "<STMTTRN><TRNAMT>-50.00</TRNAMT></STMTTRN>"

        let resultado = TransacaoParser.normalizar(ofx: original)
        print(resultado)
        #expect(resultado == esperado)
    }

    @Test
    func deve_remover_espacos_entre_tags_em_varias_linhas() async throws {
        let original = """
        <TAG1> valor1 </TAG1>
        <TAG2>  valor2  </TAG2>
        """
        let esperado = "<TAG1>valor1</TAG1><TAG2>valor2</TAG2>"

        let resultado = TransacaoParser.normalizar(ofx: original)
        #expect(resultado == esperado)
    }

    @Test
    func deve_ignorar_linhas_em_branco() async throws {
        let original = """
        <TAG1>valor1</TAG1>

        <TAG2>valor2</TAG2>
        """
        let esperado = "<TAG1>valor1</TAG1><TAG2>valor2</TAG2>"

        let resultado = TransacaoParser.normalizar(ofx: original)
        #expect(resultado == esperado)
    }

    @Test
    func deve_preservar_texto_ja_normalizado_sem_alterar() async throws {
        let texto = "<TAG1>valor</TAG1><TAG2>outro</TAG2>"
        let resultado = TransacaoParser.normalizar(ofx: texto)
        #expect(resultado == texto)
    }

    @Test
    func deve_remover_espacos_entre_tags_fechando_e_abrindo() async throws {
        let original = """
        <TAG1>valor1</TAG1>   <TAG2>valor2</TAG2>
        """
        let esperado = "<TAG1>valor1</TAG1><TAG2>valor2</TAG2>"

        let resultado = TransacaoParser.normalizar(ofx: original)
        #expect(resultado == esperado)
    }

}


