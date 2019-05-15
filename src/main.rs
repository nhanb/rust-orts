#![windows_subsystem = "windows"]
extern crate web_view;
use web_view::*;

fn main() {
    let html = format!(
        r#"
    <!doctype html>
    <html>
        <body>
        <h1>Hello, world</h1>
        <p>Replace me</p>
        <script>{js}</script>
        </body>
    </html>
    "#,
        js = include_str!("../www/dist.js")
    );

    web_view::builder()
        .title("Page load example")
        .content(Content::Html(html))
        .size(600, 200)
        .resizable(true)
        .debug(true)
        .user_data(())
        .invoke_handler(|_webview, _arg| Ok(()))
        .run()
        .unwrap();
}
