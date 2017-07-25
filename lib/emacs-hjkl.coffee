{CompositeDisposable} = require 'atom'
EmacsCursor = require './emacs-cursor'
EmacsEditor = require './emacs-editor'
KillRing = require './kill-ring'
Mark = require './mark'
State = require './state'

beforeCommand = (event) ->
  State.beforeCommand(event)

afterCommand = (event) ->
  Mark.deactivatePending()

  if State.yankComplete()
    emacsEditor = getEditor(event)
    for emacsCursor in emacsEditor.getEmacsCursors()
      emacsCursor.yankComplete()

  State.afterCommand(event)

getEditor = (event) ->
  # Get editor from the event if possible so we can target mini-editors.
  editor = event.target?.getModel?() ? atom.workspace.getActiveTextEditor()
  EmacsEditor.for(editor)

closeOtherPanes = (event) ->
  activePane = atom.workspace.getActivePane()
  return if not activePane
  for pane in atom.workspace.getPanes()
    unless pane is activePane
      pane.close()

module.exports =
  EmacsCursor: EmacsCursor
  EmacsEditor: EmacsEditor
  KillRing: KillRing
  Mark: Mark
  State: State

  config:
    alwaysUseKillRing:
      type: 'boolean',
      default: false,
      title: 'Use kill ring for built-in copy & cut commands.'
    killToClipboard:
      type: 'boolean',
      default: true,
      title: 'Send kills to the system clipboard'
    yankFromClipboard:
      type: 'boolean',
      default: false,
      title: 'Yank changed text from the system clipboard'
    killWholeLine:
      type: 'boolean',
      default: false,
      title: 'Always Kill whole line.'

  activate: ->
    if @disposable
      console.log "emacs-hjkl activated twice -- aborting"
      return

    State.initialize()
    document.getElementsByTagName('atom-workspace')[0]?.classList?.add('emacs-hjkl')
    @disposable = new CompositeDisposable
    @disposable.add atom.commands.onWillDispatch (event) -> beforeCommand(event)
    @disposable.add atom.commands.onDidDispatch (event) -> afterCommand(event)
    @disposable.add atom.commands.add 'atom-text-editor',
      # Navigation
      "emacs-hjkl:backward-char": (event) -> getEditor(event).backwardChar()
      "emacs-hjkl:forward-char": (event) -> getEditor(event).forwardChar()
      "emacs-hjkl:backward-word": (event) -> getEditor(event).backwardWord()
      "emacs-hjkl:forward-word": (event) -> getEditor(event).forwardWord()
      "emacs-hjkl:backward-sexp": (event) -> getEditor(event).backwardSexp()
      "emacs-hjkl:forward-sexp": (event) -> getEditor(event).forwardSexp()
      "emacs-hjkl:previous-line": (event) -> getEditor(event).previousLine()
      "emacs-hjkl:next-line": (event) -> getEditor(event).nextLine()
      "emacs-hjkl:backward-paragraph": (event) -> getEditor(event).backwardParagraph()
      "emacs-hjkl:forward-paragraph": (event) -> getEditor(event).forwardParagraph()
      "emacs-hjkl:back-to-indentation": (event) -> getEditor(event).backToIndentation()

      # Killing & Yanking
      "emacs-hjkl:backward-kill-word": (event) -> getEditor(event).backwardKillWord()
      "emacs-hjkl:kill-word": (event) -> getEditor(event).killWord()
      "emacs-hjkl:kill-line": (event) -> getEditor(event).killLine()
      "emacs-hjkl:kill-region": (event) -> getEditor(event).killRegion()
      "emacs-hjkl:copy-region-as-kill": (event) -> getEditor(event).copyRegionAsKill()
      "emacs-hjkl:append-next-kill": (event) -> State.killed()
      "emacs-hjkl:yank": (event) -> getEditor(event).yank()
      "emacs-hjkl:yank-pop": (event) -> getEditor(event).yankPop()
      "emacs-hjkl:yank-shift": (event) -> getEditor(event).yankShift()
      "emacs-hjkl:cut": (event) ->
        if atom.config.get('emacs-hjkl.alwaysUseKillRing')
          getEditor(event).killRegion()
        else
          event.abortKeyBinding()
      "emacs-hjkl:copy": (event) ->
        if atom.config.get('emacs-hjkl.alwaysUseKillRing')
          getEditor(event).copyRegionAsKill()
        else
          event.abortKeyBinding()

      # Editing
      "emacs-hjkl:delete-horizontal-space": (event) -> getEditor(event).deleteHorizontalSpace()
      "emacs-hjkl:delete-indentation": (event) -> getEditor(event).deleteIndentation()
      "emacs-hjkl:open-line": (event) -> getEditor(event).openLine()
      "emacs-hjkl:just-one-space": (event) -> getEditor(event).justOneSpace()
      "emacs-hjkl:transpose-chars": (event) -> getEditor(event).transposeChars()
      "emacs-hjkl:transpose-lines": (event) -> getEditor(event).transposeLines()
      "emacs-hjkl:transpose-sexps": (event) -> getEditor(event).transposeSexps()
      "emacs-hjkl:transpose-words": (event) -> getEditor(event).transposeWords()
      "emacs-hjkl:downcase-word-or-region": (event) -> getEditor(event).downcaseWordOrRegion()
      "emacs-hjkl:upcase-word-or-region": (event) -> getEditor(event).upcaseWordOrRegion()
      "emacs-hjkl:capitalize-word-or-region": (event) -> getEditor(event).capitalizeWordOrRegion()

      # Marking & Selecting
      "emacs-hjkl:set-mark": (event) -> getEditor(event).setMark()
      "emacs-hjkl:mark-sexp": (event) -> getEditor(event).markSexp()
      "emacs-hjkl:mark-whole-buffer": (event) -> getEditor(event).markWholeBuffer()
      "emacs-hjkl:exchange-point-and-mark": (event) -> getEditor(event).exchangePointAndMark()

      # Scrolling
      "emacs-hjkl:recenter-top-bottom": (event) -> getEditor(event).recenterTopBottom()
      "emacs-hjkl:scroll-down": (event) -> getEditor(event).scrollDown()
      "emacs-hjkl:scroll-up": (event) -> getEditor(event).scrollUp()

      # UI
      "emacs-hjkl:close-other-panes": (event) -> closeOtherPanes(event)
      "core:cancel": (event) -> getEditor(event).keyboardQuit()

  deactivate: ->
    document.getElementsByTagName('atom-workspace')[0]?.classList?.remove('emacs-hjkl')
    @disposable?.dispose()
    @disposable = null
    KillRing.global.reset()
