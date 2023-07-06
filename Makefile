all: configure build

configure:
	cmake -G "Xcode" -B dist

build: dist
	cmake --build dist

open: dist
	open ./dist/Debug/MyObjectiveCProject.app

clean:
	rm -rf ./dist

