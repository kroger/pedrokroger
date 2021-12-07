---
title: PyCharm as the Ultimate Python Debugger
author: Pedro Kroger
layout: post
date: 2015-03-05T15:07:44+00:00
url: /python-debugger/
categories:
  - Programming
  - PyCharm
  - Python
---

Many people use the standard Python debugger ([pdb][1] or [ipdb][2]) because it works
well and can be used as a standalone tool or with your favorite editor. I've used it for
years, but today I'm more productive using the PyCharm debugger. It can debug Python,
JavaScript, and Django and Jinja Templates (making the debugging process seamless in web
applications). Also, I don't have to worry about leaving `pdb.set_trace` calls around
anymore.

Since the process to run and debug code in PyCharm is similar, we will look how to run
code first (jump to the debugging section if you already know how to run code in PyCharm).

In this article shortcuts are written with the first letter of keyboard modifiers
followed by the actual keys in lower case. The keys are presented for both OS X and
Windows/Linux in the format (mac, win). For example, the shortcut (⌘-S-⌥-t, S-A-C-t)
means to press the keys ⌘, Shift, Option, and t at the same time on the Mac, and Shift,
Alt, Control, and t on Windows and Linux. When only one shortcut is presented, it will be
the same on all operating systems.


## Running Python Code

If we haven’t run any code in our project before, the icons to run and debug will be
disabled:

{% img run-disabled.png 80% %}


Some items will be disabled in the *Run* menu as well:

{% img run-menu.png 80% %}


To run a script for the first time, we need to either create a configuration (*Run→Edit
Configurations&hellip;*) or ask PyCharm to run the current file by going to
*Run→Run&hellip; (⌥-C-r, A-C-r)*, where PyCharm will automatically offer to run the
current file. In the following example I’m editing a file named `analysis.py`. Notice how
PyCharm creates a new configuration named `analysis`:

{% img run-dialog.png 80% %}


PyCharm will run the file and show a tool window with the results, if any.

{% img run-running.png 80% %}


The Run tool window has many buttons to help us deal with the running script. We can do
things like pause, stop, and rerun the script and move up and down the stack trace.

{% img run-icons-legend.png 80% %}


The following table summarizes the main actions. The [manual][3] has
a complete description.


<table class="docutils" border="1">
  <colgroup> <col width="25%" /> <col width="28%" /> <col width="47%" /> </colgroup> <tr class="row-odd">
    <th class="head">
      Name
    </th>

    <th class="head">
      Shortcut
    </th>

    <th class="head">
      Description
    </th>
  </tr>

  <tr class="row-even">
    <td>
      Rerun
    </td>

    <td>
      `(⌘-r, C-F5)`
    </td>

    <td>
      Stop the current process and run it again
    </td>
  </tr>

  <tr class="row-odd">
    <td>
      Stop
    </td>

    <td>
      `(⌘-F2, C-F2)`
    </td>

    <td>
      Stop the current process
    </td>
  </tr>

  <tr class="row-even">
    <td>
      Pause Output
    </td>

    <td>
    </td>

    <td>
      Keep running the process but don’t show its output
    </td>
  </tr>

  <tr class="row-odd">
    <td>
      Restore Layout
    </td>

    <td>
    </td>

    <td>
      Restore the default window layout, discarding the current one
    </td>
  </tr>

  <tr class="row-even">
    <td>
      Pin Tab
    </td>

    <td>
    </td>

    <td>
      Run code on a new tab
    </td>
  </tr>

  <tr class="row-odd">
    <td>
      Close
    </td>

    <td>
      `(⌘-w, S-C-F4)`
    </td>

    <td>
      Closes the current tab and terminate the process
    </td>
  </tr>

  <tr class="row-even">
    <td>
      Up the stack trace
    </td>

    <td>
      `(⌘-⌥-↑, A-C-↑)`
    </td>

    <td>
      Navigate up the stack trace
    </td>
  </tr>

  <tr class="row-odd">
    <td>
      Down the stack trace
    </td>

    <td>
      `(⌘-⌥-↓, A-C-↓)`
    </td>

    <td>
      Navigate down the stack trace
    </td>
  </tr>

  <tr class="row-even">
    <td>
      Use Soft Wraps
    </td>

    <td>
    </td>

    <td>
      Enable word wrap for long lines
    </td>
  </tr>

  <tr class="row-odd">
    <td>
      Clear All
    </td>

    <td>
    </td>

    <td>
      Remove all text in the console
    </td>
  </tr>
</table>

We can hide the Run tool window with *(⌘-4, A-4)*.

Once a script is run for the first time, it becomes available in the `Run` menu. PyCharm
will show the most recently run command in `Run→Run '<script name>' (C-r, S-F10)`, where
`<script name>` is the name of the Python file without the extension (`analysis`, in our
previous example).

