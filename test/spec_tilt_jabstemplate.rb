require 'bacon'
require 'tilt'

begin
  require 'jabs'

  describe Tilt::JabsTemplate do
    it "is registered for '.jabs' files" do
      Tilt['test.jabs'].should.equal Tilt::JabsTemplate
    end

    it "compiles and evaluates the template on #render" do
      template = Tilt::JabsTemplate.new { |t| ":ready" }
      template.render.should.equal `echo ":ready" | jabs`.chomp
    end
  end

rescue LoadError => boom
  warn "Tilt::Jabs (disabled)\n"
end
