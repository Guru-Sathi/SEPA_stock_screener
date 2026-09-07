.PHONY: install run lint format test clean

install:
	pip install -e .

run:
	python main.py

lint:
	ruff check .
	mypy config core

format:
	ruff format .

test:
	pytest tests/ -v

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".ruff_cache" -exec rm -rf {} +