set dotenv-load

setup:
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
    until curl -o /dev/null --silent --head --fail ${BASE_URL}; do
        echo "Waiting for response..."
        sleep 5  # Wait for 5 seconds before retrying
    done

tests-browser-re-serve:
    just build
    just kill-server
    just serve &
    just wait-server
    just tests-browser
