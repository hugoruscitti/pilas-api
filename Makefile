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
