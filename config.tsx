// For more information on customizing Oni,
// check out our wiki page:
// https://github.com/onivim/oni/wiki/Configuration

const activate = oni => {
    console.log("config activated")

    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-f11>", "oni.debug.openDevTools")
    // oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))
    oni.input.bind(["<enter>"], "contextMenu.select");
    oni.input.bind(["<tab>"], "contextMenu.next");
    oni.input.bind(["<s-tab>"], "contextMenu.previous");
    oni.input.bind(["<c-j>"], "language.gotoDefinition");

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

    "oni.useDefaultConfig": false,
    //"oni.bookmarks": ["~/Documents"],
    "oni.loadInitVim": true,
    "ui.colorscheme": "n/a", // Load init.vim colorscheme, remove this line if wants Oni's default
    "editor.fontSize": "11px",
    "editor.fontFamily": "FiraCode-Bold",

    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",

    "sidebar.enabled": false,
    "statusbar.enabled": false,
    "tabs.mode": "native",

    "experimental.indentLines.enabled": true,
}

