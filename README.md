# Общие настройки Portable Agent

Здесь лежат общие файлы GitHub-организации `portable-agent`.

Репозиторий отвечает за:

- профиль организации;
- шаблоны issue и pull request;
- общие CI/CD-процессы;
- единые правила документации и проверки репозиториев.
- шаблоны CI для Java, Python и Node;
- каркас обязательной документации нового сервиса.

Код сервисов здесь не хранится. Каждый сервис находится в своей репе.

## Что где лежит

- `.github/workflows/` — процессы, которые могут вызывать другие репы.
- `reusable-docs.yml` проверяет структуру и строго собирает MkDocs.
- `reusable-security.yml` запускает Gitleaks и закреплённую версию Trivy на чистом runner.
- `.github/ISSUE_TEMPLATE/` — шаблоны задач.
- `profile/README.md` — главная страница организации.
- `docs/` — правила и устройство этого репозитория.
- `scripts/check-docs.ps1` — простая проверка обязательной документации.
- `workflow-templates/` — короткие CI-шаблоны с test, security, SBOM и подписью.
- `service-template/` — README, карточка сервиса, CODEOWNERS и правила AI-агентов.

## Проверка

```powershell
pwsh ./scripts/check-docs.ps1
pwsh ./scripts/check-workflows.ps1
```

## Полезные ссылки

- [Архитектура платформы](https://portable-agent.github.io/platform/)
- [Все репозитории](https://github.com/orgs/portable-agent/repositories)

## Лицензия

Apache License 2.0.
