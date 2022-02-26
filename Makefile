.PHONY: clean
clean:  ## Clean all the generated files
	rm -rf TC/ TC_INSTALL/ PONG.EXE PONG.OBJ

.PHONY: install
install: TC_INSTALL/  ## Install the Turbo C IDE

.PHONY: run-tc
run-tc: TC  ## Run the Turbo C IDE
	dosbox -fullscreen -conf dosbox/run-tc.conf

run: pong.exe  ## Run the game that you want to be compiled
	dosbox -fullscreen -conf dosbox/play-pong.conf

pong.exe: pong.cpp
	dosbox -fullscreen -conf dosbox/compile-pong.conf

.ONESHELL:
TC_INSTALL: tc3.zip
	mkdir TC_INSTALL
	cd TC_INSTALL
	unzip ../tc3.zip
	dosbox -fullscreen -conf dosbox/install-tc.conf

.ONESHELL:
TC: TC_INSTALL

.SILENT: help
help:   ## print this help
	echo '** Make targets **'
	grep '^[a-zA-Z]' $(MAKEFILE_LIST) | \
    sort | \
    awk -F ':.*?## ' 'NF==2 {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

