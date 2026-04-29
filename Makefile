.DEFAULT_GOAL := help

.PHONY: help dev build clean

help:
	@echo "Available commands:"
	@echo "  make dev    - Start development server"
	@echo "  make build  - Build for production"
	@echo "  make clean  - Remove build artifacts"

dev:
	hugo server

build:
	hugo --minify --noChmod

clean:
	rm -rf public
	rm -rf resources