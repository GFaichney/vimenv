base:
	docker build --no-cache . --target=base -t vimbase:latest

vimgo: base
	docker build --no-cache . --file=Dockerfile.vimgo -t vimgo:latest

vimnode: base
	docker build --no-cache . --file=Dockerfile.vimnode -t vimnode:latest

vimpy: base
	docker build --no-cache . --file=Dockerfile.vimpy -t vimpy:latest

clean:
	docker rmi -f vimbase vimgo vimnode vimpy
