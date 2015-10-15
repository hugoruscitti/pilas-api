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
	if [ -n "$(git status --porcelain)" ]; then echo "there are changes"; else echo "no changes"; fi
	git add .
	git commit -m "update"
	git push
	git checkout gh-pages
	mv build/* ./
	rmdir build
	git add .
	git commit -m "actualizando."
	git push origin gh-pages
	git checkout master
