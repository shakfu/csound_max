SCRIPTS := source/scripts


.PHONY: build deps fixup clean setup release

all: build


build:
	@mkdir -p build && cd build && cmake .. && make


static: fixup


deps:
	@bash $(SCRIPTS)/build_dependencies.sh


fixup: relocatable
	@bash $(SCRIPTS)/fix_bundle.sh


relocatable: deps
	mkdir -p build && cd build && cmake -DBUILD_RELOCATABLE=ON .. && make


clean:
	@rm -rf build


setup:
	ln -s $(shell pwd) "$(HOME)/Documents/Max 8/Packages/$(shell basename `pwd`)"
