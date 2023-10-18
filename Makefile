include .env

clone-submodule:
	git submodule update --init --recursive

clone-plugin-into-kibana-plugin:
	cd kibana/plugins && \
	git clone https://github.com/lizozom/custom-kibana-theme.git

copy-plugin-into-kibana-plugin:
	cp -r ./public kibana/plugins/custom-kibana-theme

setup-kibana:
	cd kibana && \
    git checkout $(KIBANA_VERSION) && \
    yarn kbn bootstrap

plugin-build:
	$(MAKE) copy-plugin-into-kibana-plugin && \
	cd kibana/plugins/custom-kibana-theme && \
	NODE_OPTIONS='--openssl-legacy-provider' yarn build

plugin-output:
	cp kibana/plugins/custom-kibana-theme/build/* $(OUTPUT_PATH)

plugin-output-sub:
	cp kibana/plugins/custom-kibana-theme/build/* $(OUTPUT_PATH_SUB)

plugin-build-output:
	$(MAKE) plugin-build && \
	$(MAKE) plugin-output

plugin-build-output-sub:
	$(MAKE) plugin-build && \
	$(MAKE) plugin-output
	$(MAKE) plugin-output-sub
