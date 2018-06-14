class MyValue
  include ValueObject
  attribute :foo
end

RSpec.describe ValueObject do
  describe ".new" do
    it "raises if you give it an unknown attribute" do
      expect do
        MyValue.new(foo: 'hello', unexpected_value: 'surprise')
      end.to raise_error(KeyError)
    end
  end

  describe ".attribute" do
    it "defines a reader" do
      expect(MyValue.new(foo: 'hello').foo).to eq('hello')
    end

    it "does not define a writer" do
      expect(MyValue.new(foo: 'hello')).not_to respond_to(:foo=)
    end
  end

  describe "#attributes" do
    it "is a hash of the attributes" do
      value = MyValue.new(foo: 'hello')
      expect(value.attributes).to eq(foo: 'hello')
    end
  end
end
