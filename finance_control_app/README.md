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

## Como executar localmente
1. Instale o [Flutter SDK](https://docs.flutter.dev/get-started/install).
2. Dentro do diretório `finance_control_app`, obtenha as dependências e gere o código necessário:
   ```bash
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   flutter gen-l10n
   ```
3. Execute o aplicativo em um dispositivo/emulador com:
   ```bash
   flutter run
   ```

## Como gerar artefatos de distribuição
Para criar um APK de release localmente:
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter gen-l10n
flutter build apk --release
```
O arquivo será criado em `build/app/outputs/flutter-apk/app-release.apk`.

Para gerar o bundle web estático:
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter gen-l10n
flutter build web --release
```
Os arquivos finais ficarão em `build/web`.

## Build automatizado (GitHub Actions)
Este repositório inclui o workflow [`Build Flutter artifacts`](.github/workflows/build.yml), que:
- compila a aplicação Android (APK) e um bundle web a cada push/pull request;
- publica os artefatos resultantes como anexos do workflow, permitindo baixar o APK ou o pacote web diretamente da aba "Actions" no GitHub;
- executa os passos de geração de código (`build_runner`) e de localização (`gen-l10n`) antes do build, garantindo que o projeto compile sem arquivos gerados manualmente.

Para baixar os artefatos, acesse a execução do workflow e utilize a seção "Artifacts".
