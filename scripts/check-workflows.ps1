$ErrorActionPreference = "Stop"

$workflow = Get-Content -LiteralPath ".github/workflows/reusable-container.yml" -Raw
$requiredLines = @(
    'id-token: write',
    'push: ${{ github.event_name != ''pull_request'' }}',
    'load: ${{ github.event_name == ''pull_request'' }}',
    'provenance: ${{ github.event_name == ''pull_request'' && ''false'' || ''mode=max'' }}',
    'sbom: ${{ github.event_name != ''pull_request'' }}',
    'uses: actions/attest-build-provenance@v4',
    'push-to-registry: true',
    'uses: sigstore/cosign-installer@v4.0.0',
    'run: cosign sign --yes "${IMAGE}@${DIGEST}"'
)

foreach ($line in $requiredLines) {
    if (-not $workflow.Contains($line)) {
        throw "В reusable-container.yml нет ожидаемого правила: $line"
    }
}

$publishSteps = @(
    "Аттестовать образ",
    "Установить Cosign",
    "Подписать образ через GitHub OIDC"
)

foreach ($stepName in $publishSteps) {
    $escapedName = [regex]::Escape($stepName)
    $stepPattern = "(?ms)^\s{6}- name: $escapedName\r?\n(?:(?!^\s{6}- name: ).)*"
    $step = [regex]::Match($workflow, $stepPattern)
    if (-not $step.Success) {
        throw "В reusable-container.yml нет шага: $stepName"
    }
    if (-not $step.Value.Contains("if: github.event_name != 'pull_request'")) {
        throw "Шаг '$stepName' не должен выполняться в pull request."
    }
}

Write-Host "Режимы container workflow настроены корректно."
