# aider setup

## install steps

- get oauth token in nvim
  - Copilot auth info
- setx OPENAI_API_KEY <oauth_token>
- powershell with admin privileges:
  - New-Item -ItemType SymbolicLink -Path ~\.aider.conf.yml -Target .\aider.conf.yml

## TODO

- [ ] add actual aider installation steps
