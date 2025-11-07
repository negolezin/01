# Finance Control App

Projeto Flutter inicializado manualmente com estrutura modularizada em `lib/src`.

## Dependências principais
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) para gerenciamento de estado reativo.
- [drift](https://pub.dev/packages/drift) e [drift_flutter](https://pub.dev/packages/drift_flutter) para persistência local.
- [intl](https://pub.dev/packages/intl) para formatação e internacionalização.
- [charts_flutter](https://pub.dev/packages/charts_flutter) para visualização de dados.

## Estrutura de pastas
```
lib/
  src/
    data/
    domain/
    ui/
```

## Localização
Arquivos `.arb` residem em `assets/translations`. A configuração do `l10n.yaml` permite gerar classes de localização personalizadas ao executar `flutter gen-l10n`.

## Como executar e compilar localmente

### 1. Pré-requisitos
- [Flutter SDK](https://docs.flutter.dev/get-started/install) configurado no PATH.
- Ferramentas de plataforma (Android Studio/SDK para gerar APK, Chrome para build web opcional).

### 2. Clonar o repositório e acessar o projeto
```bash
git clone <url-do-repositorio>
cd finance_control_app
```

### 3. Instalar dependências e gerar código necessário
Execute estes comandos sempre que atualizar dependências, modelos Drift ou arquivos `.arb`:
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

### 4. Rodar o app em modo debug
Conecte um dispositivo/emulador Android ou abra um Chrome e execute:
```bash
flutter run
```

### 5. Gerar artefatos de release

#### APK Android
```bash
flutter build apk --release
```
Saída: `build/app/outputs/flutter-apk/app-release.apk`.

#### Bundle Web
```bash
flutter build web --release
```
Saída: `build/web/` com arquivos estáticos para hospedagem.

> Dica: caso altere o esquema de banco (Drift) ou traduções, repita o passo 3 antes de novos builds.

## Build automatizado (GitHub Actions)
Este repositório inclui o workflow [`Build Flutter artifacts`](.github/workflows/build.yml), que:
- compila a aplicação Android (APK) e um bundle web a cada push/pull request;
- publica os artefatos resultantes como anexos do workflow, permitindo baixar o APK ou o pacote web diretamente da aba "Actions" no GitHub;
- executa os passos de geração de código (`build_runner`) e de localização (`gen-l10n`) antes do build, garantindo que o projeto compile sem arquivos gerados manualmente.

Para baixar os artefatos, acesse a execução do workflow e utilize a seção "Artifacts".
