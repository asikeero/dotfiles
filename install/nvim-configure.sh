# Configure nvim (expext nvim to be a valid command)
~/.local/bin/nvim.appimage --headless -c q
~/.local/bin/nvim.appimage --headless -c "PackerSync" -c q
~/.local/bin/nvim.appimage --headless -c "LspInstall --sync pyright bashls" -c q
