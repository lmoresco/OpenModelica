(tempo-define-template "testhead"
		       '("// name:     "
			 (let ((f (file-name-nondirectory (buffer-file-name))))
			   (substring f 0 (string-match "\\." f))) n
			 "// keywords: " (p "keywords: ") n
			 "// status:   " (p "status: ") n
			 "// " n
			 "// " p n
			 "// " n
			 ))
