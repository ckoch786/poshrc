# TODO this needs to be added to C:\Users\CKoch\AppData\Roaming\Code\User\keybindings.json
// Place your key bindings in this file to override the defaults
[
    {
        "key": "ctrl+alt+r",
        "command": "workbench.action.terminal.runRecentCommand",
        "when": "terminalFocus"
    },
    // Allow ctrl+r again to go to the next command in the quick pick
    {
      "key": "ctrl+r",
      "command": "workbench.action.quickOpenNavigateNextInViewPicker",
      "when": "inQuickOpen && inTerminalRunCommandPicker"
    },
    {
      "key": "ctrl+c",
      "command": "workbench.action.closeQuickOpen",
      "when": "inQuickOpen && inTerminalRunCommandPicker"
    }
]