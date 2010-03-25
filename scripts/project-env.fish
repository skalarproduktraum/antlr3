#!/usr/bin/env fish

set -g __PATH $PATH
set -g __RUBYLIB $RUBYLIB

set -x ANTLR3_BASE (realpath .)
set -x PATH (realpath ./bin) (realpath ./scripts) (realpath ./vendor/bin) $PATH
set -x RUBYLIB (realpath ./lib) $RUBYLIB
set -x IRB_EXTRA (realpath ./config/antlr3.rb)

function etest
  set -l lib $ANTLR3_BASE/lib
  set -l dev $ANTLR3_BASE/dev-lib
  set -l config $ANTLR3_BASE/config/antlr3.rb
  ruby-1.9 -I"$lib:$dev" -r"$config" $argv --require 'enhanced-test' --format ANTLRFormatter --runner ANTLRRunner --backtrace
end

function top!
  cd $ANTLR3_BASE
end

function quit-project
  set -e ANTLR3_BASE
  set -e IRB_EXTRA
  set -x PATH $__PATH
  set -x RUBYLIB $__RUBYLIB
end
