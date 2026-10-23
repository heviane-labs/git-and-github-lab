# Sinalização de Status do Projeto

De acordo com as boas práticas de projetos open-source e no ecossistema GitHub, a melhor estratégia combina **sinalização visual imediata no README**, **versionamento semântico** e **metadados do repositório**.

Aqui estão as 4 práticas mais adotadas pelo mercado, ordenadas por impacto:

---

## 1. Banner / Callout de Destaque no Topo do README (Mais eficaz)

Colocar um aviso logo após o subtítulo ou badges iniciais é a forma mais transparente de alinhar expectativas para quem acessa o repositório. O próprio GitHub suporta sintaxe nativa de alerta:

```markdown
> [!WARNING]
> **Projeto em Desenvolvimento Ativo (WIP — Work in Progress)**  
> Este template está em fase de construção do MVP (Fase 2). A estrutura de pastas, contratos e APIs podem sofrer alterações até o lançamento da versão `v1.0.0`. Acompanhe o progresso em nosso [Roadmap](docs/03-project-roadmap.md).
```

---

## 2. Badge de Status (Padrão Shields.io ou Repostatus.org)

Adicionar uma badge visual junto aos selos de tecnologias (Next.js, TypeScript, MIT, etc.):

* **Shields.io (Simples e direto):**
  ```markdown
  [![Status](https://img.shields.io/badge/Status-Em_Desenvolvimento-orange?style=for-the-badge&logo=git)](docs/03-project-roadmap.md)
  ```
  
* **Repostatus.org (Padrão formal da comunidade open-source):**
  ```markdown
  [![Project Status: WIP](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
  ```
  
---

## 3. Versionamento Semântico (SemVer: `0.x.x`)

Pela especificação do [SemVer (Semantic Versioning)](https://semver.org/):

* Qualquer versão inicial deve ser mantida na faixa `0.y.z` (ex: `0.1.0` ou com sufixos pré-release como `0.1.0-alpha`).
* A regra fundamental do SemVer para `0.x` estabelece formalmente que *o software é considerado instável e a API pública ainda não está fechada*.
* No GitHub Releases, marque as versões preliminares como **"Pre-release"**.

---

## 4. Metadados e Descrição no GitHub

Nas configurações da página inicial do repositório no GitHub:

* **Descrição do Repo:** Adicionar o prefixo `[WIP]` ou `[Em desenvolvimento]` na descrição curta:
  > *`[WIP] 🚀 Template/Boilerplate modular de alta performance para websites institucionais.`*
  
* **Topics/Tags:** Incluir tags como `wip`, `work-in-progress` ou `in-development`.

---
