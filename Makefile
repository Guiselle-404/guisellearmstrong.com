.DEFAULT_GOAL := help

.PHONY: help dev build clean resume

help:
	@echo "Available commands:"
	@echo "  make dev     - Start development server"
	@echo "  make build   - Build for production"
	@echo "  make clean   - Remove build artifacts"
	@echo "  make resume  - Update resume PDF (copies source to static/)"

dev:
	hugo server

build:
	hugo --minify --noChmod

clean:
	rm -rf public
	rm -rf resources

resume:
	cp resumes/Guiselle_Armstrong_Resume.pdf static/resume.pdf
	@echo "Resume PDF updated: static/resume.pdf"

# Alias: 'update-resume' does the same as 'resume'
update-resume: resume
