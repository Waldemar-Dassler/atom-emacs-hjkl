## Atomic Emacs

Emacs with hjkl move forward keybindings for Atom.

## Commands

### Navigation

    'alt-h': 'emacs-hjkl:backward-char'
    'left': 'emacs-hjkl:backward-char'
    'ctrl-f': 'emacs-hjkl:forward-char'
    'right': 'emacs-hjkl:forward-char'
    'alt-b': 'emacs-hjkl:backward-word'
    'alt-left': 'emacs-hjkl:backward-word'
    'alt-f': 'emacs-hjkl:forward-word'
    'alt-right': 'emacs-hjkl:forward-word'
    'ctrl-alt-b': 'emacs-hjkl:backward-sexp'
    'ctrl-alt-f': 'emacs-hjkl:forward-sexp'
    'alt-{': 'emacs-hjkl:backward-paragraph'
    'alt-}': 'emacs-hjkl:forward-paragraph'
    'alt-m': 'emacs-hjkl:back-to-indentation'
    'ctrl-a': 'editor:move-to-beginning-of-line'
    'ctrl-s': 'find-and-replace:show'
    'ctrl-r': 'find-and-replace:show'
    'alt-<': 'core:move-to-top'
    'alt->': 'core:move-to-bottom'

### Killing & Yanking

    'alt-backspace': 'emacs-hjkl:backward-kill-word'
    'alt-delete': 'emacs-hjkl:backward-kill-word'
    'alt-d': 'emacs-hjkl:kill-word'
    'ctrl-k': 'emacs-hjkl:kill-line'
    'ctrl-w': 'emacs-hjkl:kill-region'
    'alt-w': 'emacs-hjkl:copy-region-as-kill'
    'ctrl-alt-w': 'emacs-hjkl:append-next-kill'
    'ctrl-y': 'emacs-hjkl:yank'
    'alt-y': 'emacs-hjkl:yank-pop'
    'alt-shift-y': 'emacs-hjkl:yank-shift'

Note that Atomic Emacs does not (yet) support prefix arguments, so to rotate the
kill ring forward, use `yank-shift` (equivalent to `yank-pop` in Emacs with a
prefix argument of -1).

### Editing

    'alt-\\': 'emacs-hjkl:delete-horizontal-space'
    'alt-^': 'emacs-hjkl:delete-indentation'
    'ctrl-o': 'emacs-hjkl:open-line'
    'alt-space': 'emacs-hjkl:just-one-space'
    'ctrl-t': 'emacs-hjkl:transpose-chars'
    'alt-t': 'emacs-hjkl:transpose-words'
    'ctrl-x ctrl-t': 'emacs-hjkl:transpose-lines'
    'ctrl-x ctrl-l': 'emacs-hjkl:downcase-word-or-region'
    'alt-l': 'emacs-hjkl:downcase-word-or-region'
    'ctrl-x ctrl-u': 'emacs-hjkl:upcase-word-or-region'
    'alt-u': 'emacs-hjkl:upcase-word-or-region'
    'alt-c': 'emacs-hjkl:capitalize-word-or-region'
    'ctrl-j': 'editor:newline'
    'ctrl-/': 'core:undo'
    'ctrl-_': 'core:undo'
    'alt-/': 'autocomplete-plus:activate'
    'alt-q': 'autoflow:reflow-selection'
    'alt-;': 'editor:toggle-line-comments'

### Marking & Selecting

    'ctrl-space': 'emacs-hjkl:set-mark'
    'ctrl-alt-space': 'emacs-hjkl:mark-sexp'
    'ctrl-x h': 'emacs-hjkl:mark-whole-buffer'
    'ctrl-x ctrl-x': 'emacs-hjkl:exchange-point-and-mark'

### UI

    'ctrl-g': 'core:cancel'
    'ctrl-x ctrl-s': 'core:save'
    'ctrl-x ctrl-w': 'core:save-as'
    'alt-x': 'command-palette:toggle'
    'alt-.': 'symbols-view:toggle-file-symbols'
    'ctrl-x ctrl-f': 'fuzzy-finder:toggle-file-finder'
    'ctrl-x b': 'fuzzy-finder:toggle-buffer-finder'
    'ctrl-x k': 'core:close'
    'ctrl-x 0': 'pane:close'
    'ctrl-x 1': 'emacs-hjkl:close-other-panes'
    'ctrl-x 2': 'pane:split-down'
    'ctrl-x 3': 'pane:split-right'
    'ctrl-x o': 'window:focus-next-pane'

### Something missing?

Feel free to suggest features on the Github issue tracker, or better yet, send a
pull request!

## Windows Note

Some common Emacs keystrokes conflict with the default key bindings on Atom for
Windows in unexpected ways. For example, `ctrl-k` (kill-line on emacs) is a
prefix key for a set of pane management commands in Atom for Windows. The result
is that after pressing `ctrl-k`, Atom will wait for 2 seconds to determine if it
should treat this as a full command, or the beginning of another command, making
`kill-line` feel "slow".

You can of course disable this by disabling the all built-in key bindings that
start with `ctrl-k` in your `keymaps.config` file. You can also do this a little
easier with the [disable-keybindings][disable-keybindings] package.

[disable-keybindings]: https://atom.io/packages/disable-keybindings

## Contributing

* [Bug reports](https://github.com/avendael/emacs-hjkl/issues)
* [Source](https://github.com/avendael/emacs-hjkl)
* Patches: Fork on Github, send pull request.
 * Include tests where practical.
 * Leave the version alone, or bump it in a separate commit.
