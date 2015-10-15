N=[0m
V=[01;32m

VERSION=1.1.0

all:
	@echo ""
	@echo "Comandos disponibles:"
	@echo ""
	@echo "  $(V)generar$(N)  Actualiza la documentación."
	@echo ""

generar:
	make -f Makefile.sphinx html
	date > last_build.txt
	git add .
	git commit -m "update"
	git push
	git checkout gh-pages
	rm -rf doctrees
	rm -rf html
	rm -rf stylesheets
	rm -rf _sources _static *.html objects.inv searchindex.js *.json
	mv build/html/* ./
	rm -rf build
	date > last_build.txt
	git add .
	git commit -m "actualizando."
	git push origin gh-pages
	git checkout master
