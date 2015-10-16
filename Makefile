N=[0m
V=[01;32m

VERSION=1.1.0

all:
	@echo ""
	@echo "Comandos disponibles:"
	@echo ""
	@echo "  $(V)compilar$(N)   Genera la documentación local."
	@echo "  $(V)actualizar$(N) Actualiza la documentación."
	@echo ""

compilar:
	make -f Makefile.sphinx html

actualizar: compilar
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
