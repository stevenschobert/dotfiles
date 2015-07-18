# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

# fixes an error with jshint
# https://github.com/atom-community/linter/issues/726#issuecomment-120666636
process.env.PATH = [
  "/Users/stevenschobert/.asdf/shims",
  "/usr/local/bin",
  process.env.PATH
].join(":")
