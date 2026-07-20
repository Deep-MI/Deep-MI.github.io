#!/usr/bin/env ruby
# Runs HTMLProofer against the built site (./_site).
# Keeps the ignore-list in one readable, commented place instead of a long
# --ignore-urls string repeated on the command line and in the docs.

require 'html-proofer'

# Root-level pages that intentionally link to sibling Deep-MI repos which
# don't have their own GitHub Pages site (yet). Add new slugs here instead
# of editing CI or the docs.
EXTERNAL_PROJECT_STUBS = %w[
  fsqc
  LaPy
  BrainPrint
  FastSurfer
  neuroreg
  hipsta
  WhipperSnapPy
].freeze

options = {
  disable_external: true,
  allow_hash_href: true,
  ignore_urls: [
    %r{^http://127\.0\.0\.1},
    %r{^http://0\.0\.0\.0},
    %r{^http://localhost},
    *EXTERNAL_PROJECT_STUBS.map { |slug| %r{/#{slug}/?$} },
  ],
}

HTMLProofer.check_directory('./_site', options).run
