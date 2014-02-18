require 'spec_helper'

describe 'sws' do
  it 'replaces vim with Vim in markdown files' do
    # Edit temporary markdown file
    vim.edit!('test.markdown')

    # Insert some text
    vim.insert('vim is awesome. vim vim vim')

    # Save the file
    vim.write

    # Make sure vim has been replaced with Vim
    vim.echo('getline(".")').should eq 'Vim is awesome. Vim Vim Vim'
  end

  it "performs substitutions only in markdown files" do
    vim.edit!('test.rb')
    vim.insert('vim.edit! "foo"')
    vim.write
    vim.echo('getline(".")').should eq 'vim.edit! "foo"'
  end
end
