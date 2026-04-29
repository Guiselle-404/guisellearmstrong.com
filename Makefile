.DEFAULT_GOAL := help

.PHONY: help dev build clean

help:
	@echo "Available commands:"
	@echo "  make dev    - Start development server"
	@echo "  make build  - Build for production"
	@echo "  make clean  - Remove build artifacts"

dev:
	cd hugo-theme-academic-cv && hugo server

build:
	cd hugo-theme-academic-cv && hugo --minify

clean:
	rm -rf hugo-theme-academic-cv/public
	rm -rf hugo-theme-academic-cv/resources
