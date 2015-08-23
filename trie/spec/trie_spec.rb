require 'rspec'
require_relative '../trie'

describe Node do

  it 'should initialize without arguments' do
    trie = Node.new
    trie.value == nil && trie.childs == {}
    #true.should == false
  end

  it 'should initialize with arguments' do
    trie = Node.new(true)
    expect(trie.value).to be_truthy
  end

  it 'should add characters' do
    trie = Node.new
    trie.insert("a")
    expect(trie.childs["a"].value).to be_truthy
  end

  it 'should add a word' do
    trie = Node.new
    trie.insert("edwin")
    expect(trie.childs["e"].childs["d"].childs["w"].childs["i"].childs["n"].value).to be_truthy
  end

  it 'should have a Node child Class type' do
    trie = Node.new
    trie.insert("edwin")
    expect(trie.childs["e"].childs["d"].childs["w"].childs["i"].childs["n"]).to be_an_instance_of(Node)
  end

  it 'should add a bunch of words' do
    trie = Node.new
    trie.insert("edwin")
    trie.insert("elisia")
    trie.insert("goes")
    trie.insert("fishing")
    trie.insert("in")
    trie.insert("the")
    trie.insert("lake")
    expect(trie.childs["e"].childs["d"].childs["w"].childs["i"].childs["n"].value).to be_truthy
    expect(trie.childs["e"].childs["l"].childs["i"].childs["s"].childs["i"].childs["a"].value).to be_truthy
    expect(trie.childs["g"].childs["o"].childs["e"].childs["s"].value).to be_truthy
    expect(trie.childs["f"].childs["i"].childs["s"].childs["h"].childs["i"].childs["n"].childs["g"].value).to be_truthy
    expect(trie.childs["i"].childs["n"].value).to be_truthy
    expect(trie.childs["t"].childs["h"].childs["e"].value).to be_truthy
    expect(trie.childs["l"].childs["a"].childs["k"].childs["e"].value).to be_truthy
  end

  it 'should delete a word' do
    trie = Node.new
    trie.insert("edwin")
    trie.delete("edwin")
    expect(trie.childs["e"].childs["d"].childs["w"].childs["i"].childs["n"].value).to be_falsy
  end

end