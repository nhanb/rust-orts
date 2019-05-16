debug: gui.html Cargo.lock Cargo.toml src/*
	cargo build

run: gui.html *
	cargo run

gui.html: elm.json gui/*
	elm make gui/Main.elm --output=gui.html

release:
	elm make gui/Main.elm --optimize --output=gui.html
	cargo build --release

clean:
	rm -r target gui.html elm-stuff
