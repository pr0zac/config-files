// For more information on customizing Oni,
// check out our wiki page:
// https://github.com/onivim/oni/wiki/Configuration

const activate = oni => {
    console.log("config activated")

    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<f11>", "oni.debug.openDevTools")
    oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))
    oni.input.bind(["<enter>"], "contextMenu.select");
    oni.input.bind(["<tab>"], "contextMenu.next");
    oni.input.bind(["<s-tab>"], "contextMenu.previous");

    //
    // Or remove the default bindings:
    //
    // oni.input.unbind("<c-p>")
}

const deactivate = () => {
    console.log("config deactivated")
}

module.exports = {
    activate,
    deactivate,
    //add custom config here, such as
    "ui.colorscheme": "molokai",

    "oni.useDefaultConfig": false,
    //"oni.bookmarks": ["~/Documents"],
    "oni.loadInitVim": true,
    "editor.fontSize": "11px",
    "editor.fontFamily": "HackNerdFontComplete-Bold",

    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",

    "sidebar.enabled": false,
    "statusbar.enabled": false,
}

