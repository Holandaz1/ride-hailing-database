# Ride-Hailing Database (`db_uber_app`)

MySQL relational database project modeled for a ride-hailing platform, covering passengers, drivers, vehicles, fare categories, rides, payments, and fare change auditing.

## Repository Structure

SQL scripts are organized under `scripts/` for sequential execution:

1. `01_schema.sql` — Creates the `db_uber_app` database, tables, primary/foreign keys, `UNIQUE` and `CHECK` constraints, and timestamp/update columns.
2. `02_seed_dml.sql` — Inserts sample data to test queries, reports, and routines.
3. `03_indexes.sql` — Creates indexes on foreign keys, status columns, dates, and search fields.
4. `04_queries.sql` — `JOIN` and aggregation queries for ride details, payment summaries/totals, and driver performance.
5. `05_routines.sql` — Consolidated rides `VIEW`, post-update audit `TRIGGER` on `fares`, and `PROCEDURE` to update payment status.

## How to Run

1. Open MySQL Workbench (or your preferred MySQL client) connected to your local server.
2. Run the scripts in numerical order (`01` through `05`).

## Key Rules and Objects

- **Data integrity:** `rating` constrained to `>= 3.00` for passengers and drivers; unique `plate` in `vehicles`; unique `email` in `passengers` and `drivers`.
- **Fare auditing:** Updates on `fares` trigger `trg_fares_after_update`, recording previous values, timestamp, and user (`USER()`) in `fares_audits`.
- **Payment updates:** `sp_update_payment_status(p_id_payment, p_new_status)` updates `payment_status` and sets `payment_date` (`NOW()`).
