.PHONY: install test upload docs


install:
	pip install -e .[docs,test]

test:
	py.test --reuse-db 

retest:
	py.test -vvv --lf

coverage:
	py.test --cov=wagtail_factories --cov-report=term-missing --cov-report=html

docs:
	$(MAKE) -C docs html

release:
	rm -rf dist/*
	python setup.py sdist bdist_wheel
	twine upload dist/*