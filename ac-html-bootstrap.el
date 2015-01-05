;;; ac-html-bootstrap.el --- auto complete source for html tags and attributes

;; Copyright (C) 2014 Olexandr Sydorchuk

;; Author: Olexandr Sydorchuk <olexandr.syd@gmail.com>
;; Version: 0.9.1
;; Keywords: html, auto-complete, rails, ruby
;; Package-Requires: ((ac-html "0.3.0"))
;; URL: https://github.com/osv/ac-html-bootstrap

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:


;;; Code:

(require 'ac-html)

(defconst ac-html-bootstrap-source-dir
  (expand-file-name "html-stuff" (file-name-directory load-file-name))
  "The directory where source of `ac-html-bootstrap' exists.")

;;;###autoload
(defun ac-html-bootstrap+ ()
  "Enable bootstrap ac-html completion"
  (interactive)
  (make-local-variable 'ac-html-source-dirs)
  (unless (assoc "Bootstrap" ac-html-source-dirs)
    (setq ac-html-source-dirs (cons (cons "Bootstrap" 'ac-html-bootstrap-source-dir) ac-html-source-dirs))))

(provide 'ac-html-bootstrap)