This command will run the original file even if we are working on a different one. In our
example, if we are editing a different file (say `chorales.py`) and type `C-r `on the Mac
or `S-F10` on Windows or Linux, PyCharm will run the file `analysis.py`, since this is
the last file we ran. This is useful when we have a master script and are making
modifications to a sub-module, for instance.

{% img run-menu-analysis.png 80% %}


After we run the script for the first time, the related commands in the menubar will be
available, and we can choose the script to run there:

{% img run-analysis-menubar.png 80% %}


PyCharm will create a new tab every time we run a script. If we don’t close the previous
tab we may end up with many different tabs, so make sure you close each tab after
running, and are, in fact, on the right tab.

{% img run-tabs.png 80% %}


### New Configuration

When we want to run things with more control we need to create a configuration by going
to *Run→Edit Configurations&hellip;* and clicking on the + button *(⌘-n, A-Insert)*.
PyCharm will ask what type of configuration we want (that is, if we want to run a Python
script, a Django or Pyramid server, and so on) and will show the appropriate options for
each type.

{% img run-new-configuration.png 80% %}


We can choose the script to run, passing parameters if necessary, the Python interpreter,
and the working directory. We can also launch an external tool before running the script,
which is great if we need to do things like data pre-processing.

{% img run-new-configuration-setup.png 80% %}


In the Logs tab we can add log files to be shown in PyCharm’s console during the script
execution or save the console output to a file.

{% img run-with-log.png 80% %}


Naturally, we can have multiple configurations; we can switch between them by going to
*Run→Run&hellip; (⌥-C-r, A-C-r)* and picking the one we want.

{% img run-separate-files.png 80% %}


## The Python Debugger

To debug code in PyCharm, we need to create a new configuration in _Run→Edit
Configurations&hellip;_ or debug an existing script by going to *Run→Debug&hellip;
(⌥-C-d, S-A-F9)*. After that it will be available in
`Run→Debug '<script name>' (C-d, S-F9)`, where `<script name>` is the name of the Python
file without the extension (`analysis`, in our example). As you can see, it works just
like running code.

{% img run-menu-analysis.png 80% %}


Similarly to the `Run` command, the menubar will now be enabled and we can choose the
script to debug by clicking on the insect icon.

{% img debug-toolbar.png 80% %}


One of the main differences between running and debugging a script is that in debugging
we want to define breakpoints. In PyCharm, a breakpoint must be on a line with working
code; it can’t be on a line that is blank or starts with a comment. We create breakpoints
by clicking on the gutter on the left.

{% img debug-breakpoint.png 80% %}


We can also create a temporary breakpoint by Alt-clicking on the gutter. As the name
suggests, a temporary breakpoint will be removed after being hit. Notice that the
temporary breakpoint icon is different from the regular one. Check the [manual][4] for
more information about breakpoint icons.

{% img debug-temp-breakpoint.png 80% %}


PyCharm’s debug tool window has everything we expect in a graphical debugger. From here
we can navigate the call stack and inspect the data available in each stack frame. We can
keep an eye on some variables by adding them to the watch list.

{% img debug-view.png 80% %}


The debug tool window has many of the buttons we have seen in the Run tool window,
allowing us to pause, stop, and rerun the script. In addition, we can view the
breakpoints—also available in *Run→View Breakpoints&hellip; (⌘-S-F8, S-C-F8)*—and mute
(that is, disable) all breakpoints.

{% img debug-icons-legend.png 80% %}


The icons in the top right corner, allowing us to step in and out of the program, are the
ones we will use the most:

{% img debug-step-icons.png 80% %}


In the following image, we can see each icon with its name. The table below shows the
name, shortcut, and description for each icon.

{% img step-icons-legend.png 80% %}


<table class="docutils" border="1">
  <colgroup> <col width="25%" /> <col width="28%" /> <col width="47%" /> </colgroup> <tr class="row-odd">
    <th class="head">
      Name
    </th>

    <th class="head">
      Shortcut
    </th>

    <th class="head">
      Description
    </th>
  </tr>

  <tr class="row-even">
    <td>
      Show Execution Point
    </td>

    <td>
      `(⌥-F10, A-F10)`
    </td>

    <td>
      Go back to the execution point. Useful if we visit other files and want to go back
    </td>
  </tr>

  <tr class="row-odd">
    <td>
      Step Over
    </td>

    <td>
      `(F8)`
    </td>

    <td>
      Step to the next line
    </td>
  </tr>

  <tr class="row-even">
    <td>
      Step Into
    </td>

    <td>
      `(F7)`
    </td>

    <td>
      Descend into a method or function call on the next line
    </td>
  </tr>

  <tr class="row-odd">
    <td>
      Force Step Into
    </td>

    <td>
      `(S-⌥-F7, S-A-F7)`
    </td>

    <td>
      Descend into the method even if it’s to be skipped
    </td>
  </tr>

  <tr class="row-even">
    <td>
      Step Out
    </td>

    <td>
      `(S-F8)`
    </td>

    <td>
      Return to the line where the current function was called
    </td>
  </tr>

  <tr class="row-odd">
    <td>
      Run to Cursor
    </td>

    <td>
      `(⌥-F9, A-F9)`
    </td>

    <td>
      Run the code where the caret is located. Useful to skip stepping over uninteresting code
    </td>
  </tr>

  <tr class="row-even">
    <td>
      Evaluate Expression
    </td>

    <td>
      `(⌥-F8, A-F8)`
    </td>

    <td>
      Evaluate an expression or code fragment
    </td>
  </tr>
