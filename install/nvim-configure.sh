# Configure nvim (expext nvim to be a valid command)
nvim --headless -c "PackerSync" -c q
nvim --headless -c "LspInstall --sync pyright bashls" -c q
