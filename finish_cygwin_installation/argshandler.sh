#!/bin/bash
# This script silently converts any Windows path it receives as its first
# argument into its Unix style equivalent and echoes the result to STDOUT.
# Basically, it does what "cygpath -u" does but doesn't complain when it
# receives an empty string.
# Since there are some escaping issues when it comes to passing paths with
# double backslashes (\\) to this script (for instance, UNC paths) it takes
# care of this as well (the "sed" part does this).
# The sed command puts another \ in front of text lines that start with a \,
# e.g. "\smbserver\share" becomes "\\smbserver\share".
if [ ! "$1" == "" ]
then
	cygpath -u "$(echo "$1" | sed -r -e 's/^[\]([^\].*)$/\\\\\1/')"
fi
