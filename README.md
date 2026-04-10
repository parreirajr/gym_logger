# GymLogger 🏋️‍♂️

O **GymLogger** é uma aplicação Flutter moderna e minimalista projetada para o registro e acompanhamento de treinos de academia. Desenvolvido com foco em performance e organização, o projeto utiliza uma arquitetura robusta para garantir escalabilidade e facilidade de manutenção.

## 🚀 Funcionalidades

- **Gestão de Treinos**: CRUD completo (Criar, Ler, Atualizar e Deletar) de exercícios.
- **Persistência Local**: Armazenamento seguro de dados utilizando SQLite para registros de treino.
- **Autenticação Persistente**: Gerenciamento de sessão de usuário com `shared_preferences`.

## 🏗️ Arquitetura

O projeto utiliza uma combinação de **Clean Architecture** e **Atomic Design**, separando claramente as responsabilidades:

### ⚛️ Atomic Design (Presentation Layer)
- **Atoms**: Componentes básicos e indivisíveis (Botões, Textos, campos de entrada).
- **Molecules**: Combinação de átomos (Grupos de campos de formulário, linhas de informação).
- **Organisms**: Componentes complexos e funcionais (Cards de treino, Listas, Formulários completos).
- **Pages**: Telas que orquestram os organismos e gerenciam as rotas.

### 📁 Estrutura de Pastas
- `lib/domain`: Modelos de dados e contratos.
- `lib/data`: Implementação de repositórios, serviços de banco de dados e persistência.
- `lib/presentation`: Toda a UI organizada seguindo o padrão Atômico.
- `lib/presentation/theme`: Definições globais de cores e estilos.

## 🛠️ Tecnologias Utilizadas

- **Flutter & Dart**: Framework e linguagem principal.
- **SQLite (sqflite)**: Banco de dados relacional local.
- **Shared Preferences**: Persistência de configurações leves e estado de login.
- **Navigator 1.0**: Sistema de rotas nomeadas.

## 🏁 Como Começar

### Pré-requisitos
- Flutter SDK instalado (versão ^3.11.0)
- Um emulador ou dispositivo físico configurado

### Instalação
1. Clone o repositório:
   ```bash
   git clone git@github.com-parreirajr:parreirajr/gym_logger.git
   ```
2. Instale as dependências:
   ```bash
   flutter pub get
   ```
3. Execute o projeto:
   ```bash
   flutter run
   ```

## 🧪 Testes

O projeto conta com testes de widget para garantir a integridade dos componentes atômicos e dos fluxos principais:
```bash
flutter test
```

---
Desenvolvido com o suporte de Inteligência Artificial para uma estrutura limpa e eficiente.

