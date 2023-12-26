print("Updating")

print("Updating Homebrew")
os.execute("brew reinstall librewolf --no-quarantine")
os.execute("brew upgrade")

print("Updating Bob")
os.execute("bob update --all")

print("Updating Nvim")
os.execute('nvim --headless +"Lazy! sync" +"MasonUpdate" +qa')

print("Updating Go")
os.execute("go-global-update")
