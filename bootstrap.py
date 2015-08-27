import os
import subprocess


def bootstrap():
    query = '''
This may overwrite existing files in your home directory.
Are you sure? (y/n)
'''

    answer = raw_input(query)

    if 'y' in answer.lower():
        os.symlink('.bash_profile', '~/.bash_profile')
        os.symlink('.bashrc', '~/.bashrc')
        os.symlink('.zshrc', '~/.zshrc')
        os.symlink('themes/', '~/.oh-my-zsh/custom/')

        subprocess.call(['bash', 'brew.sh'])
        subprocess.call(['bash', 'brew-cask.sh'])

if __name__ == '__main__':
    bootstrap()
