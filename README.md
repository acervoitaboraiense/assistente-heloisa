# Assistente Heloísa

[![Python Version](https://img.shields.io/badge/python-3.10%2B-yellow.svg)](https://python.org)
[![Status](https://img.shields.io/badge/status-em%20desenvolvimento-blue.svg)]()

A Assistente Heloísa é uma assistente virtual baseada em **CLI (Interface de Linha de Comando)** desenvolvida em Python. Ela foi criada para funcionar diretamente no **Terminal do Windows**, com o objetivo de consultar e divulgar o acervo histórico, geográfico e cultural da cidade de Itaboraí.

---

## Objetivo

Disponibilizar um canal rápido e acessível para que moradores e visitantes possam tirar dúvidas sobre Itaboraí, utilizando dados reais que estarão disponíveis no [site oficial do projeto](https://memoriaitaboraiense.shop).

---

## Pré-requisitos

* Windows 10 / 11
* Python 3.10 ou superior instalado ([clique para baixar](https://python.org))
* Conexão com a internet (para instalação das bibliotecas e futuras consultas ao site)

---

## Como Instalar e Executar

1. **Clone ou baixe o repositório**
   ```bash
   git clone https://github.com/acervopedrabonita/assistente-heloisa
   cd assistente-heloisa
   ```

2. **Instale as dependências.**
   Certifique-se de ter o arquivo `requirements.txt` na pasta com o seguinte conteúdo:
   ```text
   requests
   beautifulsoup4
   ```
   Em seguida, instale as bibliotecas com o comando:
   ```bash
   pip install -r requirements.txt
   ```

3. **Execute a assistente**
   ```bash
   py heloisa.py
   ```

---

## Como Usar

Ao iniciar, a Heloísa exibirá uma saudação. Basta digitar sua pergunta sobre Itaboraí.

**Exemplo prático:**
```text
========================================================
Olá! Eu sou a Heloísa, a assistente virtual de Itaboraí!
Pergunte sobre a cidade ou digite 'sair' para encerrar.
========================================================

Você: Qual é a população de Itaboraí?
Heloísa: A população de Itaboraí é de aproximadamente 240.169 habitantes.

Você: sair
Heloísa: Até logo! Volte sempre.
```

**Comandos disponíveis:**
* Digite `sair`, `tchau` ou `fim` para encerrar a assistente.

---

## Estrutura do Projeto

```text
assistente-heloisa/
├── heloisa.py          # Código principal da assistente
├── requirements.txt    # Dependências do projeto
└── README.md           # Documentação completa
```

---

## Roteiro de Evolução (Roadmap)

* [ ] Integração total com o site oficial para consulta em tempo real.
* [ ] Armazenamento em banco de dados SQLite para histórico e performance.
* [ ] Uso de expressões regulares ou NLP básica para entender perguntas mais complexas.
* [ ] Interface colorida no terminal usando a biblioteca `colorama`.
* [ ] Criação de uma versão web para acesso via navegador.

---

## Como Contribuir

Quer ajudar a melhorar a Heloísa? Ficaremos felizes!

1. Faça um **fork** do projeto.
2. Crie uma **branch** para sua modificação: `git checkout -b feature/sua-ideia`.
3. Envie um **pull request** com uma descrição clara do que foi alterado.
4. Caso encontre erros ou tenha sugestões, abra uma **issue**.

---

## Licença

Este projeto é de código aberto sob a licença [MIT](LICENSE). Sinta-se livre para usar, estudar e modificar, desde que mantidos os devidos créditos à equipe do Acervo Itaboraiense.

---

## Agradecimentos

Agradecemos a toda a comunidade de Itaboraí que preserva a história da nossa cidade, e à comunidade open-source que mantém vivas ferramentas como Python, Requests e BeautifulSoup.
