# Saving kbd-macros
## To save to a file for later use:
(kmacro-name-last-macro)
(insert-kbd-macro) ;; to save to file
### Use existing macro
(load-file)
or
C-x e the macro to load it
In either case you then can you M-x name-of-macro to run it
or you can bind the macro to a key sequence

## To save bind to a key to reuse temporarily
(kmacro-bind-to-key)

See https://www.gnu.org/software/emacs/manual/html_node/emacs/Save-Keyboard-Macro.html
