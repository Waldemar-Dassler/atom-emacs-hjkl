config = require './config-util'

config.watch 'emcas-hjkl.hideTabs', false, (value) ->
  atom.workspaceView.trigger 'emacs:hide-tabs', value

config.watch 'emcas-hjkl.hideSidebar', false, (value) ->
  atom.workspaceView.trigger 'emacs:hide-sidebar', value

config.watch 'emcas-hjkl.useEmacsCursor', true, (value) ->
  atom.workspaceView.trigger 'emacs:use-emacs-cursor', value

config.watch 'emcas-hjkl.useFuzzyFileFinder', false, (value) ->
  atom.workspaceView.trigger 'emacs:use-fuzzy-file-finder', value

config.watch 'emcas-hjkl.useFuzzyBufferFinder', false, (value) ->
  atom.workspaceView.trigger 'emacs:use-fuzzy-buffer-finder', value
