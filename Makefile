include .env.template
export

DBT_FOLDER := transform
TARGET  ?= dev
DBT_PROFILE_DIR := ./
PROFILE ?= transform

## Development
install: 
	uv sync --dev

format:
	uv run ruff format . 


debug:
	cd $(DBT_FOLDER) && dbt debug --target $(TARGET) --profile $(PROFILE) --profiles-dir $(DBT_PROFILE_DIR)

run:
	@echo "transform_path_output: $(TRANSFORM_S3_PATH_OUTPUT)"
	cd $(DBT_FOLDER) && dbt run \
        --profiles-dir $(DBT_PROFILE_DIR) \
        --target $(TARGET) \
		--profile $(PROFILE) \
		--vars '{"TRANSFORM_S3_PATH_OUTPUT": "$(TRANSFORM_S3_PATH_OUTPUT)", "TRANSFORM_S3_PATH_INPUT_EXCEL":"$(TRANSFORM_S3_PATH_INPUT_EXCEL)" }'

test:
	cd $(DBT_FOLDER) && dbt test --target $(TARGET) --profile $(PROFILE) --profiles-dir $(DBT_PROFILE_DIR)

build:
	cd $(DBT_FOLDER) && dbt build --target $(TARGET) --profile $(PROFILE) --profiles-dir $(DBT_PROFILE_DIR) \
		--vars '{"TRANSFORM_S3_PATH_OUTPUT": "$(TRANSFORM_S3_PATH_OUTPUT)", "TRANSFORM_S3_PATH_INPUT_EXCEL":"$(TRANSFORM_S3_PATH_INPUT_EXCEL)" }'

select:
	cd $(DBT_FOLDER) && dbt run --select path:models/marts/orders/dim_aeroplane.sql --target $(TARGET) --profile $(PROFILE) --profiles-dir $(DBT_PROFILE_DIR) \
		--vars '{"TRANSFORM_S3_PATH_OUTPUT": "$(TRANSFORM_S3_PATH_OUTPUT)", "TRANSFORM_S3_PATH_INPUT_EXCEL":"$(TRANSFORM_S3_PATH_INPUT_EXCEL)" }'

.PHONY: docs
docs: build
	uv pip install -r requirements.txt
	cd $(DBT_FOLDER) && dbt docs generate --target $(TARGET) --profile $(PROFILE) --profiles-dir $(DBT_PROFILE_DIR)
	@echo "Starting documentation on http://localhost:8089"
	cd $(DBT_FOLDER) && dbt docs serve --port 8089

clean:
	cd $(DBT_FOLDER) && dbt clean --target $(TARGET) --profile $(PROFILE) --profiles-dir $(DBT_PROFILE_DIR)
	
duck_dev:
	cd $(DBT_FOLDER) && duckdb duckdb_dir/transform_dev.db -cmd "USE transform; show all tables"

duck_prod:
	cd $(DBT_FOLDER) && duckdb duckdb_dir/transform_prod.db -cmd "USE transform; show all tables"

