base:
	docker build . --target=base -t vimbase:latest

vimgo: base
	docker build . --file=Dockerfile.vimgo -t vimgo:latest

vimnode: base
	docker build . --file=Dockerfile.vimnode -t vimnode:latest

vimpy: base
	docker build . --file=Dockerfile.vimpy -t vimpy:latest
