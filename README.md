# 🚀 DevOpsProject – Salesforce DevOps & Integrações com Playgrounds

Este projeto é uma simulação de um pipeline completo de DevOps no Salesforce com foco em **controle de mudanças**, **automação de deploys** e **integrações externas**, tudo utilizando apenas **Trailhead Playgrounds**.

---

## 💡 Visão Geral

O **DevOpsProject** demonstra como seria possível gerenciar e automatizar o ciclo de vida de uma mudança no Salesforce, desde o ambiente de desenvolvimento (DEV), passando por testes (QA), até chegar na validação final (UAT), com deploys automáticos controlados por branches no GitHub.

---

## 🧱 Funcionalidades Principais

- ✅ **Objeto personalizado** `ChangeRequest__c` para simular gerenciamento de mudanças
- ✅ **API REST em Apex** para leitura e criação de requisições
- ✅ **Integração externa via chamada HTTP com API pública**
- ✅ **Deploy automatizado com GitHub Actions** entre orgs DEV → QA → UAT
- ✅ **Ambientes protegidos** por esteira (não é possível subir de DEV direto para UAT)

---

## 🧭 Pipeline (Esteira de Ambientes)

```mermaid
flowchart LR
    DEV[DEV Playground] --> QA[QA Playground]
    QA --> UAT[UAT Playground]
