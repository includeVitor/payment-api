# payment-api &middot; [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/includeVitor/payment-api/blob/main/LICENSE) ![Main CI](https://github.com/includevitor/payment-app/actions/workflows/main.yml/badge.svg) [![codecov](https://codecov.io/gh/includeVitor/payment-api/branch/main/graph/badge.svg?token=P3F30NYU3B)](https://codecov.io/gh/includeVitor/payment-api)

Running locally with docker:
- Start the application with `docker-compose up --build`
- Now you can visit [`localhost:4000`](http://localhost:4000) from your browser

Running locally:
- Run `mix deps.get` to install all dependencies
- Create and migrate your database with `mix ecto.setup`
- Start the application with `mix phx.server`
- Now you can visit [`localhost:4000`](http://localhost:4000) from your browser

Running tests:

- Runn `mix test` to execute the tests
- Run `mix coveralls.html` to execute the tests and export the reports to `/cover` folder

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).
