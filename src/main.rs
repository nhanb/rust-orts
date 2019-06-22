#![windows_subsystem = "windows"]
extern crate web_view;
use web_view::*;

fn main() {
    let html = include_str!("../gui.html");

    web_view::builder()
        .title("Overly Repetitive Tedious Software")
        .content(Content::Html(html))
        .size(514, 170)
        .resizable(true)
        .debug(true)
        .user_data(())
        .invoke_handler(|_webview, _arg| Ok(()))
        .run()
        .unwrap();
}
