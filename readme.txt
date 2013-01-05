Cygwin Windows Explorer integration: Installation instructions
--------------------------------------------------------------------------------

IMPORTANT: The Explorer integration done by this setup has certain limitations.
Have a look at the file "knownerrors.txt" before you go ahead.

Please also note that if you apply this setup to an existing Cygwin
installation the file "/etc/fstab" will be overwritten, so back it up if it
contains custom entries.

You have to install Cygwin into "C:\cygwin".

The Windows Explorer integration depends on the stream editor "sed" to be
installed to work. Make sure you do install it during the Cygwin setup!
You can find it in the "Base" section.

You should run the file "finish_cygwin_installation.bat" BEFORE you launch the
Cygwin Bash shell for the first time, otherwise a reboot might be required for
the new Cygwin settings to take effect.

After you have successfully run the .bat file and this is a fresh Cygwin
installation, open a Cygwin Bash shell. If Cygwin prompts you to do so, run
the usual "mkpasswd" and "mkgroup" commands as described.
That's it, you're done.

Of course, everything has to be done with Administrator privileges.

The shell script "dragndroptest.sh" can be used to verify shell script double-
clicking and the drag&drop function with one or more items.

The custom Cygwin shell script icon is derived from the
"mimetypes/text-x-generic" icon from the Tango! project
(http://tango.freedesktop.org/).

Unrelated but useful:
Certain shell commands (for instance, "clear") depend on the "ncurses" package.
"ncurses" can be found in the "Utils" section.
