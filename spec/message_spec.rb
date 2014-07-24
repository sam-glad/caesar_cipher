require_relative '../message'

describe Message do
  it 'should remove all non-space characters which are not letters' do
    @message = Message.new('@fo?o19')
    @message.caesar_encrypt(0).should == 'FOO'
  end

  it 'should apply no shifts when passed 0' do
    @message = Message.new('foo')
    @message.caesar_encrypt(0).should == @message.text.upcase
  end

  it 'should apply no changes to an upper-case message when passed 0' do
    @message = Message.new('FOO')
    @message.caesar_encrypt(0).should == @message.text.upcase
  end

  it 'should apply the same change to all letters' do
    @message = Message.new('aaaaa')
    @message.caesar_encrypt(1).should == 'BBBBB'
  end

  it 'should start at the beginning of the alphabet after passing \'z\'' do
    @message = Message.new('xyz')
    @message.caesar_encrypt(3).should == 'ABC'
  end

  it 'should keep spaces' do
    @message = Message.new(' this is a 9message9 ')
    @message.caesar_encrypt(5).should == ' YMNX NX F RJXXFLJ '
  end

  it 'should work with negative numbers' do
    @message = Message.new('abc')
    @message.caesar_encrypt(-3).should == 'XYZ'
  end
end
