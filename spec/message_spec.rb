require_relative '../message'

describe Message do
  it 'should remove all characters which are not letters' do
    @message = Message.new('@fo?o19')
    @message.caesar(0).should == 'FOO'
  end

  it 'should apply no shifts when passed 0' do
    @message = Message.new('foo')
    @message.caesar(0).should == @message.upcase
  end

  it 'should apply no changes to an upper-case message when passed 0' do
    @message = Message.new('FOO')
    @message.caesar(0).should == @message
  end

  it 'should apply the same change to all letters' do
    @message = Message.new('aaaaa')
    @message.caesar(1).should == 'bbbbb'
  end

  it 'should start at the beginning of the alphabet after passing \'z\'' do
    @message = Message.new('xyz')
    @message.caesar(3).should == 'abc'
  end

  it 'should keep spaces' do
    @message = Message.new(' this is a 9message9 ')
    @message.caesar(5).should == ' YMNX NX F RJXXFLJ '
  end
end
