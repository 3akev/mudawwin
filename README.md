# Mudawwin | مُدَوِّن

This is an Arabic poetry-writing app written in Flutter. Not that there's anything stopping it 
from being used as a normal notepad app.

Of course, as it turns out, flutter still has far too many bugs in their `TextField`s. And
for an app that hinges completely on them, I find that it defeats the entire purpose.

Some examples of the issues I encountered: 
- https://github.com/flutter/flutter/issues/9471: In particular, this error message: 
`I/TextInputPlugin( 5007): Composing region changed by the framework. Restarting the input method.` 
which is associated with the following video courtesy of https://github.com/LiquidatorCoder/better_textfield.

    https://user-images.githubusercontent.com/42910433/147383865-c154c661-8e6e-4ebf-a5c5-c06e4c6dbf44.mp4

- https://stackoverflow.com/questions/72579246/flutter-textfield-flutter-rtl-cursor-position-problem-n-1:
I had to work around this with a custom `TextInputFormatter` which adds a trailing space.

Credits: https://www.amirifont.org.
