.PHONY: clean
clean:
	rm -rf TC/ TC_INSTALL/

.PHONY: install
install: TC_INSTALL/
	dosbox -fullscreen -conf dosbox-install-tc.conf

.PHONY: run-tc
run-tc: TC/
	dosbox -fullscreen -conf dosbox-install-tc.conf

.ONESHELL:
TC_INSTALL/: tc3.zip
	mkdir TC_INSTALL
	cd TC_INSTALL
	unzip ../tc3.zip

.ONESHELL:
TC/: TC_INSTALL/

