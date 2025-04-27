# SDT-503 Assignment 3

## Overview
This repository provides a Docker-based performance testing solution for the Petstore user API (Create, Update, Delete) using Apache JMeter, InfluxDB, and Grafana:

- **JMeter**: Executes CRUD operations against https://petstore.swagger.io
- **InfluxDB**: Stores time-series metrics from JMeter
- **Grafana**: Visualizes JMeter metrics with the community dashboard (ID 4026)

## Repository Structure
```
/
├── .docker/
│   ├── influxdb/      # Custom InfluxDB Dockerfile & init scripts
│   ├── jmeter/        # JMeter Dockerfile, test plans, properties
│   └── grafana/       # Grafana Dockerfile & provisioning
├── data/
│   └── users.csv      # CSV dataset for JMeter
├── docker-compose.yaml
├── run.sh             # Local non-GUI JMeter runner
└── README.md          # (this file)
```

### Key Directories
- **.docker/influxdb**: Defines and builds an InfluxDB image, auto-creates the `jmeter` bucket.
- **.docker/jmeter**: Builds a JMeter image, copies `user-api.jmx` and `user.properties`, and sets up the entrypoint.
- **.docker/grafana**: Builds Grafana with provisioning for the JMeter dashboard and InfluxDB datasource.
- **data/users.csv**: Supplies test user data (username,password,email).

## Prerequisites
- Docker ≥ 20.10
- Docker Compose ≥ 1.29
- Git

## Quick Start
1. **Clone the Repo**
   ```bash
   git clone https://github.com/MyronProDev/sdt-503-assignment-3.git
   cd sdt-503-assignment-3
   ```

2. **Populate Sample Data**
   ```bash
   cat <<EOF > data/users.csv
username,password,email
alice,Secret123,alice@example.com
bob,Secret123,bob@example.com
EOF
   ```

3. **Build & Launch**
   ```bash
   docker-compose up --build -d
   ```

4. **Access Services**
    - **Grafana**: http://localhost:8857  (admin/admin)
    - **InfluxDB UI**: http://localhost:8086

## Running JMeter Tests
- **Via Docker Compose**: JMeter service runs on startup and pushes metrics to InfluxDB.
- **Locally (non-GUI mode)**:
  ```bash
  ./run.sh -Jthreads=5 -Jloops=10
  ```
    - Customize with `-Jthreads` and `-Jloops` for load parameters.

## Customization
- **JMeter**: Modify `user-api.jmx` under `.docker/jmeter` and adjust `user.properties` for InfluxDB URL.
- **InfluxDB**: Change bucket or credentials in `.docker/influxdb` configuration.
- **Grafana**: Update provisioning YAML or dashboard JSON under `.docker/grafana`.
- **Data**: Edit `data/users.csv` to add or change user records.

## License
This project is licensed under the MIT License. See `LICENSE` for details.

