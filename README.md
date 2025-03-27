# OFXParser

**OFXParser** é uma biblioteca modular escrita em Swift com o objetivo acadêmico de estudar, interpretar e estruturar dados financeiros a partir de arquivos no formato **OFX (Open Financial Exchange)**.

## Objetivo

Este projeto tem como finalidade explorar a construção de uma biblioteca reutilizável, com foco na **separação de responsabilidades**, **leitura eficiente de arquivos OFX** e **organização semântica dos dados extraídos**. A proposta é desenvolver uma solução clara, testável e alinhada às boas práticas de desenvolvimento com Swift e Swift Package Manager (SPM).

## Sobre o formato OFX

O OFX é um padrão aberto utilizado por instituições financeiras para troca de dados bancários, como transações, saldos e informações de conta. Ele é baseado em uma estrutura semelhante ao SGML e requer uma abordagem específica para leitura e parsing.

## Motivação

Este projeto é de natureza acadêmica e está sendo desenvolvido como parte dos meus estudos sobre:

- Boas práticas com Swift moderno
- Estruturação de bibliotecas reutilizáveis com SPM
- Leitura e análise de arquivos estruturados
- Manipulação de dados financeiros para uso em aplicativos nativos para macOS

## Funcionalidades previstas

- Leitura do conteúdo bruto de arquivos `.ofx`
- Parsing dos dados financeiros estruturados
- Modelagem de entidades como transações, contas e instituições
- Possibilidade de evolução para exportação ou integração com interfaces gráficas

## Tecnologias

- Swift 6
- Swift Package Manager (SPM)

## Testes

Este projeto utiliza o novo sistema de testes introduzido no Swift 5.9: **Swift Testing**.  
A abordagem é moderna, baseada em estruturas com `@Test` e uso de `#expect`, oferecendo uma sintaxe mais expressiva e integrada com o Xcode 15 ou superior.

Os testes estão localizados no diretório `Tests/OFXParserTests` e são executados diretamente no Xcode ou via linha de comando com:

```bash
swift test
```


## Licença

Este projeto é de uso acadêmico e sem fins comerciais. Está licenciado sob os termos da [MIT License](LICENSE), permitindo estudo, modificação e uso livre com atribuição.
