an_attribute_name =
  attribute(
    "external_ip", {}
  )

control 'check_output' do
  describe an_attribute_name do
    it { should_not eq '' }
    it { should_not eq '127.0.0.1' }
  end
end
