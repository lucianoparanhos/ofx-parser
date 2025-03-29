import Testing
@testable import OFXParser

struct TransacaoParserTests {
    @Test
    func deve_extrair_uma_transacao_valida() async throws {
        let ofx = """
    <STMTTRN>
        <TRNTYPE>DEBIT</TRNTYPE>
        <DTPOSTED>20250327</DTPOSTED>
        <TRNAMT>-50.00</TRNAMT>
        <FITID>123456</FITID>
        <NAME>Padaria</NAME>
        <MEMO>Pão e café</MEMO>
    </STMTTRN>
    """

        let transacoes = TransacaoParser.extrairTransacoes(ofxContent: ofx)
        #expect(transacoes.count == 1)
        #expect(transacoes.first?.tipo == "DEBIT")
        #expect(transacoes.first?.valor == -50.00)
        #expect(transacoes.first?.nome == "Padaria")
    }

    @Test
    func deve_ignorar_transacao_sem_fechamento() async throws {
        let ofx = """
    <STMTTRN>
        <TRNTYPE>CREDIT</TRNTYPE>
        <DTPOSTED>20250327</DTPOSTED>
        <TRNAMT>100.00</TRNAMT>
        <FITID>00001</FITID>
    """ // Faltando </STMTTRN>

        let transacoes = TransacaoParser.extrairTransacoes(ofxContent: ofx)
        #expect(transacoes.isEmpty)
    }


    @Test
    func deve_ignorar_transacao_incompleta() async throws {
        let ofx = """
    <STMTTRN>
        <TRNAMT>80.00</TRNAMT>
        <FITID>abc123</FITID>
    </STMTTRN>
    """

        let transacoes = TransacaoParser.extrairTransacoes(ofxContent: ofx)
        #expect(transacoes.isEmpty)
    }

    @Test
    func deve_extrair_multiplas_transacoes() async throws {
        let ofx = """
    <STMTTRN>
        <TRNTYPE>DEBIT</TRNTYPE>
        <DTPOSTED>20250326</DTPOSTED>
        <TRNAMT>-10.00</TRNAMT>
        <FITID>001</FITID>
    </STMTTRN>
    <STMTTRN>
        <TRNTYPE>CREDIT</TRNTYPE>
        <DTPOSTED>20250327</DTPOSTED>
        <TRNAMT>100.00</TRNAMT>
        <FITID>002</FITID>
    </STMTTRN>
    """

        let transacoes = TransacaoParser.extrairTransacoes(ofxContent: ofx)
        #expect(transacoes.count == 2)
    }

    @Test
    func deve_extrair_valor_com_virgula() async throws {
        let ofx = """
    <STMTTRN>
        <TRNTYPE>DEBIT</TRNTYPE>
        <DTPOSTED>20250327</DTPOSTED>
        <TRNAMT>-15,50</TRNAMT>
        <FITID>998</FITID>
    </STMTTRN>
    """

        let transacoes = TransacaoParser.extrairTransacoes(ofxContent: ofx)
        #expect(transacoes.first?.valor == -15.50)
    }

    //@Test
    //func deve_extrair_transacoes_de_arquivo_real_nubank() async throws {
    //    guard let fileURL = Bundle.module.url(
    //        forResource: "Nubank_Exemplo",
    //        withExtension: "ofx"
    //    ) else {
    //        #expect(Bool(false), "Arquivo OFX não encontrado")
    //        return
    //    }
    //
    //    let ofxContent = try String(contentsOf: fileURL, encoding: .utf8)
    //    let transacoes = TransacaoParser.extrairTransacoes(ofxContent: ofxContent)
    //    print(ofxContent)
    //    #expect(!transacoes.isEmpty)
    //    #expect(transacoes.count > 0)
    //}
}
