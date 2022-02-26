.PHONY: clean
clean:
	rm -rf TC/ TC_INSTALL/ PONG.EXE PONG.OBJ

.PHONY: install
install: TC_INSTALL/
	dosbox -fullscreen -conf dosbox/install-tc.conf

.PHONY: run-tc
run-tc: TC/
	dosbox -fullscreen -conf dosbox/run-tc.conf

run: pong.exe
	dosbox -fullscreen -conf dosbox/play-pong.conf

pong.exe: pong.cpp
	dosbox -fullscreen -conf dosbox/compile-pong.conf

.ONESHELL:
TC_INSTALL/: tc3.zip
	mkdir TC_INSTALL
	cd TC_INSTALL
	unzip ../tc3.zip

.ONESHELL:
TC/: TC_INSTALL/

