# Based on homebrew-alt duplicate vim.rb formula
#
# Make sure to rvm system before installing, or you'll get annoying symbol errors
#
# Also: http://jinpu.wordpress.com/2011/03/05/build-vim-with-python-support-on-mac-os/
#
# $ brew install -f python --framework
# $ cd /System/Library/Frameworks/Python.framework/Versions
# $ sudo ln -s /usr/local/Cellar/python/2.7.1/Frameworks/Python.framework/Versions/2.7 Current
# $ brew install ./vim.rb

require 'formula'

class Vim <Formula
  url 'https://vim.googlecode.com/hg/', :revision => 'f0cc719cd129'
  version '7.3.198'
  homepage 'http://www.vim.org/'

  head 'https://vim.googlecode.com/hg/'

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--enable-gui=no",
                          "--without-x",
                          "--disable-nls",
                          "--enable-multibyte",
                          "--with-tlib=ncurses",
                          "--enable-pythoninterp",
                          "--enable-rubyinterp",
                          "--with-features=huge"
    system "make"
    system "make install"
  end
end
