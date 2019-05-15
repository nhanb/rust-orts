release: gui.html Cargo.lock Cargo.toml src/*
	cargo build --release

debug: gui.html Cargo.lock Cargo.toml src/*
	cargo build

run: gui.html Cargo.lock Cargo.toml src/*
	cargo run

gui.html: elm.json gui/*
	elm make gui/Main.elm --output=gui.html
