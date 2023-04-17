SCRIPTS := source/scripts


.PHONY: cmake-default cmake-relocatable relocatable deps fixup clean setup 

all: cmake-default


cmake-default:
	@mkdir -p build && cd build && cmake .. && make


relocatable: fixup


deps:
	@bash $(SCRIPTS)/build_dependencies.sh


fixup: cmake-relocatable
	@bash $(SCRIPTS)/fix_bundle.sh


cmake-relocatable: deps
	@mkdir -p build && cd build && cmake -DBUILD_RELOCATABLE=ON .. && make


clean:
	@rm -rf build


setup:
	git submodule init
	git submodule update
	ln -s $(shell pwd) "$(HOME)/Documents/Max 8/Packages/$(shell basename `pwd`)"
