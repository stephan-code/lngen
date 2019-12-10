SRC = $(wildcard ./*.ipynb)

all: lngen docs

lngen: $(SRC)
	nbdev_build_lib
	touch lngen

docs: $(SRC)
	nbdev_build_docs
	touch docs

test:
	nbdev_test_nbs

pypi: dist
	twine upload --repository pypi dist/*

dist: clean
	python setup.py sdist bdist_wheel

clean:
	rm -rf dist