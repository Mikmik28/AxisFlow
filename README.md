# AxisFlow
**Keep inventory, orders, and finance moving on the same axis.**

Rails-first, modular ERP for SMBs: Inventory, Sales (O2C), Purchasing (P2P), and Finance (GL) with a pragmatic AI roadmap.

---

## Tech Stack
- **Ruby** 3.3 • **Rails** 8  
- **DB:** PostgreSQL 16 • **Cache/Jobs:** Redis 7 (+ Solid Queue)  
- **Frontend:** Hotwire (Turbo/Stimulus) + Tailwind CSS  
- **Auth/RBAC:** Devise + Pundit  
- **Testing:** RSpec (+ FactoryBot, Faker)  
- **Obs:** Lograge, optional Sentry  
- **CI:** GitHub Actions

---

## Quick Start (Local)

**Prereqs:** Ruby 3.3, Postgres 16, Redis 7, Node (for Tailwind), Yarn/NPM

~~~bash
# install gems
bundle install

# (optional) start Postgres/Redis via Docker
docker compose up -d

# database
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed

# run dev server (includes Tailwind watcher / jobs via Procfile.dev if you use foreman/overmind)
bin/dev    # or: bin/rails s
~~~

**Demo login (after Devise is enabled):** `admin@acme.test` / `password123` (see `db/seeds.rb`)

---

## Running Tests

~~~bash
RAILS_ENV=test bin/rails db:create db:schema:load
bundle exec rspec
~~~

### CI (GitHub Actions)
Ensure DB prep & specs run with **`RAILS_ENV=test`**.

~~~yaml
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:16
        env:
          POSTGRES_PASSWORD: postgres
          POSTGRES_USER: postgres
          POSTGRES_DB: axisflow_test
        ports: ["5432:5432"]
        options: >-
          --health-cmd="pg_isready -U postgres"
          --health-interval=10s --health-timeout=5s --health-retries=5
    steps:
      - uses: actions/checkout@v4
      - uses: ruby/setup-ruby@v1
        with: { ruby-version: '3.3' }
      - run: bundle install --jobs 4 --retry 3
      - name: Prepare test DB
        run: |
          bin/rails db:create
          bin/rails db:schema:load || bin/rails db:migrate
        env:
          RAILS_ENV: test
          DATABASE_URL: postgres://postgres:postgres@localhost:5432/axisflow_test
      - name: Run specs
        run: bundle exec rspec
        env:
          RAILS_ENV: test
          DATABASE_URL: postgres://postgres:postgres@localhost:5432/axisflow_test
~~~

---

## Project Structure (high level)

~~~text
app/
  domains/
    identity/    # org, users, roles
    inventory/   # products, warehouses, stock
    sales/       # orders, shipments, invoices
    purchasing/  # POs, receipts, bills
    finance/     # ledger accounts, journals
  services/      # domain service objects
  policies/      # Pundit policies
  jobs/          # background jobs
~~~

---

## Roadmap (Epics)
- Core Platform & DevEx (bootstrap, CI, seeds)  
- Identity & RBAC (Devise, Pundit, audit)  
- Catalog & Inventory Foundations  
- Order-to-Cash (Sales)  
- Procure-to-Pay (Purchasing)  
- Finance (GL & Close)  
- Reporting & Exports  
- Integrations (Xero/MYOB)  
- AI Foundations (Semantic Search & OCR)  
- Observability & Ops  

See the GitHub Project **“AxisFlow”** for tickets, story points, and sprints.

---

## Environment & Config
- Secrets via Rails Credentials / ENV.  
- Tailwind via `cssbundling-rails`.  
- Postgres & Redis connection vars configurable via ENV for deploys.

---

## Contributing
1. Branch from `main`, keep PRs focused.  
2. Add/maintain specs; keep CI green.  
3. Run linters/security checks if enabled (RuboCop, Brakeman, bundler-audit).

---

## License
MIT (or your preferred OSS license)

