## Atom Emacs HJKL

Emacs with hjkl move forward keybindings for Atom.

## Commands

### Navigation

    'alt-h': 'emacs-hjkl:backward-char'
    'alt-l': 'emacs-hjkl:forward-char'
    'alt-k': 'emacs-hjkl:previous-line'
    'alt-j': 'emacs-hjkl:next-line'
    'alt-b': 'emacs-hjkl:backward-word'
    'alt-f': 'emacs-hjkl:forward-word'
    'ctrl-alt-b': 'emacs-hjkl:backward-sexp'
    'ctrl-alt-f': 'emacs-hjkl:forward-sexp'
    'alt-[': 'emacs-hjkl:backward-paragraph'
    'alt-]': 'emacs-hjkl:forward-paragraph'
    'alt-m': 'emacs-hjkl:back-to-indentation'
    'alt-a': 'editor:move-to-beginning-of-line'
    'alt-<': 'core:move-to-top'
    'alt->': 'core:move-to-bottom'

### Panes

    'ctrl->': 'pane:split-right'
    'ctrl-<': 'pane:split-down'
    'ctrl-p': 'pane:close'
    'ctrl-o': 'emacs-hjkl:close-other-panes'
    'ctrl-l': 'window:focus-next-pane'
    'ctrl-h': 'window:focus-previous-pane'


### Killing & Yanking

    'alt-backspace': 'emacs-hjkl:backward-kill-word'
    'alt-d': 'emacs-hjkl:kill-word'
    'ctrl-i': 'emacs-hjkl:kill-line'
    '': 'emacs-hjkl:kill-region'
    '': 'emacs-hjkl:copy-region-as-kill'
    '': 'emacs-hjkl:append-next-kill'
    '': 'emacs-hjkl:yank'
    '': 'emacs-hjkl:yank-pop'
    '': 'emacs-hjkl:yank-shift'

Note that Atomic Emacs does not (yet) support prefix arguments, so to rotate the
kill ring forward, use `yank-shift` (equivalent to `yank-pop` in Emacs with a
prefix argument of -1).

### Editing

    '': 'emacs-hjkl:delete-horizontal-space'
    '': 'emacs-hjkl:delete-indentation'
    '': 'emacs-hjkl:open-line'
    '': 'emacs-hjkl:just-one-space'
    '': 'emacs-hjkl:transpose-chars'
    '': 'emacs-hjkl:transpose-words'
    '': 'emacs-hjkl:transpose-lines'
    '': 'emacs-hjkl:downcase-word-or-region'
    '': 'emacs-hjkl:downcase-word-or-region'
    '': 'emacs-hjkl:upcase-word-or-region'
    '': 'emacs-hjkl:upcase-word-or-region'
    '': 'emacs-hjkl:capitalize-word-or-region'
    'ctrl-j': 'editor:newline'
    '': 'core:undo'
    '': 'core:undo'
    '': 'autocomplete-plus:activate'
    '': 'autoflow:reflow-selection'
    '': 'editor:toggle-line-comments'

### Marking & Selecting

    '': 'emacs-hjkl:set-mark'
    '': 'emacs-hjkl:mark-sexp'
    '': 'emacs-hjkl:mark-whole-buffer'
    '': 'emacs-hjkl:exchange-point-and-mark'

### UI

    '': 'core:cancel'
    '': 'core:save'
    '': 'core:save-as'
    '': 'command-palette:toggle'
    '': 'symbols-view:toggle-file-symbols'
    '': 'fuzzy-finder:toggle-file-finder'
    '': 'fuzzy-finder:toggle-buffer-finder'
    '': 'core:close'
    '': 'pane:close'
    '': 'emacs-hjkl:close-other-panes'
    '': 'pane:split-down'
    '': 'pane:split-right'
    '': 'window:focus-next-pane'

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

* [Bug reports](https://github.com/Waldemar-Dassler/atom-emacs-hjkl/issues)
* [Source](https://github.com/Waldemar-Dassler/atom-emacs-hjkl)
* Patches: Fork on Github, send pull request.
* Include tests where practical.
* Leave the version alone, or bump it in a separate commit.
