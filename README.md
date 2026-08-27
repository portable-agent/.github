# Portable Agent — организация GitHub

Этот репозиторий хранит общие настройки организации: профиль, шаблоны задач и pull request,
политику безопасности и переиспользуемые CI/CD workflows.

## Reusable workflows

- `reusable-java.yml` — сборка Gradle, тесты и статический анализ Java-сервисов.
- `reusable-python.yml` — Ruff, mypy и pytest для Python-сервисов.
- `reusable-node.yml` — lint, test и build для TypeScript-проектов на pnpm.
- `reusable-container.yml` — OCI image, Trivy, SBOM и provenance для GHCR.

Сервисы вызывают workflows явно по версии. Изменения здесь проходят обычный pull request review.

## Лицензия

Apache License 2.0.
