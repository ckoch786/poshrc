(defun count-words-buffer ()
  "Count the number of words in the current buffer;
print a message in the minibuffer with the result."
  (interactive)
  (save-excursion
    (let ((count 0))
      (goto-char (point-min))
      (while (< (point) (point-max))
        (forward-word 1)
        (setq count (1+ count)))
      (message "buffer contains %d words." count))))

(defun count-lines-buffer ()
  "Print the number of lines in the buffer."
  (interactive)
  (save-excursion
    (let ((count 0))
      (goto-char (point-min))
      (while (< (point) (point-max))
        (evil-next-line)
        (setq count (1+ count))
      (message "buffer contains %d lines." count)))))

(defun count-words-region ()
  "Print the number of words in a region."
  (interactive)
  (save-excursion
    (let ((count 0))
      (goto-char ())))
  )

(defun what-line ()
  "Print the number of the line point is currently on.")

(mark)
(point)
(point-min)
;; TODO left off reading kill-region code from simple.el to see how emacs handles regions.

(defun fix-punctuation ()
  "query-replace all periods that lack doublespace after it.
TODO wire this up to be activated for text-mode and setup to do on save"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (query-replace ". ", ".  ")))
