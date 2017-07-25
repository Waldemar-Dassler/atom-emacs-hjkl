{WorkspaceView} = require 'atom'

describe 'config', ->
  hideTabs = jasmine.createSpy 'hideTabs'
  hideSidebar = jasmine.createSpy 'hideSidebar'
  useEmacsCursor = jasmine.createSpy 'useEmacsCursor'
  useFuzzyFileFinder = jasmine.createSpy 'useFuzzyFileFinder'
  useFuzzyBufferFinder = jasmine.createSpy 'useFuzzyBufferFinder'

  beforeEach ->
    atom.config.set 'emacs-hjkl.hideTabs', undefined
    atom.config.set 'emacs-hjkl.hideSidebar', undefined
    atom.config.set 'emacs-hjkl.useEmacsCursor', undefined
    atom.config.set 'emacs-hjkl.useFuzzyFileFinder', undefined
    atom.config.set 'emacs-hjkl.useFuzzyBufferFinder', undefined

    atom.workspaceView = new WorkspaceView
    atom.workspaceView.on 'emacs:hide-tabs', hideTabs
    atom.workspaceView.on 'emacs:hide-sidebar', hideSidebar
    atom.workspaceView.on 'emacs:use-emacs-cursor', useEmacsCursor
    atom.workspaceView.on 'emacs:use-fuzzy-file-finder', useFuzzyFileFinder
    atom.workspaceView.on 'emacs:use-fuzzy-buffer-finder', useFuzzyBufferFinder

    require '../lib/config'

  it 'should ensure config exists', ->
    expect(atom.config.get('emacs-hjkl.hideTabs')).toBeDefined()
    expect(atom.config.get('emacs-hjkl.hideSidebar')).toBeDefined()
    expect(atom.config.get('emacs-hjkl.useEmacsCursor')).toBeDefined()
    expect(atom.config.get('emacs-hjkl.useFuzzyFileFinder')).toBeDefined()
    expect(atom.config.get('emacs-hjkl.useFuzzyBufferFinder')).toBeDefined()

  it 'should trigger corresponding events', ->
    expect(hideTabs).toHaveBeenCalled()
    expect(hideSidebar).toHaveBeenCalled()
    expect(useEmacsCursor).toHaveBeenCalled()
    expect(useFuzzyFileFinder).toHaveBeenCalled()
    expect(useFuzzyBufferFinder).toHaveBeenCalled()
