require 'auditor'

describe Auditor do
  describe '.audit' do
    it 'should write the audit to a file' do
      message = "Hello"
      auditor = Auditor.new
      opened_file = spy("Opened File")
      allow(File).to receive(:open).with('audit.txt', 'a').
        and_yield(opened_file)

      auditor.audit(message)

      expect(opened_file).to have_received(:puts).with(message)
    end
  end
end