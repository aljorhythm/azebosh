set dotenv-load

setup:
    git config core.hooksPath .githooks
    pnpm i
    pnpx playwright install --with-deps chromium

start:
    pnpm run start:dev

build:
    pnpm run build

serve:
    pnpm run start:prod

lint:
    pnpm run lint

tests-unit:
    pnpm run test

tests-unit-watch:
    pnpm run test:watch

tests-browser:
    pnpm run test:browser

kill-server:
    kill $(lsof -t -i:${PORT}) || true

wait-server:
    #!/usr/bin/env bash
    MAX_RETRIES=3
    retries=0

    while true; do
        if curl -o /dev/null --silent --head --fail "${BASE_URL}"; then
            echo "${BASE_URL} is available."
            break
        else
            echo "${BASE_URL} Waiting for response..."
            retries=$((retries + 1))
            if [ $retries -ge $MAX_RETRIES ]; then
                echo "${BASE_URL} Max retries reached. Exiting."
                exit 1
            fi
            sleep 5
        fi
    done

tests-browser-re-serve:
    just build
    just kill-server
    just serve &
    just wait-server
    just tests-browser