</table>

The variables pane is a great way to explore complex data. It was invaluable when I was
learning Django and getting acquainted with the `HttpRequest `object, for instance. In
the following example, we can see some [music21][5] data, especially the complex `Score`
class. The Variables pane helps me to inspect attributes such as `duration` and
`elements`.

{% img debug-complex-data.png 80% %}


We can see all breakpoints in *Run→View Breakpoints&hellip; (⌘-S-F8, S-C-F8)*. From here
we can add, remove, or edit breakpoints; and set conditional breakpoints and log messages
or expressions.

{% img debug-list-breakpoints.png 80% %}


One way to quickly edit a breakpoint is to right-click on the breakpoint on the gutter. A
popup will allow us to enable the breakpoint and add a condition.

{% img debug-condition.png 80% %}


We can also see the breakpoints by selecting the Favorites Tool *(⌘-2, A-2)*.

{% img debug-favorites.png 80% %}


A quick way to disable a breakpoint is by clicking on it with the Alt key. The breakpoint
icon will change.

{% img debug-disable1.png 80% %}


Another way to disable a breakpoint is by right-clicking on it and unchecking the first
option (“Line 93 in analysis.py enabled” in the following example).

{% img debug-disable2.png 80% %}


Besides defining breakpoints when a line of code is reached, we can define a breakpoint
that is triggered when an exception is thrown. To add an exception breakpoint, we go to
*Run→View Breakpoints&hellip; (⌘-S-F8, S-C-F8)* and select Python Exception Breakpoint
after clicking the + button.

{% img debug-exception-breakpoint.png 80% %}


We need to include the exception class by searching for its name. The search field works
with both built-in and custom exception classes.

{% img debug-select-class-exception.png 80% %}


Our new exception now appears on the list, where we can customize it.

{% img debug-new-exception.png 80% %}


In most cases, we want to activate the breakpoint when the exception is raised (the
default is to activate the breakpoint when the exception terminates):

{% img debug-new-exception-detail.png 80% %}


Having configured an exception breakpoint, PyCharm will create the breakpoint
automatically when the exception is raised (`ChoralException`, in our example). Notice
that the exception breakpoint icon is different from the regular one.

{% img debug-exception-breakpoint-raise.png 80% %}


### Python Prompt

Sometimes it’s useful to be able to access a Python prompt while debugging. We can do
this by clicking on the Console tab when the debugger is running and selecting the Show
Python Prompt icon.

{% img debug-python-prompt.png 80% %}


Now we can use the prompt to inspect and change the variables in the current scope.

{% img debug-python-prompt2.png 80% %}


### Evaluating Expressions

Although it’s super-useful to have a full Python prompt available while debugging, the
Evaluate Expression feature may be sufficient if we just want to quickly evaluate an
expression.

{% img debug-evaluate-expression1.png 80% %}


As expected, we can use any variable in the current scope:

{% img debug-evaluate-expression2.png 80% %}


If we select the Code Fragment Mode button, we can add multiple lines of code. Completion
works here as usual.

{% img debug-evaluate-expression3.png 80% %}


### Inspecting and Watching Variables

The fastest way to inspect the value of variables while debugging is by hovering the
cursor over a variable name. PyCharm will show the variable name and its value.

{% img debug-quick-variable.png 80% %}


And, as expected, we can inspect and set a variable value by choosing the correct option
in the popup menu on the Variables pane.

{% img debug-inspect-variable.png 80% %}


The same apply to watched variables; we can edit and inspect them by using the popup menu.

{% img debug-inspect-watch.png 80% %}


### Remote Debugging

PyCharm has support to debug code [remotely][6]. Probably, the most popular and useful
way is to debug code in a Vagrant box.

## Conclusion

PyCharm has a debugger that is second to none. If you want to learn more about PyCharm
and how to use it to debug JavaScript and Django templates, check my ebook, [Modern
Python Development with PyCharm](/pycharm-book/).

 [1]: https://docs.python.org/2/library/pdb.html
 [2]: https://pypi.python.org/pypi/ipdb
 [3]: http://www.jetbrains.com/pycharm/webhelp/run-tool-window.html
 [4]: http://www.jetbrains.com/pycharm/webhelp/breakpoints-icons-and-statuses.html
 [5]: http://web.mit.edu/music21/
 [6]: https://www.jetbrains.com/pycharm/webhelp/remote-debugging.html
