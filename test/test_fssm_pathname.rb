require 'helper'

class TestFssmPathname < Test::Unit::TestCase
  should_clean_pathname( '/', '/')
  should_clean_pathname( '.', '')
  should_clean_pathname( '.', '.')
  should_clean_pathname( '..', '..')
  should_clean_pathname( 'a', 'a')
  should_clean_pathname( '/', '/.')
  should_clean_pathname( '/', '/..')
  should_clean_pathname( '/a', '/a')
  should_clean_pathname( '.', './')
  should_clean_pathname( '..', '../')
  should_clean_pathname( 'a', 'a/')
  should_clean_pathname( 'a/b', 'a//b')
  should_clean_pathname( 'a', 'a/.')
  should_clean_pathname( 'a', 'a/./')
  should_clean_pathname( '.', 'a/..')
  should_clean_pathname( '.', 'a/../')
  should_clean_pathname( '/a', '/a/.')
  should_clean_pathname( '..', './..')
  should_clean_pathname( '..', '../.')
  should_clean_pathname( '..', './../')
  should_clean_pathname( '..', '.././')
  should_clean_pathname( '/', '/./..')
  should_clean_pathname( '/', '/../.')
  should_clean_pathname( '/', '/./../')
  should_clean_pathname( '/', '/.././')
  should_clean_pathname( 'a/b/c', 'a/b/c')
  should_clean_pathname( 'b/c', './b/c')
  should_clean_pathname( 'a/c', 'a/./c')
  should_clean_pathname( 'a/b', 'a/b/.')
  should_clean_pathname( '.', 'a/../.')
  should_clean_pathname( '/a', '/../.././../a')
  should_clean_pathname( '../../d', 'a/b/../../../../c/../d')

  should_add_pathname( '/', '/', '/')
  should_add_pathname( 'a/b', 'a', 'b')
  should_add_pathname( 'a', 'a', '.')
  should_add_pathname( 'b', '.', 'b')
  should_add_pathname( '.', '.', '.')
  should_add_pathname( '/b', 'a', '/b')
  should_add_pathname( '/', '/', '..')
  should_add_pathname( '.', 'a', '..')
  should_add_pathname( 'a', 'a/b', '..')
  should_add_pathname( '../..', '..', '..')
  should_add_pathname( '/c', '/', '../c')
  should_add_pathname( 'c', 'a', '../c')
  should_add_pathname( 'a/c', 'a/b', '../c')
  should_add_pathname( '../../c', '..', '../c')

  should_be_relative_pathname( "../a", "a", "b")
  should_be_relative_pathname( "../a", "a", "b/")
  should_be_relative_pathname( "../a", "a/", "b")
  should_be_relative_pathname( "../a", "a/", "b/")
  should_be_relative_pathname( "../a", "/a", "/b")
  should_be_relative_pathname( "../a", "/a", "/b/")
  should_be_relative_pathname( "../a", "/a/", "/b")
  should_be_relative_pathname( "../a", "/a/", "/b/")
  should_be_relative_pathname( "../b", "a/b", "a/c")
  should_be_relative_pathname( "../a", "../a", "../b")
  should_be_relative_pathname( "a", "a", ".")
  should_be_relative_pathname( "..", ".", "a")
  should_be_relative_pathname( ".", ".", ".")
  should_be_relative_pathname( ".", "..", "..")
  should_be_relative_pathname( "..", "..", ".")
  should_be_relative_pathname( "c/d", "/a/b/c/d", "/a/b")
  should_be_relative_pathname( "../..", "/a/b", "/a/b/c/d")
  should_be_relative_pathname( "../../../../e", "/e", "/a/b/c/d")
  should_be_relative_pathname( "../b/c", "a/b/c", "a/d")
  should_be_relative_pathname( "../a", "/../a", "/b")
  should_be_relative_pathname( "../../a", "../a", "b")
  should_be_relative_pathname( ".", "/a/../../b", "/b")
  should_be_relative_pathname( "..", "a/..", "a")
  should_be_relative_pathname( ".", "a/../b", "b")
  should_be_relative_pathname( "a", "a", "b/..")
  should_be_relative_pathname( "b/c", "b/c", "b/..")
end
