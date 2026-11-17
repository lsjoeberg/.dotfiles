import pygments.token as pygt

# Configuration file for ipython.

c = get_config()

#------------------------------------------------------------------------------
# Custom Syntax Highlighting Colors: Use Terminal Theme
# https://stackoverflow.com/questions/14129278/how-do-i-customize-text-color-in-ipython
#------------------------------------------------------------------------------

c.TerminalInteractiveShell.highlighting_style_overrides = {

    # Standard Pygment Tokens
    pygt.Keyword:              '#ansigreen',
    pygt.Operator:             '#ansimagenta',
    pygt.Operator.Word:        '#ansimagenta',

    # IPython overwrites
    pygt.Token.Prompt:         '#ansigreen',
    pygt.Token.PromptNum:      '#ansidarkgreen bold',
    pygt.Token.OutPrompt:      '#ansired',
    pygt.Token.OutPromptNum:   '#ansidarkred bold',

    pygt.Token.Number:         '#ansigreen',
    pygt.Token.Operator:       '#ansimagenta',
    pygt.Token.String:         '#ansiyellow',
    pygt.Token.Name.Function:  '#ansicyan',
    pygt.Token.Name.Class:     '#ansicyan',
    pygt.Token.Name.Namespace: '#ansicyan',

    pygt.Name.Builtin:         '#ansigreen',
    pygt.Name.Function.Magic:  '#ansiblue',   # e.g. __init__
    pygt.Name.Variable.Magic:  '#ansiblue'    # e.g. __name__
}
