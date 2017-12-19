bugs whild install macvim with homebrew:
solution:
1, brew intsall macvim --with-override-system-vim

2, Xcode app is in the /Applications directory (NOT /Users/{user}/Applications) originally.

3, make it Point xcode-select to the Xcode app Developer directory using the following command insttead:
   sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

ps:Note: Make sure your Xcode app path is correct.

Xcode: /Applications/Xcode.app/Contents/Developer
Xcode-beta: /Applications/Xcode-beta.app/Contents/Developer


powerline fonts installation:
1, git clone https://github.com/powerline/fonts.git

2, cd fonts

3, ./install.sh
